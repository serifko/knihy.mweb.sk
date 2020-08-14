<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();


Route::get('/', 'HomeController@index')->name('home');
Route::get('/autocomplete_search', 'HomeController@autocompleteSearch');

Route::get('/prihlasit', 'Auth\LoginController@showLoginForm')->name('login');
Route::post('/prihlasit', 'Auth\LoginController@login');
Route::get('/registracia', 'Auth\RegisterController@showRegistrationForm')->name('register');
Route::post('/registracia', 'Auth\RegisterController@register');
Route::get('/odhlasit', 'Auth\LoginController@logout')->name('logout');


//HOME
Route::get('/kontakt', 'HomeController@contact');
Route::post('/kontakt', 'HomeController@sendContact');


//ADMIN
Route::get('/admin', 'Admin\AdminController@home')->middleware('CheckPerm:admin_home');
Route::get('/admin/kontakty', 'Admin\AdminController@contacts')->middleware('CheckPerm:admin_contacts');
Route::get('/admin/kontakt/{id}', 'Admin\AdminController@contact')->middleware('CheckPerm:admin_contacts');
Route::patch('/admin/kontakt/{id}/precitana', 'Admin\AdminController@contactRead')->middleware('CheckPerm:admin_contacts');
Route::delete('/admin/kontakt/{id}/vymazat', 'Admin\AdminController@contactDelete')->middleware('CheckPerm:admin_contacts');

// ADMIN - POVOLENIA
Route::get('/admin/povolenia', 'Admin\PermissionController@index')->middleware('CheckPerm:permissions');
Route::post('/admin/povolenia/pridat', 'Admin\PermissionController@store')->middleware('CheckPerm:permissions');
Route::get('/admin/povolenia/{id}/upravit', 'Admin\PermissionController@edit')->middleware('CheckPerm:permissions');
Route::put('/admin/povolenia/{id}/upravit', 'Admin\PermissionController@update')->middleware('CheckPerm:permissions');
Route::delete('/admin/povolenia/{id}/vymazat', 'Admin\PermissionController@delete')->middleware('CheckPerm:permissions');

// ADMIN - SKUPINY
Route::get('/admin/skupiny', 'Admin\GroupController@index')->middleware('CheckPerm:groups');
Route::post('/admin/skupiny/pridat', 'Admin\GroupController@store')->middleware('CheckPerm:groups');
Route::get('/admin/skupiny/{id}/upravit', 'Admin\GroupController@edit')->middleware('CheckPerm:groups');
Route::put('/admin/skupiny/{id}/upravit', 'Admin\GroupController@update')->middleware('CheckPerm:groups');
Route::delete('/admin/skupiny/{id}/vymazat', 'Admin\GroupController@delete')->middleware('CheckPerm:groups');

Route::get('/admin/skupiny/{id}/nastavit', 'Admin\GroupController@user')->middleware('CheckPerm:group_user');
Route::patch('/admin/skupiny/{id}/nastavit', 'Admin\GroupController@userSave')->middleware('CheckPerm:group_user');

Route::get('/admin/povolenia/{id}/nastavit', 'Admin\PermissionController@nastavit')->middleware('CheckPerm:permission_user');
Route::patch('/admin/povolenia/{id}/nastavit', 'Admin\PermissionController@nastavitSave')->middleware('CheckPerm:permission_user');
Route::get('/admin/povolenia/{id}/nastavitskupinu', 'Admin\PermissionController@nastavitGroup')->middleware('CheckPerm:permission_group');
Route::patch('/admin/povolenia/{id}/nastavitskupinu', 'Admin\PermissionController@nastavitGroupSave')->middleware('CheckPerm:permission_group');

// ADMIN - NARODNOSTI
Route::get('/admin/narodnosti', 'Admin\NationController@index')->middleware('CheckPerm:nations');
Route::post('/admin/narodnosti/pridat', 'Admin\NationController@store')->middleware('CheckPerm:nations_add');
Route::get('/admin/narodnosti/{id}/upravit', 'Admin\NationController@edit')->middleware('CheckPerm:nations_update');
Route::put('/admin/narodnosti/{id}/upravit', 'Admin\NationController@update')->middleware('CheckPerm:nations_update');
Route::delete('/admin/narodnosti/{id}/vymazat', 'Admin\NationController@delete')->middleware('CheckPerm:nations_delete');

