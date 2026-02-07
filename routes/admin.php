<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\{
    UomController,
    AuthController,
    RoleController,
    AdminController,
    SettingController,
    CategoryController,
    AttributeController,
    AdminMenuController,
    AdminSettingController,
    AttributeValueController,
    AdminMenuActionController,
    AuthorController,
    BookController,
    BrandController,
    HomeSectionController,
    ProductController,
    PublicationController,
    PurchaseOrderController,
    PurchaseReceiptController,
    SliderController,
    StoreController,
    VendorController,
    MenuController,
    MenuItemController,
    ReportController,
    AdminOrderController,
};

Route::middleware('guest')->group(function () {
    Route::get('/', [AuthController::class, 'index'])->name('login.index');
    Route::match(['get', 'post'], '/login', [AuthController::class, 'login'])->name('login');
});
Route::post('/sidebar', [AuthController::class, 'sidebar'])->name('sidebar');

Route::group(['middleware' => ['admin']], function () {
    Route::get('/dashboard', [AuthController::class, 'dashboard'])->name('dashboard');
    Route::get('/profile', [AuthController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AuthController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AuthController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AuthController::class, 'update'])->name('profile.update');
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

        // Admin order Management
    Route::get('/orders', [AdminOrderController::class, 'index'])
        ->name('orders.index');
    Route::get('/orders/{order}', [AdminOrderController::class, 'show'])
        ->name('orders.show');
    Route::get('/orders/{order}/track', [AdminOrderController::class, 'track'])
        ->name('orders.track');
    Route::get('/orders/{order}/invoice', [AdminOrderController::class, 'invoice'])
        ->name('orders.invoice');
    Route::post('/admin/orders/{order}/status', [AdminOrderController::class, 'updateStatus'])
    ->name('orders.updateStatus');


    // Admin Setting
    Route::resource('/admin-settings', AdminSettingController::class);

    // Admin Menu
    Route::resource('/admin-menu', AdminMenuController::class);

    //Menu
    Route::resource('/menu', MenuController::class);
    // Menu Item
    Route::get('/menu-item/{id}', [MenuItemController::class, 'index'])->name('menu-item.index');
    Route::put('/menu-item/{id}', [MenuItemController::class, 'update'])->name('menu-item.update');
    Route::get('/menu-item-status/{id}', [MenuItemController::class, 'edit'])->name('menu-item.status');
    Route::post('/menu-item', [MenuItemController::class, 'store'])->name('menu-item.store');
    Route::delete('/menu-item/{id}', [MenuItemController::class, 'destroy'])->name('menu-item.destroy');

    // Admin Menu Actions
    Route::get('/admin-menu-action/{id}', [AdminMenuActionController::class, 'index'])->name('admin-menu-action.index');
    Route::get('/admin-menu-action/{id}/create', [AdminMenuActionController::class, 'create'])->name('admin-menu-action.create');
    Route::post('/admin-menu-action/{id}/store', [AdminMenuActionController::class, 'store'])->name('admin-menu-action.store');
    Route::get('/admin-menu-action/{id}/edit', [AdminMenuActionController::class, 'edit'])->name('admin-menu-action.edit');
    Route::put('/admin-menu-action/{id}', [AdminMenuActionController::class, 'update'])->name('admin-menu-action.update');
    Route::delete('/admin-menu-action/{id}', [AdminMenuActionController::class, 'destroy'])->name('admin-menu-action.destroy');

    // Role
    Route::resource('/role', RoleController::class);

    // Permission
    Route::get('/permission/{id}/edit', [RoleController::class, 'rolePermissionEdit'])->name('role-permission.edit');
    Route::put('/permission/{id}', [RoleController::class, 'rolePermissionUpdate'])->name('role-permission.update');

    // User
    Route::resource('/user', AdminController::class);
    Route::get('/user/{id}/password', [AdminController::class, 'changePassword'])->name('user.password');
    Route::put('/user/password/{id}', [AdminController::class, 'passwordUpdate'])->name('user.password.update');

    // Category
    Route::resource('/category', CategoryController::class);

    // Uom
    Route::resource('/uom', UomController::class);

    // Attribute
    Route::resource('/attribute', AttributeController::class);

    // Attribute Value
    Route::get('/attribute-value/{id}', [AttributeValueController::class, 'index'])->name('attribute-value.index');
    Route::get('/attribute-value/{id}/create', [AttributeValueController::class, 'create'])->name('attribute-value.create');
    Route::post('/attribute-value/{id}/store', [AttributeValueController::class, 'store'])->name('attribute-value.store');
    Route::get('/attribute-value/{id}/edit', [AttributeValueController::class, 'edit'])->name('attribute-value.edit');
    Route::put('/attribute-value/{id}', [AttributeValueController::class, 'update'])->name('attribute-value.update');
    Route::delete('/attribute-value/{id}', [AttributeValueController::class, 'destroy'])->name('attribute-value.destroy');

    // Brand
    Route::resource('/brand', BrandController::class);

    // Product
    Route::resource('/product', ProductController::class);
    Route::post('/product/sku-combination', [ProductController::class, 'skuCombination'])->name('product.sku-combination');
    Route::post('/product/sku-combinations-edit/{id}', [ProductController::class, 'skuCombinationEdit'])->name('product.sku-combination.edit');

    // Author
    Route::resource('/author', AuthorController::class);

    // Publication
    Route::resource('/publication', PublicationController::class);

    // Books
    Route::resource('/book', BookController::class);

    // Vendor
    Route::resource('/vendor', VendorController::class);

    // Store
    Route::resource('/store', StoreController::class);

    // Purchase
    Route::resource('/purchase-order', PurchaseOrderController::class);
    Route::get('get-catwise-info', [PurchaseOrderController::class, 'getCatwiseInfo'])->name('get-catwise-info');
    Route::get('get-tagwise-info', [PurchaseOrderController::class, 'getTagwiseInfo'])->name('get-tagwise-info');
    Route::get('get-vendorwise-info', [PurchaseOrderController::class, 'getVendorwiseInfo'])->name('get-vendorwise-info');
    Route::get('products/{id}/variants', function ($id) {
        $variants = \App\Models\ProductVariant::with(['values'])->where('product_id', $id)->where('status', true)->get();
        return view('admin.purchase-order.partial.grid', ['variants' => $variants])->render();
    });

    // Purchase Receipt
    Route::resource('/purchase-receipt', PurchaseReceiptController::class);
});

// Reports
Route::group(['middleware' => ['admin']], function () {
Route::match(['get', 'post'], '/generate-barcode', [ReportController::class, 'generateBarcode'])->name('generate-barcode.index');
Route::get('/product-search', [ReportController::class, 'productSearch'])->name('product.search');

});

// Frontend CMS
Route::group(['middleware' => ['admin']], function () {
    // Settings
    Route::resource('/settings', SettingController::class);
    // Slider
    Route::resource('/slider', SliderController::class);
    // Home Section
    Route::resource('/home-section', HomeSectionController::class);
});
