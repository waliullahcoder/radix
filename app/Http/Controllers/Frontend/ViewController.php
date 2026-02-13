<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\Product;
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
        // Base query for active products
        $activeProductsQuery = Product::where('status', 1);

        // Featured Products (latest 8)
        $featuredProducts = (clone $activeProductsQuery)
            ->orderBy('id', 'desc')
            ->take(8)
            ->get();

        // Latest Products (latest 3)
        $latests = (clone $activeProductsQuery)
            ->orderBy('id', 'desc')
            ->take(3)
            ->get();

        // Top Rated Products (rating >= 4) - make sure 'rating' column exists
       $toprated = Product::with('reviews')
                ->where('status', 1)
                ->whereHas('reviews', function($query) {
                    $query->selectRaw('product_id, AVG(rating) as avg_rating')
                        ->groupBy('product_id')
                        ->havingRaw('AVG(rating) >= ?', [1]);
                })
                ->take(3)
                ->get();
        // Products with reviews (latest 3)
        $reviewedproducts = Product::with('reviews')
            ->where('status', 1)
            ->has('reviews')
            ->orderBy('id', 'desc')
            ->take(3)
            ->get();
        return view('frontend.home', compact(
            'menus',
            'featuredProducts',
            'latests',
            'toprated',
            'reviewedproducts'
        ));
    }
    public function categoryPage($cat_id, $slug, $menu)
    {
        $menus = $this->frontEndService->getMenu();
        $authors = $this->frontEndService->getAuthor();
        $publications = $this->frontEndService->getPublication();
        $subcategories = $this->frontEndService->getProductData($cat_id);
         $featuredProducts = Product::where('status', 1)
        ->orderBy('id', 'desc')
        ->take(8)
        ->get();
        return view('frontend.categories.index', compact('menus','subcategories','authors','publications','featuredProducts'));
    }

    public function singleCategoryPage($sub_cat_id)
    {
        $single_sub_category = $this->frontEndService->singleCategoryPage($sub_cat_id);
         $menus = $this->frontEndService->getMenu();
        $subcategories = $this->frontEndService->getProductData($sub_cat_id);
        $authors = $this->frontEndService->getAuthor();
        $publications = $this->frontEndService->getPublication();
         $featuredProducts = Product::where('status', 1)
        ->orderBy('id', 'desc')
        ->take(8)
        ->get();
        return view('frontend.categories.single_sub_category_page', compact('menus','subcategories','single_sub_category','authors','publications','featuredProducts'));
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
    public function singleDetails($id)
    {
        $menus = $this->frontEndService->getMenu();
        $singleDetail = $this->frontEndService->singleDetails($id);
        return view('frontend.page.single',compact('menus','singleDetail'));
    }
}
