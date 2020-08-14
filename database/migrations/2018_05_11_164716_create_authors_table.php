<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAuthorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('authors', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name')->nullable();
            $table->string('middle_name')->nullable();
            $table->string('last_name');          
            $table->string('real_name')->nullable();
            $table->unsignedInteger('nation_id')->nullable();
            $table->date('birth_date')->nullable();            
            $table->string('birth_place')->nullable();
            $table->date('death_date')->nullable();            
            $table->string('death_place')->nullable();
            $table->text('info')->nullable();
            $table->string('photo')->nullable();
            $table->string('slug');
            $table->unsignedInteger('user_id')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('set null');
            $table->foreign('nation_id')->references('id')->on('nations')->onDelete('set null'); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
        
        Schema::dropIfExists('authors', function (Blueprint $table) {
            $table->dropForeign('authors_user_id_foreign');
            $table->dropForeign('authors_nation_id_foreign');
           
        });
    }
}
