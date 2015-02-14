<?php
class SubjectController extends Controller{

    public function Index(){
        return View::make('admin.subject');
    }

    //show main subject
    public function show(){
        $data=Category::where('parent','0')->get();
        foreach($data as $row)
        {
            $row->count=$row->count()->count();
        }
        echo json_encode($data);
    }

    //add main subject
    public function add(){
        $data=json_decode(file_get_contents('php://input'),true);
        Category::create($data);
        $this->show();
    }

    //edit Category
    public function edit(){
        $data=json_decode(file_get_contents('php://input'));
        $content=Category::where('id',$data->id)->first();
        $content->name=$data->name;
        $content->save();
        $this->show();
    }

    //delete
    public function delete(){
        $data=json_decode(file_get_contents('php://input'));
        Category::destroy($data->id);
        $this->show();
    }

    //redirect to add sub subject
    public function add_subject(){
        $data=Category::where('parent','0')->get();
        return View::make('admin.add_subject')->with('data',$data);
    }

    /**
     * @return mixed
     * add subsubject
     */
    public function store_subject(){
       $data=Input::all();
       Subject::create($data);
       return Redirect::back()->with('success','Data Successfully Inserted');
    }

    /**
     * view subsubject
     */

    public function sub_view($id){
        $data=Category::where('id',$id)->first(array('name'));
        return View::make('admin.view_subject')->with('id',$id)->with('data',$data);
    }

    public function sub_show($id){
        $data=Subject::where('subject_id',$id)->get();
        echo json_encode($data);
    }

    /**
     * sub delete
     */

    public function sub_delete(){
        $data=json_decode(file_get_contents('php://input'));
        Subject::destroy($data->id);
    }

    /**
     * edit sub subject
     */

    public function sub_edit($id){
        $data=Subject::find($id);
        $category=Category::all();
        return View::make('admin.edit_subject')->with('data',$data)->with('category',$category);
    }

    /**
     * edit done
     */

    public function sub_edit_done(){
        $data=Input::all();
        Subject::where('id',$data['id'])->update($data);
        return Redirect::back()->with('success','Edition Done Successfully');
    }

    public function show_all(){
        $data=Subject::all();
        foreach($data as $row){
            $row->sub=$row->sub_cat()->pluck('name');
        }
        return $data;
    }

    //redirect to view all page
    public function view_all(){
        return View::make('admin.view_all_subject');
    }

    //particular subject view

    public function view($id){
        $data=Subject::find($id);
        return View::make('admin.view')->with('data',$data);
    }

}