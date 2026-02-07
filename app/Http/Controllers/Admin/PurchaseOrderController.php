<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Store;
use App\Models\Vendor;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\PurchaseOrder;
use App\Http\Controllers\Controller;
use App\Models\ProductTag;

class PurchaseOrderController extends Controller
{
    public $path;
    public $title;
    public $create_title;
    public $edit_title;
    public $model;
    public function __construct()
    {
        $this->path = 'purchase-order';
        $this->title = 'Purchase Order';
        $this->create_title = 'Add Purchase Order';
        $this->edit_title = 'Update Purchase Order';
        $this->model = PurchaseOrder::class;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return HelperClass::resourceDataView($this->model::orderBy('id', 'desc'), null, null, $this->path, $this->title, ['purchaseReceipts']);
    }

    function getBreadcrumb(Category $category)
    {
        $breadcrumb = collect([]);

        while ($category) {
            $breadcrumb->prepend($category);
            $category = $category->parent;
        }

        return $breadcrumb;
    }

    public function getCatwiseInfo(Request $request)
    {
        $category = null;
        $breadcrumb = null;
        $categories = collect();
        $products = collect();
        if ($request->has('parent_id')) {
            if ($request->parent_id) {
                $category = Category::findOrFail($request->parent_id);
                $breadcrumb = $this->getBreadcrumb($category);
                $products = Product::with('variants')->where('category_id', $request->parent_id)->where('status', true)->get();
            }
            $categories = Category::where('parent_id', $request->parent_id)->where('status', true)->get();
        }
        if ($request->category_id) {
            $category = Category::findOrFail($request->category_id);
            $breadcrumb = $this->getBreadcrumb($category);
            $categories = Category::where('parent_id', $request->category_id)->where('status', true)->get();
            $products = Product::with('variants')->where('category_id', $request->category_id)->where('status', true)->get();
        }

        $type  = 'byCategory';
        return response()->json([
            'status' => 'success',
            'data' => view('admin.purchase-order.partial.grid', compact('type', 'categories', 'products', 'category', 'breadcrumb'))->render()
        ]);
    }

    public function getTagwiseInfo(Request $request)
    {
        $type  = 'byTag';
        $tag = $request->tag;
        $products = Product::with('variants')->whereHas('tags', function ($query) use ($request) {
            $query->where('name', $request->tag);
        })->where('status', true)->get();
        $tags = ProductTag::whereHas('product', function ($query) {
            $query->where('status', true);
        })->groupBy('name')->get();
        return response()->json([
            'status' => 'success',
            'data' => view('admin.purchase-order.partial.grid', compact('type', 'products', 'tags', 'tag'))->render()
        ]);
    }

    public function getVendorwiseInfo(Request $request)
    {
        $type  = 'byVendor';
        $vendor_id = $request->vendor_id;
        $products = Product::with('variants')->whereHas('vendors', function ($query) use ($request) {
            $query->where('vendor_id', $request->vendor_id);
        })->where('status', true)->get();
        $vendors = Vendor::where('status', true)->get();
        return response()->json([
            'status' => 'success',
            'data' => view('admin.purchase-order.partial.grid', compact('type', 'vendor_id', 'products', 'vendors'))->render()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
            $type  = $request->type;
            if ($type == 'byTag') {
                $tags = ProductTag::whereHas('product', function ($query) {
                    $query->where('status', true);
                })->groupBy('name')->get();
                return response()->json([
                    'status' => 'success',
                    'data' => view('admin.purchase-order.partial.grid', compact('type', 'tags'))->render()
                ]);
            }
            if ($type == 'byCategory') {
                $categories = Category::root()->where('status', true)->get();
                $products = collect();
                return response()->json([
                    'status' => 'success',
                    'data' => view('admin.purchase-order.partial.grid', compact('type', 'categories', 'products'))->render()
                ]);
            }
            if ($type == 'byVendor') {
                $vendors = Vendor::where('status', true)->get();
                $products = collect();
                return response()->json([
                    'status' => 'success',
                    'data' => view('admin.purchase-order.partial.grid', compact('type', 'vendors', 'products'))->render()
                ]);
            }
            if ($type == 'byFavorite') {
                $products = Product::with('variants')->where('favorite', true)->where('status', true)->get();
                return response()->json([
                    'status' => 'success',
                    'data' => view('admin.purchase-order.partial.grid', compact('type', 'products'))->render()
                ]);
            }
        }

        $title = $this->create_title;
        $products = Product::with('variants')->get();
        $stores = Store::where('status', true)->get();
        $vendors = Vendor::where('status', true)->get();
        return view("admin.{$this->path}.create", compact('title', 'products', 'stores', 'vendors'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'nullable|unique:stores,code'
        ]);

        $this->model::create([
            'name' => $request->name,
            'code' => $request->code,
            'location' => $request->location,
            'address' => $request->address,
            'remarks' => $request->remarks
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
    public function edit(string $id)
    {
        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
            'code' => 'nullable|unique:stores,code,' . $id
        ]);

        $data = $this->model::findOrFail($id);
        $data->update([
            'name' => $request->name,
            'code' => $request->code,
            'location' => $request->location,
            'address' => $request->address,
            'remarks' => $request->remarks
        ]);

        return redirect()->route("admin.{$this->path}.index")->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id);
    }
}
