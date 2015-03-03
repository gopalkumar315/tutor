<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Tsubject extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 't_subject';

    protected $guarded=array('id');

    public $timestamps=false;

    public function user(){
        return $this->hasOne('Login','id','user_id');
    }

    public function category(){
        return $this->hasOne('Category','id','category_id');
    }

    public function subject(){
        return $this->hasOne('Subject','id','subject_id');
    }
}
