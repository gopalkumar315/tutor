<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 14/2/15
 * Time: 2:46 PM
 */

class FeatureController extends Controller{

    public function getIndex(){
        $data=Feature::all()->take('6');
        return View::make('admin.feature')->with('data',$data);
    }

    //particular feature show
    public function getShow($id){
        $data=Feature::find($id);
        return View::make('admin.feature_show')->with('data',$data);
    }

    //redirect to add page
    public function getAdd(){
        return View::make('admin.feature_add');
    }

    public function getEdit($id){
        $data=Feature::find($id);
        return View::make('admin.feature_edit')->with('data',$data);
    }

    //save
    public function postSave(){

        $file=Input::file('file');;
        $des=public_path('images/');
        $filename=$file->getClientOriginalName();
        $filename=str_random('6').$filename;
        $file->move($des,$filename);

        $data=array(
            'title'=>Input::get('title'),
            'description'=>Input::get('description'),
            'file'=>$filename
        );
        Feature::create($data);
        return Redirect::back()->with('success','Feature Successfully Inserted');

    }

    //update
    Public function postUpdate(){
        if(Input::hasFile('file')){
            $file=Input::file('file');;
            $des=public_path('images/');
            $filename=$file->getClientOriginalName();
            $filename=$filename.str_random('6').'.'.$file->getClientOriginalExtension();
            $file->move($des,$filename);
        }else{
            $filename=Feature::find(Input::get('id'))->pluck('file');

        }

        $data=array(
            'title'=>Input::get('title'),
            'description'=>Input::get('description'),
            'file'=>$filename
        );
        Feature::where('id',Input::get('id'))->update($data);
        return Redirect::back()->with('success','Feature Updated Successfully');
    }

    public function getDestroy($id){
        Feature::destroy($id);
        return Redirect::back()->with('success','Feature Deleted Successfully');
    }


}