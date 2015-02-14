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
       $data=Category::all()->take(6);
        foreach($data as $row){
            $row->subject=$row->subject()->get()->take('3');
        }
        return View::make('front.index')->with('data',$data);
    }


}