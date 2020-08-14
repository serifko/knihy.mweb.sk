<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBookCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('book_categories', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nazov');
            $table->string('slug');
        });
        
        Schema::create('book_join_categories', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('book_id')->nullable();
            $table->unsignedInteger('book_category_id')->nullable();
            $table->timestamps();

            $table->foreign('book_id')->references('id')->on('books')->onDelete('cascade');
            $table->foreign('book_category_id')->references('id')->on('book_categories')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('book_join_categories', function (Blueprint $table) {
            $table->dropForeign('book_join_categories_book_id_foreign');
            $table->dropForeign('book_join_categories_book_category_id_foreign'); 
        });
        
        Schema::dropIfExists('book_categories');
    }
}
