<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
      Schema::create('dosen', function (Blueprint $table) {
          $table->id();
          $table->text("nama");
          $table->text("NIDN");
          $table->text("alamat");
          $table->text("email");
          $table->text("no_hp");
          $table->timestamps();
      });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
          Schema::dropIfExists('dosen');
    }
};
