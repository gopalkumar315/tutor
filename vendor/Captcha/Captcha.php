<?php
/**
 * Created by PhpStorm.
 * User: john
 * Date: 5/3/15
 * Time: 10:54 PM
 */

class Captcha {

    public function check($input){

        $recaptcha=$input;
        $google_url="https://www.google.com/recaptcha/api/siteverify";
        $secret='6LcGCQATAAAAANJUnnX0DM4djDornbfPszjVzSzS';
        $ip=$_SERVER['REMOTE_ADDR'];
        $url=$google_url."?secret=".$secret."&response=".$recaptcha."&remoteip=".$ip;
        $res=$this->getCurlData($url);
        return json_decode($res, true);
    }

    function getCurlData($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16");
        $curlData = curl_exec($curl);
        curl_close($curl);
        return $curlData;
    }
}