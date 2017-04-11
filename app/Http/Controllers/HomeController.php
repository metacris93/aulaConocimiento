<?php

/*
 * Taken from
 * https://github.com/laravel/framework/blob/5.2/src/Illuminate/Auth/Console/stubs/make/controllers/HomeController.stub
 */

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Auth;
use App\EvaluacionUsers;
use App\Evaluacion;
use Session;
use Redirect;
use Config;
use Crypt;
use Illuminate\Contracts\Encryption\DecryptException;


/**
 * Class HomeController
 * @package App\Http\Controllers
 */
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth', ['except' => 'homePage']); 
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function index()
    {   
        $results = DB::select(

        'select count(ev.id) as result from taller as ta 
    inner join evaluacion as ev on (ev.taller_id = ta.id)
where ta.curso_id = 1');

        $user=Auth::user()->id;
        $results2 = DB::select('select count(evalus.id) as result2 from taller as ta 
    inner join evaluacion as ev on (ev.taller_id = ta.id)
    inner join evaluacion_users as evalus on (evalus.evaluacion_id = ev.id and evalus.users_id = ?)
where ta.curso_id = 1',[$user]);
       
        $total=$results[0]->result;
        $realizadas=$results2[0]->result2;

        $no_realizadas=$total-$realizadas;
        
        if($no_realizadas<0){
            $no_realizadas=0;
        }
        $collection = ([
            (object)['name' => 'Realizadas', 'value' => $realizadas],
            (object)['name' => 'No realizadas', 'value' => $no_realizadas]
         ]);
        $eval=null;
        if(EvaluacionUsers::all()->last()){
            $ultimo=EvaluacionUsers::all()->last()->evaluacion_id;
            $eval=Evaluacion::find($ultimo);
        }
        
        $tutoria='no existen secciones realizadas';
         if($eval){
         $tutoria=$eval->entaller->titulo;
         }
        return view('home',['pastel'=>$collection])->with('tutoria',$tutoria);
    }

    /* Inicio - Integración con aula del conocimiento CJE*/
    public function homePage()
    {
        if(isset($_GET['tokenhc'])){
            
            $payload = Crypt::decrypt(trim($_GET['tokenhc']));
            $tokenGestion = $payload['tokenGestion'];
            $usernameGestion = $payload['usernameGestion'];

            if(!Auth::check()){

                $userAulaByUsernameGestion = DB::table('users')->where('username', $usernameGestion)->first();
                if(!is_null($userAulaByUsernameGestion)){

                    //Autenticación por ID del usuario Aula
                    Auth::loginUsingId($userAulaByUsernameGestion->id);

                    if(Auth::check()){
                        
                        Session::put('usernameGestion', $usernameGestion);
                        Session::put('tokenGestion', $tokenGestion);

                        unset($payload, $tokenGestion, $usernameGestion);

                        switch (auth()->user()->rol) {
                            case '0'://estudiante
                                Session::put('idUser', 'estudiante');
                                Session::put('Username', $userAulaByUsernameGestion->username);
                            break;
                            case '1'://administrador
                                Session::put('idUser', 'administrador');
                                Session::put('Username', $userAulaByUsernameGestion->username);
                            break;
                            default:
                                return Redirect::Back();
                            break;
                        }
                        Session::save();
                        return Redirect::to('home');
                    }
                }
                unset($payload, $tokenGestion, $usernameGestion);
                return Redirect::Back();
            }
            else{
                
                if(strcmp(Session::get('tokenGestion'), $tokenGestion) == 0 && 
                   strcmp(Session::get('usernameGestion'), $usernameGestion) == 0){
                    
                    $idUser = Session::get('idUser');
                    unset($payload, $tokenGestion, $usernameGestion);
                    switch ($idUser) {
                        case 'estudiante':
                            return Redirect::to('home');
                        break;
                        case 'administrador':
                            return Redirect::to('home');
                        break;
                        default:
                            return view('layouts/HDCImage');
                        break;
                    }
                }
                else{

                    unset($payload, $tokenGestion, $usernameGestion);
                    Auth::logout();
                    Session::flush();
                    return Redirect::to(Config::get('constantes.APP_AULA_URL').':'.Config::get('constantes.APP_AULA_PORT')
                        .'/?tokenhc='.$_GET['tokenhc']);

                }
            }
        }
        else{
            return Redirect::to(Config::get('constantes.APP_GESTION_URL').':'.Config::get('constantes.APP_GESTION_PORT').'/');
        }
    }

    public function moduloGestion()
    {
        return Redirect::to(Config::get('constantes.APP_GESTION_URL').':'.Config::get('constantes.APP_GESTION_PORT')
            .'/aulaConocimiento/?tokenac='.Crypt::encrypt(
            [
                'usernameAula' => Session::get('usernameGestion'),
                'tokenAula' => Session::get('tokenGestion')
            ]));     
    }
            
    /* Fin - Integración con aula del conocimiento */
}