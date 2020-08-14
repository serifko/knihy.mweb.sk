<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRelationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('relations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id_f');
            $table->unsignedInteger('user_id_s');
            $table->integer('status')->default(0);
            $table->integer('blocked')->default(0);
            $table->unsignedInteger('blocked_by')->nullable();
            $table->timestamps();
            
            $table->foreign('user_id_f')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('user_id_s')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('blocked_by')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('relations', function (Blueprint $table) {
            $table->dropForeign('relations_user_id_f_foreign');
            $table->dropForeign('relations_user_id_s_foreign');
            $table->dropForeign('relations_blocked_by_foreign');
        });
    }
}
