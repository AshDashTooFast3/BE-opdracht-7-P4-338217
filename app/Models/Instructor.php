<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Instructor extends Model
{
    protected $table = 'Instructor';
    protected $primaryKey = 'Id';
    protected $fillable = [
        'FirstName',
        'MiddleName',
        'LastName',
        'Mobile',
        'StartDate',
        'NumberOfStars',
        'IsActive',
        'Remark',
        'CreatedDate',
        'ModifiedDate'
    ];

    public function InstructorCount() { 
        return DB::statement('CALL sp_InstructorsCount()');
    }
}
