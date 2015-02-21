<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 21/2/15
 * Time: 10:25 PM
 */

class TutorController extends Controller{

    public function postSignup(){
        $input=Input::all();
        $rule=array(
            'first_name'=>'required',
            'last_name'=>'required',
            'email'=>'required|email|unique:user',
            'address1'=>'required',
            'postcode'=>'required',
            'phone'=>'required',
            'mobile'=>'required',
            'username'=>'required|unique:user',
            'password'=>'required',
            'password_confirm'=>'required|same:password',
            'description'=>'required',
            'availability'=>'required'
        );

        $v=Validator::make($input,$rule);
        if($v->fails()){



            return Redirect::back()->withInput()->withErrors($v->errors());
        }else{

            $confirm_code=str_random('30');
            $data=new Login();
            $data->email=Input::get('email');
            $data->username=Input::get('username');
            $data->password=Hash::make(Input::get('password'));
            $data->type='tutor';
            $data->confirm_code=$confirm_code;
            $data->save();

            //userid
             $user_id=Login::where('username',Input::get('username'))->pluck('id');

             $data=new Tprofile();
             $data->title=Input::get('title');
             $data->first_name=Input::get('first_name');
             $data->last_name=Input::get('last_name');
             $data->email=Input::get('email');
             $data->address1=Input::get('address1');
             $data->address2=Input::get('address2');
             $data->country=Input::get('country');
             $data->city=Input::get('city');
             $data->postcode=Input::get('postcode');
             $data->phone=Input::get('phone');
             $data->mobile=Input::get('mobile');
             $data->dob=Input::get('year').'-'.Input::get('month').'-'.Input::get('day');
             $data->description=Input::get('description');
             $data->availability=Input::get('availability');
             $data->user_id=$user_id;
             $data->save();

            return Redirect::back()->with('success','Your account has successfully created. Thanks');

        }
    }
}