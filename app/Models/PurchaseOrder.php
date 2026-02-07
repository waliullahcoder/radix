<?php

namespace App\Models;

use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PurchaseOrder extends Model
{
    use SoftDeletes;
    protected $fillable = ['po_number', 'store_id', 'vendor_id', 'order_date', 'expected_date', 'total_amount', 'discount_amount', 'tax_amount', 'grand_total', 'status', 'notes', 'created_by', 'updated_by', 'deleted_by'];
    protected $appends = ['orderDate', 'expectedDate'];

    protected static function booted()
    {
        // Automatically set created_by and updated_by
        static::creating(function ($order) {
            $order->created_by = Auth::id();
            $order->updated_by = Auth::id();
        });

        static::updating(function ($order) {
            $order->updated_by = Auth::id();
        });

        // Soft delete children and set deleted_by
        static::deleting(function ($order) {
            if (! $order->isForceDeleting()) {
                // Set deleted_by on children
                $order->items()->update([
                    'deleted_by' => Auth::id(),
                ]);

                // Soft delete children
                $order->items()->delete();

                // Set deleted_by on parent
                $order->deleted_by = Auth::id();
                $order->save();
            }
        });

        // Restore children and clear deleted_by
        static::restoring(function ($order) {
            $order->items()->withTrashed()->update([
                'deleted_by' => null,
            ]);
            $order->items()->restore();

            $order->deleted_by = null;
        });
    }

    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id');
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendor_id');
    }

    public function items()
    {
        return $this->hasMany(PurchaseOrderItem::class);
    }

    public function purchaseReceipts()
    {
        return $this->hasMany(PurchaseReceipt::class);
    }

    // Optional: track users
    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function deletedBy()
    {
        return $this->belongsTo(User::class, 'deleted_by');
    }

    public function getOrderDateAttribute()
    {
        return date('d-m-Y', strtotime($this->order_date));
    }

    public function getExpectedDateAttribute()
    {
        return date('d-m-Y', strtotime($this->expected_date));
    }
}
