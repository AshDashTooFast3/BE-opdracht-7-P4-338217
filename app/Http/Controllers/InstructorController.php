<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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
        $InstructorsCount = $this->InstructorModel->InstructorCount();

        return view('dashboard', [
            'InstructorsCount' => $InstructorsCount
        ]);
    }
}
