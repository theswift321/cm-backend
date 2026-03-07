<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
     public function index()
    {
        return Category::all();
    }
     public function landingindex()
    {
        return Category::all();
    }

     public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories,name'
        ]);

        return Category::create([
            'name' => $request->name
        ]);
    }

    public function destroy($id){
        return Category::destroy($id);
    }
}
