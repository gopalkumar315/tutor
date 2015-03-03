<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 2/3/15
 * Time: 9:43 PM
 */

class TsubjectController extends Controller{

    /*show subject*/
    public function getIndex(){
        $data=Tsubject::where('user_id',Auth::tutor()->get()->id)->groupBy('category_id')->get();
        $data1=array();
        foreach($data as $row){
            $row->category_name=$row->category()->pluck('name');
            $data1=Tsubject::where('category_id',$row->category_id)->where('user_id',$row->user_id)->get(array('subject_id'));
            foreach($data1 as $row1){
               $row1->subject_name=$row1->subject()->pluck('name');
            }
            $row->subjects=$data1;
        }

//        return $data;
        return View::make('tutor.subject')->with('data',$data);
    }

    /*modify addition subtraction deletion of subject  */
     public function getModify(){
         $data=Category::all();
         return View::make('tutor.modify_subject')->with('data',$data);
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

    /*angular request to save into database*/
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