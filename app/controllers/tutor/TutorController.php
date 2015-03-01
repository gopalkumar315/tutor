<?php

/**
 * Created by PhpStorm.
 * User: john
 * Date: 21/2/15
 * Time: 10:25 PM
 */
class TutorController extends Controller
{

    public function postSignup()
    {
        $input = Input::all();
        $rule = array(
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email|unique:user',
            'address1' => 'required',
            'postcode' => 'required',
            'phone' => 'required',
            'mobile' => 'required',
            'username' => 'required|unique:user',
            'password' => 'required|min:6',
            'password_confirm' => 'required|same:password',
            'description' => 'required',
            'availability' => 'required'
        );

        $v = Validator::make($input, $rule);
        if ($v->fails()) {

            return Redirect::back()->withInput()->withErrors($v->errors());
        } else {

            $confirm_code = str_random('30');
            $data = new Login();
            $data->email = Input::get('email');
            $data->username = Input::get('username');
            $data->password = Hash::make(Input::get('password'));
            $data->type = 'tutor';
            $data->confirm_code = $confirm_code;
            $data->save();

            //userid
            $user_id = Login::where('username', Input::get('username'))->pluck('id');
            Social::create(array('user_id',$user_id));

            $data = new Tprofile();
            $data->title = Input::get('title');
            $data->first_name = Input::get('first_name');
            $data->last_name = Input::get('last_name');
            $data->email = Input::get('email');
            $data->address1 = Input::get('address1');
            $data->address2 = Input::get('address2');
            $data->country = Input::get('country');
            $data->city = Input::get('city');
            $data->postcode = Input::get('postcode');
            $data->phone = Input::get('phone');
            $data->mobile = Input::get('mobile');
            $data->dob = Input::get('year') . '-' . Input::get('month') . '-' . Input::get('day');
            $data->description = Input::get('description');
            $data->availability = Input::get('availability');
            $data->user_id = $user_id;
            $data->save();
            return Redirect::back()->with('success', 'Your account has successfully created. Thanks');
        }
    }

    public function postSignin()
    {

        $input = Input::all();

        $rule = array(
            'username' => 'required',
            'password' => 'required'
        );

        $v = Validator::make($input, $rule);
        if ($v->fails()) {
            return Redirect::back()->withInput()->withErrors($v->errors());
        } else {


            $field = filter_var(Input::get('username'), FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
            $input = array(
                $field => Input::get('username'),
                'password' => Input::get('password'),
            );



            Auth::tutor()->attempt($input, true);
            if (Auth::tutor()->check()) {
               return Redirect::to('tpanel/index');
            } else {
                return Redirect::back()->with('success','Invalid Username/Password')->withInput(Input::except('password'))->withErrors($v->errors());
            }
        }
    }

    public function getLogout(){
        Auth::tutor()->logout();
    }


    //password forgot of tutor and send email
    public function postForgot(){
        $input=Input::all();
        $rule=array(
            'username'=>'required'
        );
        $v=Validator::make($input,$rule);
        if($v->fails()){
                return Redirect::back()->withInput()->withErrors($v->errors());
        }else{
            $data=Login::where('username',Input::get('username'))->first(array('id','username','email'));
            if(count($data)>0){
                $reset_code=str_random(40);

                Login::where('id',$data->id)->update(array('reset'=>$reset_code));

                $content=array(
                    'link' => URL::to('tutor/reset/'.$data->username.'/'.$reset_code)
                );
                print_r($content);

//                Mail::send('emails.tutor_reset_password', $content, function ($message) use ($data) {
//                    $message->to($data->email, 'Tutor Password Reset')->subject('Tutor Password Reset');
//                });

              //  return Redirect::back()->with('success','Reset password link has send to you email. thanks!');

            }else{
                return Redirect::back()->with('success','Username does not exists.')->withInput();
            }

        }
    }


    public function getReset($username,$reset_code){

        $data=Login::where('username',$username)->where('reset',$reset_code)->first();

        //if username and reset code exits in login
        if(count($data)>0){
          $time2= strtotime(date('Y-m-d H:i:s'));
          $time1= strtotime($data->updated_at);
          $diff=round(abs($time2 - $time1) / 60,0);

           if($diff > 15){
                Login::where('id',$data->id)->update(array('reset'=>''));
                return Redirect::to('index/forgot')->with('success','Sorry, Link has expired');
           }else{
                return View::make('tutor.reset')->with('data',$data);
           }

        }else{
            return Redirect::to('index/forgot')->with('success','Invalid Username');
        }
    }

    //reset done
    public function postResetpassword(){
        $input=Input::all();
        $rule=array(
            'password'=>'required',
            'password_confirm'=>'required|same:password'
        );

        $v=Validator::make($input,$rule);
        if($v->fails()){
            return Rirect::back()->withErrors($v->errors());
        }else{
            $data=Login::where('username',$input['username'])->where('reset',$input['reset_code'])->first();
            $data->password=Hash::make($input['password']);
            $data->reset='';
            $data->save();

            return Redirect::to('index/signin')->with('success','Please Login, password has reset ');
        }
    }



}