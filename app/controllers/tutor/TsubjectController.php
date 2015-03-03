<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 2/3/15
 * Time: 9:43 PM
 */

class TsubjectController extends Controller{

    public function getIndex(){
        $data=Category::all();
        return View::make('tutor.subject')->with('data',$data);
    }

    // get subject list
    public function getList($id){
        $content=Subject::where('subject_id',$id)->get(array('id','subject_id','name'));
        /*here is by mistake wrong column created in db subject_id instead of cat_id*/
        foreach($content as $data){
            $data->check=Tsubject::where('category_id',$data->subject_id)->where('subject_id',$data->id)->where(
                'user_id',Auth::tutor()->get()->id
            )->count();
        }
        return $content;
    }

    public function postSave(){
        $data=json_decode(file_get_contents('php://input'));
        $count=Tsubject::where('category_id',$data->category_id)->where('subject_id',$data->subject_id)->where(
            'user_id',Auth::tutor()->get()->id
        )->count();
        if($count>0){
            Tsubject::where('category_id',$data->category_id)->where('subject_id',$data->subject_id)->where(
                'user_id',Auth::tutor()->get()->id
            )->delete();
        }else{
            Tsubject::create(array(
                'category_id'=>$data->category_id,
                'subject_id'=>$data->subject_id,
                'user_id'=>Auth::tutor()->get()->id
            ));
        }
    }
}


//"SQLSTATE[42S22]: Column not found: 1054 Unknown column '0' in 'field list' (SQL: update `t_subject` set `0` = category_id, `1` = 1, `2` = subject_id, `3` = 7, `updated_at` = 2015-03-02 18:44:08 where `category_id` = 1 and `subject_id` = 7 and `user_id` = 2)"