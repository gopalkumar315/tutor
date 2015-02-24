<?php
class TindexController extends Controller{

    public function getIndex(){
        return View::make('tutor.index')->with('data',Auth::tutor()->get());;
    }

//    show profile page with information
    public function getProfile(){
       $data=Auth::tutor()->get();
       $data=Tprofile::where('user_id',$data->id)->first();
       return View::make('tutor.profile')->with('data',$data);
    }


    //    profile photo update
    public function postProfilephoto(){
        $crop = new CropAvatar($_POST['avatar_src'], $_POST['avatar_data'], $_FILES['avatar_file']);
        $response = array(
            'state'  => 200,
            'message' => $crop -> getMsg(),
            'result' => asset($crop -> getResult())
        );
        $path_parts = pathinfo(asset($crop -> getResult()));
        $data=Auth::tutor()->get();
        Tprofile::where('user_id',$data->id)->update(array('file'=>$path_parts['basename']));
        echo json_encode($response);
    }

//    demo function
    public function getInfo(){
        print_r(new DateTime);
        echo date('Y-m-y H:i:s');
    }

    public function postProfileupdate(){

        $input = Input::all();
        $rule = array(
            'last_name' => 'required',
            'address1' => 'required',
            'postcode' => 'required',
            'phone' => 'required',
            'mobile' => 'required',
            'description' => 'required',
            'availability' => 'required'
        );

        $v = Validator::make($input, $rule);
        if ($v->fails()) {
            return Redirect::back()->withInput()->withErrors($v->errors());
        } else {

            $user=Auth::tutor()->get();
            $data = Tprofile::where('user_id',$user->id)->first();
            $data->title = Input::get('title');
            $data->last_name = Input::get('last_name');
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
            $data->save();
            return Redirect::back()->with('success', 'Your account has successfully created. Thanks');
        }
    }

//    summary page
    public function getSummary(){
        return View::make('tutor.summary')->with('data',Auth::tutor()->get());
    }

    //reset password
    public function getReset(){
        return View::make('tutor.reset_password')->with('data',Auth::tutor()->get());
    }

    public function postResetdone(){
        $input=Input::all();

        $rule=array(
            'old_password'=>'required',
            'password'=>'required|',
            'password_confirm'=>'required|same:password'
        );

        $v=Validator::make($input,$rule);
        if($v->fails()){
            return Redirect::back()->withErrors($v->errors());
        } else {
            $data=Auth::tutor()->get();
            if(Hash::check(Input::get('old_password'),$data->password)){
                $data->password=Hash::make(Input::get('password'));
                $data->save();
                return Redirect::back()->with('success','Password has changed successfully');
            }else{
                return Redirect::back()->with('success','wrong old password');
            }
        }
    }

//    logout function
    public function getLogout(){
        Auth::tutor()->logout();
        return Redirect::to('index/signin');
    }
}