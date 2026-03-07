<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SubjectMaterial;
use Illuminate\Support\Facades\Storage;

class SubjectMaterialController extends Controller
{
    /* =========================
        LIST MATERIALS
    ========================== */
    public function index($subjectId)
    {
        return SubjectMaterial::where('subject_id', $subjectId)
            ->orderBy('order')
            ->get();
    }

    /* =========================
        STORE MATERIAL
    ========================== */
    public function store(Request $request, $subjectId)
    {    
        $data = $request->validate([
            'course_id' => 'required|integer',
            'title'    => 'required|string|max:255',
            'type'     => 'required|in:video,pdf,quiz,assignment,text',
            'content'  => 'nullable|string',
            'order'    => 'required|integer',
            'duration' => 'nullable|integer',
            'status'   => 'required|in:draft,published',
            'file'     => 'nullable|file|max:102400' // 50MB
        ]);

        // echo"<pre>";
        // print_r($request->all());
        // exit();
        $data['subject_id'] = $subjectId;

        /* ===== FILE UPLOAD ===== */
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $path = $file->store('subject-materials', 'public');

            $data['file_path'] = $path;
            // $data['content'] = null; // ignore content if file exists
        }

        return SubjectMaterial::create($data);
    }

    /* =========================
        SHOW MATERIAL
    ========================== */
    public function show(SubjectMaterial $material)
    {
        return $material;
    }

    /* =========================
        UPDATE MATERIAL
    ========================== */
    public function update(Request $request, SubjectMaterial $material)
    {
        $data = $request->validate([
            'title'    => 'required|string|max:255',
            'type'     => 'required|in:video,pdf,quiz,assignment,text',
            'content'  => 'nullable|string',
            'order'    => 'required|integer',
            'duration' => 'nullable|integer',
            'status'   => 'required|in:draft,published',
            'file'     => 'nullable|file|max:51200'
        ]);

        /* ===== FILE UPDATE ===== */
        if ($request->hasFile('file')) {

            // delete old file if exists
            if ($material->file_path) {
                Storage::disk('public')->delete($material->file_path);
            }

            $file = $request->file('file');
            $path = $file->store('subject-materials', 'public');

            $data['file_path'] = $path;
           
        }

        $material->update($data);

        return $material;
    }

    /* =========================
        DELETE MATERIAL
    ========================== */
    public function destroy(SubjectMaterial $material)
    {
        if ($material->file_path) {
            Storage::disk('public')->delete($material->file_path);
        }

        $material->delete();

        return response()->noContent();
    }
}
