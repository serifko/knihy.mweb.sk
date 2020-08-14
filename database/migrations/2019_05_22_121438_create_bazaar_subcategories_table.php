<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBazaarSubcategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bazaar_subcategories', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('slug');
            $table->unsignedInteger('bazaar_category_id')->nullable();
            $table->timestamps();
            
            $table->foreign('bazaar_category_id')->references('id')->on('bazaar_categories')->onDelete('set null');            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bazaar_subcategories', function (Blueprint $table) {
            $table->dropForeign('bazaar_subcategories_bazaar_category_id_foreign');    
        });
    }
}
