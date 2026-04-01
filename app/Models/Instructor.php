<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

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
}
