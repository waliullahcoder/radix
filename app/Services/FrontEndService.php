<?php

namespace App\Services;

use App\HelperClass;
use App\Models\Menu;
use App\Models\MenuItem;
use App\Models\Category;
use App\Models\Publication;
use App\Models\Product;
use App\Models\Author;
use App\Services\Utility\ProductUtility;
use Illuminate\Support\Facades\Auth;
use DB;

class FrontEndService
{
    public function getMenu()
    {

/*
|--------------------------------------------------------------------------
| MAIN MENUS (parent_id = NULL)
|--------------------------------------------------------------------------
*/
$menus = Category::whereNull('parent_id')
    ->where('status', 1)
    ->select(
        'id',
        'id as category_id',
        'name',
        'url as menu_url',
        'name as category_name',
        'image as image',
        'description',
        'slug as category_slug',
        'position'
    )
    ->get()
    ->groupBy('position');

$data['header_parent']         = $menus['header_parent']        ?? collect();
$data['header_child']      = $menus['header_child']            ?? collect();
$data['left_side']        = $menus['left_side']  ?? collect();
$data['single_page']        = $menus['single_page']  ?? collect();
$data['feature_product'] = $menus['feature_product']       ?? collect();
$data['banner_section'] = $menus['banner_section']       ?? collect();
$data['exclusive_collection'] = $menus['exclusive_collection']       ?? collect();
$data['footer_col1'] = $menus['footer_col1']       ?? collect();
$data['footer_col2'] = $menus['footer_col2']       ?? collect();

$data['header_child'] = Category::whereNotNull('parent_id')
    ->where('status', 1)
    ->where('position', 'header_child')
    ->select(
        'id',
        'name',
        'parent_id',
        'slug as category_slug'
    )
    ->get()
    ->groupBy('parent_id');

    return $data;


    }

     public function getSubCategoryData($category_id){
             return DB::table('categories')
            ->where('parent_id', $category_id)
            ->get();
     }
     public function singleDetails($id){
        return DB::table('categories')
            ->where('id', $id)
            ->first();
     }

 public function getProductData($cat_id)
{
   
$categories = Category::where('parent_id', $cat_id)
        ->with('products','products.variants')
        ->get();
       return $categories;
}

//--------------Home Page----------------//

//Homepage Category all
public function getSubCategoryHomePageOnly()
{
$categories = Category::whereNotNull('parent_id')->where('position', 'homepage')->orderBy('id', 'desc')->get();
       return $categories;
}

//ট্রেন্ডিং বইসমূহ and নতুন প্রকাশিত বই
public function getSubCategoryTrendsNewBookProductOnly()
{
return Category::whereNotNull('parent_id')
    ->whereIn('slug', ['trending-bismuuh', 'ntun-prkasit-bi'])
    ->with('products','products.variants')
    ->orderBy('id', 'asc')
    ->get();
}

//Banner add category
public function getSubCategoryBannerOnly()
{
    return Category::whereNotNull('parent_id')->where('position', 'homepage_banner_category')->get();
}

//সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা
public function getSubCategorySianJugpuertiNrobiulAualProductOnly()
{
return Category::whereNotNull('parent_id')
    ->whereIn('slug', ['sizan-zugpuurti-ofar', 'rbiul-auzal-seerat-grnthmala'])
    ->with('products','products.variants')
    ->orderBy('id', 'asc')
    ->get();
}
//জনপ্রিয় লেখক
public function getSubCategoryWriterOnly()
{
    return Category::whereNotNull('parent_id')->where('position', 'homepage_writter_category')->get();
}

//আতর ও সুগন্ধি পণ্য
public function getSubCategoryAtarSugondhiProductOnly()
{
    return Category::whereNotNull('parent_id')
    ->whereIn('slug', ['atr-oo-sugndhi-pnz'])
    ->with('products','products.variants')
    ->orderBy('id', 'asc')
    ->get();
}

//অন্যান্য পণ্য
public function getSubCategoryOthersOnly()
{
    return Category::whereNotNull('parent_id')->where('position', 'homepage_others_category')->get();
}

//ব্র্যান্ডসমূহ
public function getSubCategoryBrandOnly()
{
    return Category::whereNotNull('parent_id')->where('position', 'homepage_brands_category')->get();
}

//--------------Home Page\\\\\\\\\\----------------//

public function getSubCategoryDataAll()
{
   
$categories = Category::whereNotNull('parent_id')->get();
       return $categories;
}

public function getSubCategoryProductAll()
{
$get_sub_category_product_all = Category::whereNotNull('parent_id')->with('products','products.variants')->get();
       return $get_sub_category_product_all;
}

 public function singleCategoryPage($sub_cat_id)
{
   
    $single_sub_category = Category::with('products','products.variants')
        ->where('id', $sub_cat_id)
        ->first();
        return $single_sub_category;
    }

public function productDetails($id)
{
   
    $product = Product::with('variants')
        ->where('id', $id)
        ->first();
        return $product;
}   

public function getAuthor()
{
   $authors = Author::orderBy('id', 'desc')
    ->limit(10)
    ->get();
    return $authors;
}
public function getPublication()
{
    $publications = Publication::orderBy('id', 'desc')->limit(10)->get();
        return $publications;
}
public function productAll()
{
    $product = Product::with('variants')
        ->orderBy('id', 'desc')
        ->get()->random(4);
        return $product;
}  

}