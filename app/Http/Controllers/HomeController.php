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

    public function homePage()
    {
        /* Inicio - Integración con aula del conocimiento - CJE */

        //Si no existe user logeado y existe parametro usernameAula,
        //obtengo el mismo usuario de base Aula
        if(!Auth::check() && isset($_GET['usernameAula'])){
            $usernameAula = trim($_GET['usernameAula']);
            $userAulaByUsernameAula = DB::table('users')->where('username', $usernameAula)->first();

            if(!is_null($userAulaByUsernameAula)){
                //Autenticación por ID del usuario Aula
                Auth::loginUsingId($userAulaByUsernameAula->id);
                Session::put('usernameGestion' , $usernameAula);
                if(Auth::check()){
                    switch (auth()->user()->rol) {
                        case '0'://estudiante
                            Session::put('idUser', 'estudiante');
                            Session::put('Username', $userAulaByUsernameAula->username);
                        break;
                        case '1'://administrador
                            Session::put('idUser', 'administrador');
                            Session::put('Username', $userAulaByUsernameAula->username);
                        break;
                        default:
                            return Redirect::Back();
                        break;
                    }
                    return Redirect::to('home');
                }
            }
            return Redirect::Back();
        
        /* Fin - Integración con aula del conocimiento */
        }
        else{
            $idUser = Session::get('idUser');
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
            return view('layouts/HDCImage');
        }
    }

    public function moduloGestion()
    {
        return Redirect::to(env('APP_GESTION_URL').':'.env('APP_GESTION_PORT').'/aulaConocimiento/?usernameGestion='.Session::get('usernameGestion'));        
    }
}