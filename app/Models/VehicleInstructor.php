<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class VehicleInstructor extends Model
{
    protected $table = 'VehicleInstructor';
    protected $primaryKey = 'Id';
    protected $fillable = [
        'VehicleId',
        'InstructorId',
        'AssignmentDate',
        'CreatedDate',
        'ModifiedDate'
    ];

    public function vehicle()
    {
        return $this->belongsTo(Vehicle::class, 'VehicleId', 'Id');
    }

    public function instructor()
    {
        return $this->belongsTo(Instructor::class, 'InstructorId', 'Id');
    }
}
