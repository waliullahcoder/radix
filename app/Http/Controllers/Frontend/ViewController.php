<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\HomeSection;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
class ViewController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function index()
    {
        $menus = $this->frontEndService->getMenu();
        $slides = Slider::where('status', true)->get();
        //Homepage Category all
        $get_sub_categories_all = $this->frontEndService->getSubCategoryHomePageOnly();
        // $get_sub_category_product_all = $this->frontEndService->getSubCategoryHomePageProductOnly();

        // //ট্রেন্ডিং বইসমূহ and নতুন প্রকাশিত বই
        $get_sub_category_trends_new_book_product_only = $this->frontEndService->getSubCategoryTrendsNewBookProductOnly();
        //Banner add category
        $get_sub_category_banner_only = $this->frontEndService->getSubCategoryBannerOnly();
        //সিয়ান যুগপূর্তি অফার and রবিউল আউয়াল সীরাত গ্রন্থমালা
        $get_sub_category_sian_jugpuerti_nrobiul_aual_product_only = $this->frontEndService->getSubCategorySianJugpuertiNrobiulAualProductOnly();
        //জনপ্রিয় লেখক
        $get_sub_category_writer_only = $this->frontEndService->getSubCategoryWriterOnly();
        //আতর ও সুগন্ধি পণ্য
        $get_sub_category_atar_sugondhi_product_only = $this->frontEndService->getSubCategoryAtarSugondhiProductOnly();
        //অন্যান্য পণ্য
        $get_sub_category_others_only = $this->frontEndService->getSubCategoryOthersOnly();
        //ব্র্যান্ডসমূহ
        $get_sub_category_brand_only = $this->frontEndService->getSubCategoryBrandOnly();
 

        $homeSections = HomeSection::orderBy('serial', 'asc')->get();
        return view('frontend.home', compact(
            'slides', 
            'homeSections',
            'menus',
            'get_sub_categories_all',
            'get_sub_category_trends_new_book_product_only',
            'get_sub_category_banner_only',
            'get_sub_category_sian_jugpuerti_nrobiul_aual_product_only',
            'get_sub_category_writer_only',
            'get_sub_category_atar_sugondhi_product_only',
            'get_sub_category_others_only',
            'get_sub_category_brand_only'
        ));
    }
    public function categoryPage($cat_id, $slug, $menu)
    {
        $menus = $this->frontEndService->getMenu();
        $authors = $this->frontEndService->getAuthor();
        $publications = $this->frontEndService->getPublication();
        $subcategories = $this->frontEndService->getProductData($cat_id);
        return view('frontend.categories.index', compact('menus','subcategories','authors','publications'));
    }

    public function singleCategoryPage($sub_cat_id)
    {
        $single_sub_category = $this->frontEndService->singleCategoryPage($sub_cat_id);
         $menus = $this->frontEndService->getMenu();
        $subcategories = $this->frontEndService->getProductData($sub_cat_id);
        $authors = $this->frontEndService->getAuthor();
        $publications = $this->frontEndService->getPublication();
        return view('frontend.categories.single_sub_category_page', compact('menus','subcategories','single_sub_category','authors','publications'));
    }
    public function productDetails($id)
    {
        $menus = $this->frontEndService->getMenu();
        $product = $this->frontEndService->productDetails($id);
        $relatedProducts = $this->frontEndService->productAll();
        return view('frontend.products.productDetails', compact('product','menus','relatedProducts'));
    }

    public function signinPage()
    {
          $menus = $this->frontEndService->getMenu();
        return view('frontend.auth.signin',compact('menus'));
    }
    public function signupPage()
    {
        $menus = $this->frontEndService->getMenu();
        return view('frontend.auth.signup',compact('menus'));
    }
    public function contactPage()
    {
        $menus = $this->frontEndService->getMenu();
        return view('frontend.contacts.contact',compact('menus'));
    }
}
