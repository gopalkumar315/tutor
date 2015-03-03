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

    public function postMylocation(){
        $data=json_decode(file_get_contents('php://input'),true);
        $count=Location::where('user_id',Auth::tutor()->get()->id)->count();
        if($count>0){
            Location::where('user_id',Auth::tutor()->get()->id)->update($data);
        }else{
            $data['user_id']=Auth::tutor()->get()->id;
            Location::create($data);
        }
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
        $format=array("jpg","jpeg","png");
        $user_id=Auth::tutor()->get()->id;
        foreach($files as $file){
            if(in_array($file->getClientOriginalExtension(),$format)){
                if($file->getSize()<3232800){
                    $filename=str_random(20).'.'.$file->getClientOriginalExtension();
                    $data=new Document();
                    $data->file=$filename;
                    $data->user_id=$user_id;
                    $data->save();
                    $file->move($des,$filename);
                    return Redirect::back()->with('success','Your Documents has upload Successfully');
                }
                else{
                    return Redirect::back()->with('success','file size is too large');
                }
            }else{
                return Redirect::back()->with('success','file must be of jpg,jpeg or png format type');
            }
        }
    }

    //    document images
    public function getDocumentimg(){
        return Document::where('user_id',Auth::tutor()->get()->id)->get();
    }

    //feedback
    public function getRequest(){
        return View::make('tutor.request');
    }

    //qualication
    public function getQualification(){
        $data=Tprofile::where('user_id',Auth::tutor()->get()->id)->first(array('qualification','experience','level'));
        return View::make('tutor.qualification')->with('data',$data);
    }

    public function postQualification(){
        $input=Input::all();
        $rule=array(
            'qualification'=>'required|min:50',
            'experience'=>'required|min:50',
            'level'     =>'required'
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