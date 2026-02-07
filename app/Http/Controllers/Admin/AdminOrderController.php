<?php

namespace App\Http\Controllers\Admin;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use Barryvdh\DomPDF\Facade\Pdf;

class AdminOrderController extends Controller
{
    protected $adminService;

    public function __construct(FrontEndService $adminService)
    {
        $this->adminService = $adminService;
    }

    /**
     * 📦 Order List (Admin – All Orders)
     */
    public function index(Request $request)
    {
        $query = Order::query();

        // 🔍 Search by order number or status
        if ($request->filled('search')) {
            $query->where(function ($q) use ($request) {
                $q->where('order_number', 'like', '%' . $request->search . '%')
                  ->orWhere('status', 'like', '%' . $request->search . '%');
            });
        }

        $orders = $query->latest()->paginate(100)->withQueryString();

        return view('admin.order.orderList', compact('orders'));
    }

    /**
     * 🔄 Update Order Status (Admin)
     */
    public function updateStatus(Request $request, Order $order)
    {
        $request->validate([
            'status' => 'required|string'
        ]);

        $order->update([
            'status' => $request->status
        ]);

        return redirect()->back()->withSuccessMessage('Order status updated successfully ✅');
    }


    /**
     * 🚚 Track Order
     */
    public function track(Order $order)
    {
        return view('admin.order.track', compact('order'));
    }

    /**
     * 👁 Order Details
     */
    public function show(Order $order)
    {
        $order->load('items.product', 'items.productVariant');

        return view('admin.order.show', compact('order'));
    }

    /**
     * 🧾 Invoice View
     */
    public function invoice(Order $order)
    {
        $order->load('items.product', 'items.productVariant');

        // PDF needed later
        // $pdf = Pdf::loadView('admin.order.invoice', compact('order'));
        // return $pdf->download('invoice-' . $order->order_number . '.pdf');

        return view('admin.order.invoice', compact('order'));
    }

    /**
     * ✅ Order Success (Admin)
     */
    public function success()
    {
        $menus = $this->adminService->getMenu();

        $order = Order::with('items.product')
            ->latest()
            ->first();

        if (!$order) {
            return redirect('/');
        }

        return view('admin.order.success', compact('order', 'menus'))
            ->with('success', 'Order placed successfully');
    }
}
