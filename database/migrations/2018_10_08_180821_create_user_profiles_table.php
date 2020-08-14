<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserProfilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_profiles', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id')->unique();
            
        //PERSONAL
            $table->integer('email_pub')->default(0);
            $table->integer('realname_pub')->default(0);
            $table->string('realname')->nullable();
            $table->date('birthday')->nullable();
            $table->integer('birthday_pub')->default(0);
            $table->integer('age_pub')->default(0);
            $table->text('about')->nullable();
            $table->integer('about_pub')->default(0);
            $table->string('photo')->nullable();
            $table->integer('photo_pub')->default(0);
            
        // SOCIAL NETWORKS
            $table->integer('website_pub')->default(0);
            $table->string('website')->nullable();
            $table->integer('facebook_pub')->default(0);
            $table->string('facebook')->nullable();
            $table->integer('twitter_pub')->default(0);
            $table->string('twitter')->nullable();
            $table->integer('instagram_pub')->default(0);
            $table->string('instagram')->nullable();
            $table->integer('tumblr_pub')->default(0);
            $table->string('tumblr')->nullable();

            $table->timestamps();
            
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
         Schema::dropIfExists('user_profiles', function (Blueprint $table) {
            $table->dropForeign('user_profiles_user_id_foreign');     
        });
    }
}
