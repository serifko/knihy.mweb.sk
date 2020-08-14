<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBooksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('books', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('original_name')->nullable();
            $table->string('slug');
            $table->integer('publish_year')->nullable();
            $table->unsignedInteger('author_id');
            $table->text('about')->nullable();
            $table->string('cover_img')->nullable();
            $table->unsignedInteger('user_id')->nullable();
            $table->timestamps();
        
        $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        $table->foreign('author_id')->references('id')->on('authors')->onDelete('cascade'); 
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('books', function (Blueprint $table) {
            $table->dropForeign('books_user_id_foreign');
            $table->dropForeign('books_author_id_foreign');     
        });
    }
}
