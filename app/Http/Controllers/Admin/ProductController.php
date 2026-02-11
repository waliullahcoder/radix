<?php

namespace App\Http\Controllers\Admin;

use App\Models\Uom;
use App\HelperClass;
use App\Models\Brand;
use App\Models\Author;
use App\Models\Publication;
use App\Models\ProductAuthor;
use App\Models\Vendor;
use App\Models\Product;
use App\Models\Category;
use App\Models\Attribute;
use App\Models\ProductTag;
use App\Models\ProductVariant;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use App\Models\AttributeValue;
use App\Services\ProductService;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Services\ProductVariantService;

class ProductController extends Controller
{
    public $path;
    public $title;
    public $model;
    public $edit_title;
    public $create_title;
    protected $productService;
    protected $productVariantService;
    public function __construct(ProductService $productService, ProductVariantService $productVariantService)
    {
        $this->path = 'product';
        $this->title = 'Product Items';
        $this->create_title = 'Add Product';
        $this->edit_title = 'Update Product';
        $this->model = Product::class;
        $this->productService = $productService;
        $this->productVariantService = $productVariantService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return HelperClass::resourceDataView($this->model::with(['category', 'uom'])->where('product_type', 'book')->orderBy('id', 'desc'), 'thumbnail', null, $this->path, $this->title);
    }

