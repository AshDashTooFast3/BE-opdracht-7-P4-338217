<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VehicleType extends Model
{
    protected $table = 'VehicleType';
    protected $primaryKey = 'Id';
    protected $fillable = [
        'VehicleType',
        'LicenseCategory',
        'IsActive',
        'Remark',
        'CreatedDate',
        'ModifiedDate'
    ];
}