// ADMIN - UŽÍVATELIA
Route::get('/admin/uzivatelia', 'Admin\UserController@index')->middleware('CheckPerm:admin_users');

//ADMIN - NEWS
Route::get('/admin/novinky', 'Admin\NewsController@index')->middleware('CheckPerm:admin_news');
Route::post('/admin/novinky/pridat', 'Admin\NewsController@store')->middleware('CheckPerm:admin_news');
Route::get('/admin/novinky/{id}/upravit', 'Admin\NewsController@edit')->middleware('CheckPerm:admin_news_edit');
Route::put('/admin/novinky/{id}/upravit', 'Admin\NewsController@update')->middleware('CheckPerm:admin_news_edit');
Route::delete('/admin/novinky/{id}/vymazat', 'Admin\NewsController@delete')->middleware('CheckPerm:admin_news_delete');


//AUTORI
Route::get('/autori', 'AuthorController@index');
Route::get('/autor/pridat', 'AuthorController@create')->middleware('CheckPerm');
Route::post('/autor/pridat', 'AuthorController@store')->middleware('CheckPerm');
Route::get('/autor/{author_id}/upravit', 'AuthorController@edit')->middleware('CheckPerm:author_update');
Route::put('/autor/{author_id}/upravit', 'AuthorController@update')->middleware('CheckPerm:author_update');
Route::get('/autor/{author_id}/vymazat', 'AuthorController@delete')->middleware('CheckPerm:author_delete');
Route::get('/autor/{slug}', 'AuthorController@show');
Route::get('autocomplete_author', 'AuthorController@search');

Route::get('/autor/pridatoblubenu/{id}', 'AuthorController@setFavorite')->middleware('CheckPerm');
Route::post('/autor/setFavBookRank/{author_id}', 'AuthorController@setFavAuthorRank')->middleware('CheckPerm');


// ADMIN - KNIHY KATEGÓRIE
Route::get('/admin/knihykategorie', 'Admin\BookCategoryController@index')->middleware('CheckPerm:book_categories');
Route::post('/admin/knihykategorie/pridat', 'Admin\BookCategoryController@store')->middleware('CheckPerm:book_categories');
Route::get('/admin/knihykategorie/{id}/upravit', 'Admin\BookCategoryController@edit')->middleware('CheckPerm:book_categories');
Route::put('/admin/knihykategorie/{id}/upravit', 'Admin\BookCategoryController@update')->middleware('CheckPerm:book_categories');
Route::delete('/admin/knihykategorie/{id}/vymazat', 'Admin\BookCategoryController@delete')->middleware('CheckPerm:book_categories');

// ADMIN - CITATY KATEGORIE
Route::get('/admin/citatykategorie', 'Admin\QuoteCategoryController@index')->middleware('CheckPerm:quote_categories');
Route::post('/admin/citatykategorie/pridat', 'Admin\QuoteCategoryController@store')->middleware('CheckPerm:quote_categories');
Route::get('/admin/citatykategorie/{id}/upravit', 'Admin\QuoteCategoryController@edit')->middleware('CheckPerm:quote_categories');
Route::put('/admin/citatykategorie/{id}/upravit', 'Admin\QuoteCategoryController@update')->middleware('CheckPerm:quote_categories');
Route::delete('/admin/citatykategorie/{id}/vymazat', 'Admin\QuoteCategoryController@delete')->middleware('CheckPerm:quote_categories');

// KNIHY
Route::get('/knihy', 'BookController@index');
Route::get('/kniha/pridat', 'BookController@create')->middleware('CheckPerm');
Route::post('/kniha/pridat', 'BookController@store')->middleware('CheckPerm');
Route::get('/kniha/{id}/upravit', 'BookController@edit')->middleware('CheckPerm:book_update');
Route::put('/kniha/{id}/upravit', 'BookController@update')->middleware('CheckPerm:book_update');
Route::delete('/kniha/{id}/vymazat', 'BookController@delete')->middleware('CheckPerm:book_delete');
Route::get('/kniha/{slug}', 'BookController@show');
Route::get('autocomplete_book', 'BookController@search');



Route::get('/kniha/pridatoblubenu/{id}', 'BookController@setFavorite')->middleware('CheckPerm');
Route::post('/knihy/setFavBookRank/{id}', 'BookController@setFavBookRank')->middleware('CheckPerm');

