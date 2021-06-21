<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('suppliers', function (Blueprint $table) {
            $table->smallInteger('supplier_id')->primary();
            $table->string('company_name', 40);
            $table->string('contact_name', 30)->nullable();
            $table->string('contact_title', 30)->nullable();
            $table->string('address', 60)->nullable();
            $table->string('city', 15)->nullable();
            $table->string('region', 15)->nullable();
            $table->string('postal_code', 10)->nullable();
            $table->string('country', 15)->nullable();
            $table->string('phone', 24)->nullable();
            $table->string('fax', 24)->nullable();
            $table->text('homepage')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('suppliers');
    }
}
