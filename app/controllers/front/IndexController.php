<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 14/2/15
 * Time: 1:10 PM
 */

class IndexController extends Controller{

    //front index page and show all subject with its category
    public function getIndex(){

        //subject
        $data=Category::all()->take(6);
        foreach($data as $row){
            $row->subject=$row->subject()->get()->take('3');
        }

        $feature =Feature::all()->take(6);
        return View::make('front.index')->with('data',$data)->with('feature',$feature);
    }


    //particular feature view
    public function getViewfeature($id){
        $feature=Feature::find($id);
        return View::make('front.feature_view')->with('feature',$feature);
    }

    //about us page
    public function getAbout(){
        return View::make('front.about');
    }

    //subject lists
    public function getSubjects(){

        $data=Category::all()->take(8);
        foreach($data as $row){
            $row->tag_line=$row->subject()->pluck('tag_line');
            $row->subject=$row->subject()->get();
        }

        return View::make('front.subject_list')->with('data',$data);
    }

    //particular subject show
    public function getSubject($id){
        $data=Subject::find($id);
        return View::make('front.subject_view')->with('data',$data);
    }

    //fetch category
    public function getCategory(){
        return Category::where('parent','0')->get();
    }

//    get course
    public function getCourse($id){
        return Subject::where('subject_id',$id)->get(array('id','name'));
    }

//    find tutor
    public function postTutor(){
        $data= Input::all();
        return View::make('front/find_tutor');
    }

//    tutor sign up
    public function getSignup(){
        return View::make('tutor.signup');
    }

//  tutor sign  in
    public function getSignin(){
        return View::make('tutor.signin');
    }

    //forgot password
    public function getForgot(){
        return View::make('tutor.forgot');
    }

    public function getFeedback(){


//      return 0;
//         Recaptcha::render();
//        print_r(get_included_files());
//        exit;
        return View::make('front.feedback');
    }

    //submit feedback form
    public function postFeedback(){

        $input=Input::all();
        $rule=array(
            'name'=>'required',
            'email'=>'required|email',
            'message'=>'required',
            'g-recaptcha-response' => 'required',
        );
        $captcha=new Captcha();
        $res = $captcha->check(Input::get('g-recaptcha-response'));

        if($res['success'])
        {
            $v=Validator::make($input,$rule);
            if($v->fails()){
                return Redirect::back()->withInput()->withErrors($v->errors());
            }else{

                $data=array(
                    'description'=>$input['message'],
                    'name'=>$input['name'],
                    'email'=>$input['email']
                );

                if(Auth::tutor()->check()){
                    $data['user_id']=Auth::tutor()->get()->id;
                }
                Feedback::create($data);
                return Redirect::back()->with('success','Thanks for your feedback');
            }
        } else {
            return Redirect::back()->with('success','sending failed');
        }

    }

}