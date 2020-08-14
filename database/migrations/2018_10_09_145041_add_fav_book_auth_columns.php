<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddFavBookAuthColumns extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('favorit_book', function (Blueprint $table) {
            $table->integer('rank')->nullable();
            $table->unsignedInteger('user_id_f');
            $table->unsignedInteger('user_id_s');
            $table->integer('status');
            $table->integer('blocked');
        });
        
        Schema::table('favorit_author', function (Blueprint $table) {
            $table->integer('rank')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('favorit_book', function (Blueprint $table) {
            $table->dropColumn('rank');
        });
        Schema::table('favorit_author', function (Blueprint $table) {
            $table->dropColumn('rank');
        });
    }
}
