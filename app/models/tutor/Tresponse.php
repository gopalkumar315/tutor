<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Tresponse extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 't_response';
    protected $guarded=array('id');
}
