<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuotesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quotes', function (Blueprint $table) {
            $table->increments('id');
            $table->text('text');
            $table->unsignedInteger('author_id');
            $table->unsignedInteger('book_id')->nullable();
            $table->unsignedInteger('quoteCategory_id');
            $table->unsignedInteger('user_id')->nullable();
            $table->timestamps();
            
            
            $table->foreign('author_id')->references('id')->on('authors')->onDelete('cascade');
            $table->foreign('book_id')->references('id')->on('books')->onDelete('set null');
            $table->foreign('quoteCategory_id')->references('id')->on('quote_categories')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('quotes', function (Blueprint $table) {
            $table->dropForeign('quotes_author_id_foreign');
            $table->dropForeign('quotes_book_id_foreign');
            $table->dropForeign('quotes_quoteCategory_id_foreign');
            $table->dropForeign('quotes_user_id_foreign');
        });
    }
}
