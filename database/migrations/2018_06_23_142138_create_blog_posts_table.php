<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;


class CreateBlogPostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('blog_posts', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->integer('link_type')->default(0)->nullable();
            $table->integer('link_id')->default(0)->nullable();
            $table->string('title');
            $table->string('slug');
            $table->text('text');
            $table->integer('likes')->default(0)->nullable();
            $table->string('title_image')->nullable();
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
        Schema::dropIfExists('blog_posts', function (Blueprint $table) {
            $table->dropForeign('blog_posts_user_id_foreign');
        });
    }
}
