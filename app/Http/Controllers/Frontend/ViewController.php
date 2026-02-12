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
       
        return view('frontend.home', compact(
            'menus'
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
