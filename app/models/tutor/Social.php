<?php
use Illuminate\Auth\UserTrait;
use Illuminate\Auth\UserInterface;
use Illuminate\Auth\Reminders\RemindableTrait;
use Illuminate\Auth\Reminders\RemindableInterface;

class Social extends Eloquent implements UserInterface, RemindableInterface  {

    use UserTrait, RemindableTrait;
    protected $table = 'social_links';

    protected $guarded=array('id');

    public $timestamps=false;

}
