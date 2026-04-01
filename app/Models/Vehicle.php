<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vehicle extends Model
{
    protected $table = 'Vehicle';
    protected $primaryKey = 'Id';
    protected $fillable = [
        'LicensePlate',
        'Model',
        'YearOfManufacture',
        'FuelType',
        'VehicleTypeId',
        'IsActive',
        'Remark',
        'CreatedDate',
        'ModifiedDate'
    ];
}
