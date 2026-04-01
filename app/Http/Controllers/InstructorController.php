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

        return view('dashboard', [
            'instructorsCount' => $instructorsCount,
        ]);
    }
}
