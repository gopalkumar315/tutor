<?php

class LoginController extends Controller {

    /**
     * Setup the layout used by the controller.
     *
     * @return void
     */

     public function login(){
         $input=Input::all();
         $rule=array(
             'email'=>'required|email',
             'password'=>'required'
         );

         $v=Validator::make($input,$rule);

         if($v->fails()){
             return Redirect::back()->withInput()->withErrors($v->errors());
         }else{

             Auth::admin()->attempt($input,true);
             if(Auth::admin()->check())
             {
                 return Redirect::to('admin/index');
             }
             else
             {
                 return Redirect::to('/')->with('failure', 'Invalid User')->withInput();
             }
         }
     }

    /**
     * logouot of admin panel
     * @return mixed
     */
    public function logout(){
        Auth::admin()->logout();
        return Redirect::to('/');
    }

    public function forgot(){
         $reset=str_random(60);
         $data=Login::where('type','admin')->first();
         $data->reset=$reset;
         $data->save();

         $data=array(
             'link' => URL::to('admin/reset/', $reset)
         );

        Mail::send('emails.admin', $data, function ($message) use ($data) {
            $message->to('Gopalkumar315@gmail.com', 'Hello Admin')->subject('Admin Password Reset');
        });

        return Redirect::to('/')->with('message','Your Password Reset Link has been sent to your email');
    }

    //pass reset id
    public function reset($id){
        return View::make('admin.reset')->with('id',$id);
    }

    //reset done
    public function reset_password(){
        $input=Input::all();
        $rule=array(
            'type_new_password'=>'required',
            'type_once_again'=>'required|same:type_new_password'
        );

        $v=Validator::make($input,$rule);
        if($v->fails()){
            return Redirect::back()->withErrors($v->errors());
        } else {
            $data=Login::where('reset',Input::get('id'))->where('type','admin')->first();
            $data->password=Hash::make(Input::get('type_new_password'));
            $data->reset='';
            $data->save();
            return Redirect::to('/')->with('message','Your Password Has reset');
        }
    }

    //lock screen
    public function lock(){
        if(Auth::admin()->check())
        {
            $data=Auth::admin()->get();
            Session::put('email',$data->email);
            Session::put('type',$data->type);
            Auth::admin()->logout();
        }

        return View::make('admin.lock');
    }

    public function lock_open(){
        $input=Input::all();
        $rule=array(
            'password'=>'required'
        );
        $v=Validator::make($input,$rule);
        if($v->fails()){
            return Redirect::to('admin/lock')->withErrors($v->errors());
        }else{

            $input=array(
                'email'=>Session::get('email'),
                'password'=>Input::get('password'),
                'type'=>Session::get('type')
            );
            Auth::admin()->attempt($input,true);
            if(Auth::admin()->check())
            {
                Session::flush();
                return Redirect::to('admin/index');
            }
            else
            {
                return Redirect::back();
            }
        }

    }

}