    public function skuCombination(Request $request)
    {
        if ($request->ajax()) {
            $options = array();
            $purchase_price = $request->purchase_price;
            $regular_price = $request->regular_price;

            if ($request->has('choice_no')) {
                foreach ($request->choice_no as $no) {
                    $name = 'choice_options_' . $no;
                    $data = array();
                    if (!is_null($request[$name])) {
                        foreach ($request[$name] as $item) {
                            array_push($data, $item);
                        }
                    }
                    if (count($data) == 0) {
                        continue;
                    }
                    array_push($options, $data);
                }
            }
            $combinations = HelperClass::makeCombinations($options);
            return view('admin.product.partial.sku-combinations', compact('combinations', 'purchase_price', 'regular_price'));
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->ajax() && $request->has('get_choices')) {
            $allValues = AttributeValue::with(['attribute'])->where('attribute_id', $request->attribute_id)->get();
            $html = '';
            foreach ($allValues as $row) {
                $html .= '<option value="' . $row->id . '">' . $row->name . '</option>';
            }
            return json_encode($html);
        }

        $title = $this->create_title;
        $brands = Brand::where('status', true)->orderBy('name', 'asc')->get();
        $uoms = Uom::where('status', true)->orderBy('name', 'asc')->get();
        $subcategories = Category::whereNotNull('parent_id')->where('status', true)->orderBy('name', 'asc')->get();
        $vendors = Vendor::where('status', true)->orderBy('name', 'asc')->get();
        $attributes = Attribute::where('status', true)->orderBy('name', 'asc')->get();
        $authors = Author::where('status', true)->orderBy('name', 'asc')->get();
        $publications = Publication::where('status', true)->orderBy('name', 'asc')->get();
        return view("admin.{$this->path}.create", compact('title', 'brands', 'uoms', 'subcategories', 'vendors', 'attributes', 'authors', 'publications'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'        => 'required',
            'uom_id'      => 'required',
            'category_id' => 'required',
            'barcode'     => 'nullable|unique:products,barcode',
        ]);

        if(!empty($request->name)) {
           $exists=Product::where('name', $request->name)->exists();
           if($exists) {
            return back()->withErrors('Product already exists');
           }
        }

        try {
            DB::transaction(function () use ($request) {

                // ✅ PRODUCT STORE
                $product = $this->productService
                    ->store($request->except(['_token', 'choice']));

                // ✅ VARIANT (safe)
            //   if ($request->filled('variant')) {
            //         $this->productVariantService->store(
            //             $request->only(['variant', 'purchase_price', 'sale_price', 'sku']),
            //             $product
            //         );
            //     }

          if (!empty($request->variants) && isset($request->variants[0])) {
                    $variants = json_decode($request->variants[0]);
                    if (is_array($variants) || is_object($variants)) {
                        foreach ($variants as $variant) {
                            ProductVariant::create([
                                'product_id' => $product->id,
                                'variant' => $variant->value,
                                'sku'            => $request->sku ?? null,
                                'purchase_price' => $request->purchase_price ?? 0,
                                'regular_price'  => $request->regular_price ?? 0,
                                'sale_price'     => $request->sale_price ?? 0,
                                'status'         => true,
                            ]);
                        }
                    }
                }



                // ✅ IMAGES (NULL SAFE)
                if ($request->hasFile('images')) {
                    foreach ($request->file('images') as $image) {
                        ProductImage::create([
                            'product_id' => $product->id,
                            'image' => HelperClass::saveImage($image, 800, 'media/product'),
                        ]);
                    }
                }

                // ✅ VENDORS (NULL SAFE)
                if (!empty($request->vendor_id)) {
                    $product->vendors()->attach($request->vendor_id);
                }

                // ✅ TAGS (NULL SAFE)
                if (!empty($request->tags) && isset($request->tags[0])) {
                    $tags = json_decode($request->tags[0]);
                    if (is_array($tags) || is_object($tags)) {
                        foreach ($tags as $tag) {
                            ProductTag::create([
                                'product_id' => $product->id,
                                'name' => $tag->value
                            ]);
                        }
                    }
                }

                // ✅ AUTHOR (NULL SAFE)
                if (!empty($request->author_id)) {
                    ProductAuthor::create([
                        'product_id' => $product->id,
                        'author_id'  => $request->author_id
                    ]);
                }
            });

            return redirect()
                ->route("admin.{$this->path}.index")
                ->withSuccessMessage('✅ Created Successfully!');

        } catch (\Throwable $e) {

            return back()
                ->withInput()
                ->withErrors([
                    'error' => '❌ ' . $e->getMessage()
                ]);
        }
    }


    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    public function skuCombinationEdit(Request $request, string $id)
    {
        $product = Product::findOrFail($id);

        $options = array();
        $purchase_price = $request->purchase_price;
        $regular_price = $request->regular_price;

        if ($request->has('choice_no')) {
            foreach ($request->choice_no as $no) {
                $name = 'choice_options_' . $no;
                $data = array();
                if (!is_null($request[$name])) {
                    foreach ($request[$name] as $item) {
                        array_push($data, $item);
                    }
                }
                if (count($data) == 0) {
                    continue;
                }
                array_push($options, $data);
            }
        }

        $combinations = HelperClass::makeCombinations($options);
        return view('admin.product.partial.sku-combinations-edit', compact('combinations', 'purchase_price', 'regular_price', 'product'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        if ($request->ajax() && $request->has('get_choices')) {
            $allValues = AttributeValue::with(['attribute'])->where('attribute_id', $request->attribute_id)->get();
            $html = '';
            foreach ($allValues as $row) {
                $html .= '<option value="' . $row->id . '">' . $row->name . '</option>';
            }
            return json_encode($html);
        }

        $additionalData = [
            'brands' => Brand::where('status', true)->orderBy('name', 'asc')->get(),
            'uoms' => Uom::where('status', true)->orderBy('name', 'asc')->get(),
            'categories' => Category::where('status', true)->orderBy('name', 'asc')->get(),
            'vendors' => Vendor::where('status', true)->orderBy('name', 'asc')->get(),
            'attributes' => Attribute::where('status', true)->orderBy('name', 'asc')->get()
        ];

        return HelperClass::resourceDataEdit($this->model, $id, $this->path, $this->edit_title, $additionalData);
    }

    /**
     * Update the specified resource in storage.
     */
   public function update(Request $request, string $id)
    {
        $request->validate([
            'name'        => 'required',
            'uom_id'      => 'required',
            'category_id' => 'required',
            'barcode'     => 'nullable|unique:products,barcode,' . $id,
        ]);

        try {
            DB::transaction(function () use ($request, $id) {

                $product = $this->model::findOrFail($id);

                // ✅ PRODUCT UPDATE
                $product = $this->productService
                    ->update($request->except(['_token', 'choice']), $product);

                // ✅ VARIANT (NULL SAFE)
                if ($request->filled('variant')) {
                    $this->productVariantService->store(
                        $request->only(['variant', 'purchase_price', 'sale_price', 'sku']),
                        $product
                    );
                }

                // ======================
                // ✅ IMAGES (NULL SAFE)
                // ======================
                if ($request->hasFile('images')) {

                    // delete old images
                    if ($product->images && $product->images->count() > 0) {
                        foreach ($product->images as $img) {
                            if (!empty($img->image) && file_exists($img->image)) {
                                @unlink($img->image);
                            }
                        }
                    }

                    ProductImage::where('product_id', $id)->delete();

                    foreach ($request->file('images') as $image) {
                        ProductImage::create([
                            'product_id' => $id,
                            'image' => HelperClass::saveImage($image, 800, 'media/product'),
                        ]);
                    }
                }

                // ======================
                // ✅ VENDORS (NULL SAFE)
                // ======================
                if (!empty($request->vendor_id)) {
                    $product->vendors()->sync($request->vendor_id);
                } else {
                    $product->vendors()->detach();
                }

                // ======================
                // ✅ TAGS (NULL SAFE)
                // ======================
                ProductTag::where('product_id', $id)->delete();

                if (!empty($request->tags) && isset($request->tags[0])) {
                    $tags = json_decode($request->tags[0]);
                    if (is_array($tags) || is_object($tags)) {
                        foreach ($tags as $tag) {
                            ProductTag::create([
                                'product_id' => $product->id,
                                'name' => $tag->value
                            ]);
                        }
                    }
                }
            });

            return redirect()
                ->route("admin.{$this->path}.index")
                ->withSuccessMessage('✅ Updated Successfully!');

        } catch (\Throwable $e) {

            return back()
                ->withInput()
                ->withErrors([
                    'error' => '❌ ' . $e->getMessage()
                ]);
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        return HelperClass::resourceDataDelete($this->model, $id, ['thumbnail', 'meta_image'], ['images', 'variants']);
    }
}
