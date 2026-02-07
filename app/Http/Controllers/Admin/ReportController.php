<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request; // 
use App\Models\Product;
use App\Models\Setting;
use PDF;
use Exception;
use File;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
use Mike42\Escpos\Printers\RongtaRP850Printer;
use Milon\Barcode\DNS1D;
class ReportController extends Controller
{
   public function generateBarcode(Request $request)
    {
       
    $path = public_path('products.json');

    
        if ($request->isMethod('GET')) {
            $title = 'Generate Barcode';
           // $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            $products = json_decode(File::get($path));
           // dd($products);
            $target_blank = true;
            return view('admin.generate_barcode.create', compact('title', 'products', 'target_blank'));
        }

        ini_set('max_execution_time', '500');
        ini_set("pcre.backtrack_limit", "5000000");

        $quantity = $request->quantity;
        $product_name = $request->product_name;
        $product_code = $request->product_code;
        $price = $request->price;
        return view('admin.generate_barcode.print', compact('quantity', 'product_name', 'product_code', 'price'));
        
        // $pdf = PDF::loadView('admin.generate_barcode.print', compact('quantity', 'product_name', 'product_code', 'price'));
        // $pdf->setPaper('A4');
        // return $pdf->stream('barcodes.pdf');

        // $pdf = PDF::loadView('admin.generate_barcode.printFULL_WIDTH', compact('quantity', 'product_name', 'product_code', 'price'));
        // $pdf->setPaper('A4');
        // return $pdf->stream('barcodes.pdf');
    }
}
