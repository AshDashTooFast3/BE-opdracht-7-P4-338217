<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement('DROP PROCEDURE IF EXISTS sp_InstructorsCount');
        DB::statement('
            CREATE PROCEDURE sp_InstructorsCount()
            BEGIN
                SELECT COUNT(*) AS InstructorsCount
                FROM Instructor;
            END 
        ');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        DB::statement('DROP PROCEDURE IF EXISTS sp_InstructorsCount');
    }
};
