<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 24/2/15
 * Time: 10:09 PM
 */

Event::listen('auth.logout', function($user)
{
    $user->last_logout = date('Y-m-d H:i:sa');
    $user->save();
});
