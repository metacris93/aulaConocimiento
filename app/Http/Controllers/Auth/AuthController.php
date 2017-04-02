<?php

namespace App\Http\Controllers\Auth;

use App\User;
use Validator;
use Auth;
use Input;
use Redirect;
use DB;
use Session;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Contracts\Auth\Authenticatable;

class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    protected $username = 'username';

    /**
     * Create a new authentication controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware($this->guestMiddleware(), ['except' => 'Salir']);
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|confirmed|min:6',
            'terms' => 'required',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return User
     */
    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }

    public function iniciarSesion(){
        $username = Input::get('username');
        $password = Input::get('password');
        if(Auth::attempt(['username' => $username, 'password' => $password])){
            $userDB = DB::table('users')->where('username',$username)->first();
            switch ($userDB->rol) {
                case '0'://estudiante
                    Session::put('idUser', 'estudiante');
                    Session::put('Username', $userDB->username);
                break;
                case '1'://administrador
                    Session::put('idUser', 'administrador');
                    Session::put('Username', $userDB->username);
                break;
                default:
                    return Redirect::to('/');
                break;
            }
            return Redirect::to('home');
        }else{
            error_log('Lo sentimos, su usuario o contrase&ntilde;a son incorrectos.');
        }
            return Redirect::to('/');        
    }

    public function Salir()
    {
        Auth::logout();
        Session::flush();
        return Redirect::to('/');
    }
}
