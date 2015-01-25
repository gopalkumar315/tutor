<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Subject extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 'subject';
    public $timestamps = false;
    protected $guarded = array();

    public function count(){
        return $this->hasMany('Subject','parent_id','id');
    }

    public function detail(){
        return $this->hasOne('SubjectDetail','subject_id','id');
    }




}
