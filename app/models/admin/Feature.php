<?php

use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Feature extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 'feature';
    protected $guarded = array('id');

}
