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
use App\User;
use LRedis as Redis;


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
        $this->middleware('auth', ['except' => ['homePage' , 'Redis', 'AulaRedis']]); 
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
        $idUser = Session::get('idUser');
        switch ($idUser) {
            case 'estudiante':
                return Redirect::to('home');
            break;
            case 'administrador':
                return Redirect::to('home');
            break;
            default:
                return view('auth/login');
            break;
        }
        return view('auth/login');
    }

    public function AulaRedis($username , $token)
    {
        $redis = Redis::connection();        
        if($redis->exists($username))
        {
            $_token = $redis->get($username);
            $userDB = DB::table('users')->where('username',$username)->first();
            if( strcmp($_token , $token) == 0 )
            {   
                Session::put('Username', $userDB->username);
                Auth::loginUsingId($userDB->id , true);
                switch ($userDB->rol) {
                    case '0':
                        Session::put('idUser', 'estudiante');
                    break;
                    case '1':
                        Session::put('idUser', 'administrador');
                    break;
                    default:
                        $args = array(
                            'error' => 'El rol del usuario es desconocido'
                        );
                        return view('errors.403')->with( 'errores' , $args);
                    break;
                }
                $redis->close();
                return Redirect::to('home');
            }
            else
            {
                $args = array(
                    'error' => 'Error en el token'
                );
                return view('errors.403')->with( 'errores' , $args);
            }
        }
        else
        {
            $args = array(
                'error' => 'El usuario no esta autenticado'
            );
            return view('errors.403')->with( 'errores' , $args);
        }
        
    }

}