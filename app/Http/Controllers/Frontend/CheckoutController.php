<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\HomeSection;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProductVariant;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
class CheckoutController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }
  
    public function checkout()
    {
        $cart = session('cart', []);

        if (count($cart) == 0) {
            return redirect()->back()->with('error', 'Cart is empty');
        }

         $menus = $this->frontEndService->getMenu();
        return view('frontend.checkout.index', compact('menus','cart'));
    }


    public function placeOrder(Request $request)
    {
        $request->validate([
            'payment_method' => 'required',
        ]);

        DB::beginTransaction();

        try {

            // 1️⃣ User handle
            if (auth()->check()) {
                $user = auth()->user();
            } else {
                $user = User::create([
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => bcrypt($request->password),
                ]);
                auth()->login($user);
            }

            $cart = session('cart');

            // 2️⃣ Order create (NOW WITH TOTALS)
            $order = Order::create([
                'user_id'        => $user->id,
                'order_number'   => 'ORD-' . time(),
                'subtotal'       => $request->subtotal,
                'discount'       => $request->discount ?? 0,
                'tax'            => $request->tax ?? 0,
                'total'          => $request->total,
                'comments'       => $request->comments,
                'payment_method' => $request->payment_method,
                'status'         => 'pending',
            ]);

            // 3️⃣ Order items + stock reduce
            foreach ($cart as $item) {

                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['id'],
                    'product_variant_id' => $item['variant_id'] ?? null,
                    'qty' => $item['qty'],
                    'price' => $item['price'],
                    'total' => $item['price'] * $item['qty'],
                ]);

                // Variant stock reduce
                if (!empty($item['variant_id'])) {
                    ProductVariant::where('id', $item['variant_id'])
                        ->decrement('stock', $item['qty']);
                }
            }

            session()->forget('cart');

            DB::commit();

            return redirect()->route('order.success')
                ->with('success', 'Order placed successfully');

        } catch (\Exception $e) { dd($e->getMessage());
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }



}