<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

//front//
Route::Controller('index', 'IndexController');
Route::Controller('tutor','TutorController');

/**
 * tutor
 */
Route::group(array('prefix' => 'tpanel', 'before' => 'tutor'), function(){
	Route::controller('index','TindexController');
});


/**
 * admin
 */

Route::post('admin/login','LoginController@login');
//password send email to be reset
Route::get('admin/forgot','LoginController@forgot');
//password reset
Route::get('admin/reset/{id}','LoginController@reset');
//reset done
Route::post('admin/reset_password','LoginController@reset_password');
//lock
Route::get('admin/lock','LoginController@lock');
//lock open
Route::post('admin/lock_open','LoginController@lock_open');

Route::group(array('prefix' => 'admin', 'before' => 'auth'), function(){

	Route::get('index',function(){
		return View::make('admin/index');
	});

	//redactor image upload
	Route::post('/redactorupload', function()
	{
		$des=public_path();
		$file=Input::file('file');
		$filename =Str::random(20) .'.'. $file->getClientOriginalExtension();
		Input::file('file')->move($des.'/images\\',$filename);
		return Response::json(['filelink' => asset('images/'.$filename)]);
	});

	//logout
	Route::get('logout','LoginController@logout');

	//subject goto index page
	Route::resource('subject','SubjectController');
	//show subjects
	Route::get('subject.show','SubjectController@show');
	Route::post('subject.add','SubjectController@add');
	Route::post('subject.edit','SubjectController@edit');
	Route::post('subject.delete','SubjectController@delete');

	//show sub subject page
	Route::get('add_subject','SubjectController@add_subject');
	Route::post('store_subject','SubjectController@store_subject');
	Route::post('sub.edit','SubjectController@sub_edit');
	Route::get('sub.view/{id}','SubjectController@sub_view');
	Route::get('sub.show/{id}','SubjectController@sub_show');

	Route::get('sub.edit/{id}','SubjectController@sub_edit');
	Route::post('sub.delete','SubjectController@sub_delete');
	Route::post('sub.edit_done','SubjectController@sub_edit_done');

	Route::get('subject.view_all','SubjectController@view_all');
	Route::get('subject.show_all','SubjectController@show_all');

	Route::get('subject.view/{id}','SubjectController@view');

	Route::Controller('feature','FeatureController');

});



