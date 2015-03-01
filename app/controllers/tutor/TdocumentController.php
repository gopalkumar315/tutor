<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 26/2/15
 * Time: 11:48 AM
 */

class TdocumentController extends Controller{

    //location
    public function getLocation(){
        return View::make('tutor.location');
    }

//  mylocaiton
    public function getMylocation(){
        $data=Location::where('user_id',Auth::tutor()->get()->id)->get();
        echo json_encode($data);
    }

    //document page
    public function getDocument(){
        return View::make('tutor.document');
    }

    public function postDocument(){
        $files=Input::file('file');
        $des=public_path('tutor/documents');
        foreach($files as $file){
            $filename=str_random(20).$file->getClientOriginalExtension();
        }
    }

    //feedback
    public function getRequest(){
        return View::make('tutor.request');
    }

    //qualication

    public function getQualification(){
        $data=Tprofile::where('user_id',Auth::tutor()->get()->id)->first(array('qualification','experience'));
        return View::make('tutor.qualification')->with('data',$data);
    }

    public function postQualification(){
        $input=Input::all();
        $rule=array(
            'qualification'=>'required|min:50',
            'experience'=>'required|min:50'
        );

        $v=Validator::make($input,$rule);
        if($v->fails()){
            return Redirect::back()->withInput()->withErrors($v->errors());
        } else {
            Tprofile::where('user_id',Auth::tutor()->get()->id)->update($input);
            return Redirect::back()->with('success','Updated Successful');
        }
    }
}