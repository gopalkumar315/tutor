<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Login extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 'user';

    protected $guarded=array('id');

    public function social(){
        return $this->hasOne('Social','user_id','id');
    }

    public function location(){
        return $this->hasOne('Location','user_id','id');
    }

    public function profile(){
        return $this->hasOne('Tprofile','user_id','id');
    }

}
