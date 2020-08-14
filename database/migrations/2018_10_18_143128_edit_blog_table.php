<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditBlogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('blog_posts', function($table)
        {
            $table->boolean('is_publised')->default(0);
            $table->datetime('publish_date')->nullable();
            $table->integer('num_visitors')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('blog_posts', function($table)
        {
            $table->dropColumn('is_publised');
            $table->dropColumn('publish_date');
            $table->dropColumn('num_visitors');
        });
    }
}
