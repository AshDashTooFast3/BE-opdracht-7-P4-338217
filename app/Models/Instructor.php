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

    public static function instructorCount(): mixed
    {
        return DB::selectOne('CALL sp_InstructorsCount()');
    }
}
