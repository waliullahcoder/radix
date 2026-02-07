<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'category';
        $this->title = 'Categories';
        $this->create_title = 'Add Category';
        $this->edit_title = 'Update Category';
        $this->model = Category::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return HelperClass::resourceDataView($this->model::orderBy('id', 'desc'), null, null, $this->path, $this->title);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(['name' => 'required', 'image' => 'image']);

        $this->model::create([
            'parent_id' => $request->parent_id,
            'name' => $request->name,
            'position' => $request->position,
            'url' => $request->url,
            'slug' => HelperClass::generateUniqueSlug($this->model, 'slug', $request->name),
            'image' => $request->hasFile('image') ? HelperClass::saveImage($request->image, 600, $this->path) : null,
            'description' => $request->description,
            'created_by' => Auth::id(),
        ]);

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        if ($request->has('edit')) {
            $data = $this->model::findOrFail($id);
            return response()->json(['status' => 'success', 'data' => view('admin.category.partial.edit', ['data' => $data])->render()]);
        }
        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate(['name' => 'required', 'image' => 'image']);

        $data = $this->model::findOrFail($id);
        $data->update([
            'parent_id' => $request->parent_id,
            'name' => $request->name,
            'position' => $request->position,
            'url' => $request->url,
           // 'slug' => HelperClass::generateUniqueSlug($this->model, 'slug', $request->name, $id),
            'image' => $request->hasFile('image') ? HelperClass::saveImage($request->image, 600, $this->path, $data->image) : $data->image,
            'description' => $request->description,
            'updated_by' => Auth::id(),
        ]);

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id, 'image');
    }
}
