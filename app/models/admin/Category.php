<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Category extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 'category';
    public $timestamps = false;
    protected $guarded = array('id');

    public function count(){
        return $this->hasMany('Subject','subject_id','id');
    }

    public function subject(){
        return $this->hasMany('Subject','subject_id','id');
    }




}
