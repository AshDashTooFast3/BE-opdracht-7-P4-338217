<?php

namespace App\Http\Controllers;

use App\Models\Instructor;

class InstructorController extends Controller
{
    private $InstructorModel;

    public function __construct()
    {
        $this->InstructorModel = new Instructor;
    }

    public function index()
    {
        $instructorsCount = $this->InstructorModel->InstructorCount()->InstructorsCount ?? 0;
        $instructors = $this->InstructorModel->GetAllInstructors();
        
        return view('dashboard', [
            'instructorsCount' => $instructorsCount,
            'instructors' => $instructors
        ]);
    }

    public function details($instructorId)
    {
        $instructor = $this->InstructorModel->GetAllInstructorVehicles($instructorId);

        return view('instructor.details', [
            'instructor' => $instructor
        ]);
    }
}
