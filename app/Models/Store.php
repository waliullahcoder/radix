<?php

namespace App\Models;

use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Store extends Model
{
    use SoftDeletes;
    protected $fillable = ['name', 'code', 'location', 'address', 'remarks', 'status', 'created_by', 'updated_by', 'deleted_by'];

    public function purchaseOrders()
    {
        return $this->hasMany(PurchaseOrder::class, 'store_id');
    }

    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }

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
                // Set deleted_by on parent
                $order->deleted_by = Auth::id();
                $order->save();
            }
        });

        // Restore children and clear deleted_by
        static::restoring(function ($order) {
            $order->deleted_by = null;
        });
    }
}
