<?php
class SubjectController extends Controller{

    public function Index(){
        return View::make('admin.subject');
    }

    //show main subject
    public function show(){
        $data=Subject::where('parent_id','0')->get();
        foreach($data as $row)
        {
            $row->count=$row->count()->count();
        }
        echo json_encode($data);
    }

    //add main subject
    public function add(){
        $data=json_decode(file_get_contents('php://input'),true);
        Subject::create($data);
        $this->show();
    }

    //edit
    public function edit(){
        $data=json_decode(file_get_contents('php://input'));
        $content=Subject::where('id',$data->id)->first();
        $content->name=$data->name;
        $content->save();
        $this->show();
    }

    //delete
    public function delete(){
        $data=json_decode(file_get_contents('php://input'));
        Subject::destroy($data->id);
        $this->show();
    }

    //redirect to add sub subject
    public function subsubject($id){
        return View::make('admin.add_sub_subject')->with('id',$id);
    }

    /**
     * @return mixed
     * add subsubject
     */
    public function sub_add(){
       $data=new Subject();
       $data->name=Input::get('name');
       $data->parent_id=Input::get('id');
       $data->save();

       $id=Subject::max('id');

       $data=new SubjectDetail();
       $data->tag_line=Input::get('tag_line');
       $data->subject_id=$id;
       $data->description=Input::get('description');
       $data->save();
       return Redirect::back()->with('success','Data Successfully Inserted');
    }

    /**
     * view subsubject
     */

    public function sub_view($id){
        $data=Subject::where('id',$id)->first(array('name'));
        return View::make('admin.view_sub_subject')->with('id',$id)->with('data',$data);
    }

    public function sub_show($id){
        $data=Subject::where('parent_id',$id)->get();
        foreach($data as $row){
            $row->detail=$row->detail()->first();
        }
        echo json_encode($data);
    }

    /**
     * sub delete
     */

    public function sub_delete(){
        $data=json_decode(file_get_contents('php://input'));
        Subject::destroy($data->id);
        SubjectDetail::where('subject_id',$data->id)->delete();
        $this->sub_show($data->parent_id);
    }

    /**
     * edit sub subject
     */

    public function sub_edit($id){
        $data=Subject::find($id);
        return View::make('admin.edit_sub_subject')->with('data',$data);
    }

    /**
     * edit done
     */

    public function sub_edit_done(){
        $data=Subject::where('id',Input::get('id'))->first();
        $data->name=Input::get('name');
        $data->save();

        $data=SubjectDetail::where('subject_id',Input::get('id'))->first();
        $data->tag_line=Input::get('tag_line');
        $data->description=Input::get('description');
        $data->save();

        return Redirect::back()->with('success','Edition Done Successfully');
    }
}