// CITATY
Route::get('/citaty', 'QuoteController@index');
Route::get('/citaty/{select}', 'QuoteController@index');
Route::get('/citat/pridat', 'QuoteController@create');
Route::post('/citat/pridat', 'QuoteController@store');
Route::get('/citat/{id}/upravit', 'QuoteController@edit')->middleware('CheckPerm:quote_update');
Route::put('/citat/{id}/upravit', 'QuoteController@update')->middleware('CheckPerm:quote_update');
Route::delete('/citat/{id}/vymazat', 'QuoteController@delete')->middleware('CheckPerm:quote_delete');
Route::get('/citat/{id}', 'QuoteController@show');
Route::get('/citat/vote/{id}', 'QuoteController@vote');
Route::get('/citaty/autor/{slug}', 'QuoteController@author');

Route::get('/kniznicka', 'QuoteController@indexTwo');

//BOOK STATUS
Route::get('/knihastatus/{id}', 'BookStatusController@setStatus')->middleware('CheckPerm');
Route::get('/mojecitanie', 'BookStatusController@index')->middleware('CheckPerm');
Route::get('/mojecitanie/{selYear}', 'BookStatusController@index')->middleware('CheckPerm');  //ak je vybrany rok z ktoreho precitane knihy
Route::get('/mojecitanie/{id}/vymazat', 'BookStatusController@delete')->middleware('CheckPerm');

//KNIHY HODNOTENIE
Route::post('knihahodnotenie/pridat', 'BookCommentController@store')->middleware('CheckPerm');
Route::delete('knihahodnotenie/vymazat/{comm_id}', 'BookCommentController@delete')->middleware('CheckPerm');

//BLOG
Route::get('/blog', 'BlogPostController@index');
Route::get('/blog/pridat', 'BlogPostController@create')->middleware('CheckPerm:blog_add');
Route::post('/blog/pridat', 'BlogPostController@store')->middleware('CheckPerm:blog_add');
Route::get('/blog/{id}/upravit', 'BlogPostController@edit')->middleware('CheckPerm:blog_update');
Route::put('/blog/{id}/upravit', 'BlogPostController@update')->middleware('CheckPerm:blog_update');
Route::get('/blog/{url}', 'BlogPostController@show');
Route::get('/blog/{type}/{string}', 'BlogPostController@index');

Route::get('/getLinkBlogPost', 'BlogPostController@getLinkBlogPost');
Route::get('/admin/blog/zoznam', 'BlogPostController@zoznam')->middleware('CheckPerm:blog_zoznam');
Route::delete('/blog/{id}/vymazat', 'BlogPostController@delete')->middleware('CheckPerm:blog_delete');



//USER PROFILEs
Route::get('/oblubeneknihy', 'UserProfileController@favoritBooks')->middleware('CheckPerm');
Route::get('/oblubeneknihy/{username}', 'UserProfileController@favoritBooks')->middleware('CheckPerm');
Route::get('/oblubeniautori', 'UserProfileController@favoritAuthors')->middleware('CheckPerm');
Route::get('/oblubeniautori/{username}', 'UserProfileController@favoritAuthors')->middleware('CheckPerm');

Route::get('/profil', 'UserProfileController@show')->middleware('CheckPerm');
//Route::get('/profil/priatelia', 'UserProfileController@show')->middleware('CheckPerm');
//Route::get('/profil/kompletny', 'UserProfileController@show')->middleware('CheckPerm');
Route::get('/profil/nastavenie', 'UserProfileController@setting')->middleware('CheckPerm');
Route::post('/profil/nastavenie', 'UserProfileController@settingSave')->middleware('CheckPerm');
Route::get('/profil/{username}', 'UserProfileController@show')->middleware('CheckPerm');


//REALTIONS
Route::get('/priatelia', 'RelationController@index')->middleware('CheckPerm');
Route::get('/priatelstvo/ziadost/{user_id}', 'RelationController@sendReq')->middleware('CheckPerm');
Route::get('/priatelstvo/ziadost/potvrdit/{user_id}', 'RelationController@confReq')->middleware('CheckPerm');
Route::get('/priatelstvo/zrusit/{user_id}', 'RelationController@delFriend')->middleware('CheckPerm');

Route::get('/blokovanie', 'RelationController@blocked')->middleware('CheckPerm');
Route::get('/blokovat/ziadost/{user_id}', 'RelationController@setBlock')->middleware('CheckPerm');
Route::get('/blokovat/zrusit/{user_id}', 'RelationController@cancBlock')->middleware('CheckPerm');


