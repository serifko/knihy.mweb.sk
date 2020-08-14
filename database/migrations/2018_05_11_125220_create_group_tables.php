<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGroupTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('groups', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nazov')->unique();
            $table->string('description');
        });
        Schema::create('group_join_user', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('group_id');
            $table->timestamps();
            
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('group_id')->references('id')->on('groups')->onDelete('cascade');
        });
        Schema::create('group_join_permission', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('permission_id');
            $table->unsignedInteger('group_id');
            $table->timestamps();
            
            $table->foreign('permission_id')->references('id')->on('permissions')->onDelete('cascade');
            $table->foreign('group_id')->references('id')->on('groups')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $table->dropForeign('group_join_user_user_id_foreign');
        $table->dropForeign('group_join_user_group_id_foreign');
        $table->dropForeign('group_join_permission_permission_id_foreign');
        $table->dropForeign('group_join_permission_group_id_foreign');

        Schema::dropIfExists('groups');
        Schema::dropIfExists('group_join_user');
        Schema::dropIfExists('group_join_permission');
    }
}
