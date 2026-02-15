<?php

namespace App\Providers;

use App\Models\Setting;
use App\Models\AdminMenu;
use App\Models\AdminSetting;
use App\Models\Category;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (app()->environment('production')) {
            URL::forceScheme('https');
        }

        view()->composer('*', function ($view) {
            $admin_menus = Cache::remember('admin_menus', 3600, function () {
                return AdminMenu::root()->with([
                    'children' => function ($q) {
                        $q->where('status', 1)->orderBy('order', 'asc');
                    },
                    'actions',
                ])->where('status', 1)->orderBy('order', 'asc')->get();
            });
            $admin_setting = Cache::remember('admin_setting', 3600, function () {
                return AdminSetting::first();
            });
             
           $view->with(
                'categories',
                Category::whereNull('parent_id')
                    ->where('status', 1)
                    ->get()
            );
             $view->with(
                'categories_prod',
                Category::with(['children'])
                                        ->whereNull('parent_id')
                                        ->whereIn('position', ['header_parent', 'left_side', 'feature_product', 'banner_section', 'exclusive_collection'])
                                        ->where('status', 1)
                                        ->orderBy('name', 'asc')
                                        ->get()
            );

            $view->with(
                'sub_categories',
                Category::whereNotNull('parent_id')
                    ->where('status', 1)
                    ->get()
                    ->groupBy('parent_id')
            );
     
            $view->with(
                'subbcategories',
                Category::whereNotNull('parent_id')
                    ->where('status', 1)
                    ->get()
            );
            $settings = Cache::remember('setting', 3600, function () {
                return Setting::first();
            });
            $view->with(['admin_menus' => $admin_menus, 'admin_setting' => $admin_setting, 'settings' => $settings]);
        });
    }
}
