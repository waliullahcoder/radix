@extends('layouts.admin.app')

@section('content')

<!-- DASHBOARD STYLES -->

<style>
.dashboard-card{border-radius:16px;color:#fff;transition:.3s;box-shadow:0 10px 25px rgba(0,0,0,.15)}
.dashboard-card:hover{transform:translateY(-6px)}
.dashboard-card p{font-size:14px;opacity:.85;margin:0}
.dashboard-card h3{font-weight:700;margin:6px 0}
.dashboard-card .icon{font-size:36px;opacity:.9}
.trend{font-size:13px;font-weight:600}
.trend.up{color:#b6ffda}
.trend.down{color:#ffd1d1}
.bg-gradient-primary{background:linear-gradient(135deg,#4e73df,#224abe)}
.bg-gradient-success{background:linear-gradient(135deg,#1cc88a,#13855c)}
.bg-gradient-warning{background:linear-gradient(135deg,#f6c23e,#dda20a)}
.bg-gradient-danger{background:linear-gradient(135deg,#e74a3b,#be2617)}
.chart-card{border-radius:14px;box-shadow:0 8px 20px rgba(0,0,0,.1)}
</style>

<div class="container-fluid">

<!-- KPI CARDS -->
<div class="row g-4 mb-4">
    <div class="col-xl-3 col-md-6">
        <div class="dashboard-card bg-gradient-primary p-3">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p>Total Sales</p>
                    <h3>৳ {{ number_format(125000) }}</h3>
                    <span class="trend up">▲ 12%</span>
                </div>
                <div class="icon"><i class="fas fa-shopping-cart"></i></div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="dashboard-card bg-gradient-success p-3">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p>Total Orders</p>
                    <h3>{{ number_format(320) }}</h3>
                    <span class="trend up">▲ 8%</span>
                </div>
                <div class="icon"><i class="fas fa-box"></i></div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="dashboard-card bg-gradient-warning p-3">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p>Customers</p>
                    <h3>{{ number_format(210) }}</h3>
                    <span class="trend down">▼ 3%</span>
                </div>
                <div class="icon"><i class="fas fa-users"></i></div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-md-6">
        <div class="dashboard-card bg-gradient-danger p-3">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <p>Stock Value</p>
                    <h3>৳ {{ number_format(56000) }}</h3>
                    <span class="trend down">▼ 3%</span>
                </div>
                <div class="icon"><i class="fas fa-warehouse"></i></div>
            </div>
        </div>
    </div>
   
</div>

<!-- CHARTS -->
<div class="row g-4">
    <div class="col-lg-8">
        <div class="card chart-card">
            <div class="card-header bg-white"><h5 class="mb-0">Monthly Sales</h5></div>
            <div class="card-body"><canvas id="salesChart"></canvas></div>
        </div>
    </div>

    <div class="col-lg-4">
        <div class="card chart-card">
            <div class="card-header bg-white"><h5 class="mb-0">Order Status</h5></div>
            <div class="card-body"><canvas id="orderChart"></canvas></div>
        </div>
    </div>
</div>
```

</div>

<!-- CHART JS -->

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
new Chart(document.getElementById('salesChart'),{
    type:'line',
    data:{labels:['Jan','Feb','Mar','Apr','May','Jun'],datasets:[{label:'Sales',data:[12000,19000,15000,22000,18000,26000],tension:.4,fill:true}]}
});

new Chart(document.getElementById('orderChart'),{
    type:'doughnut',
    data:{labels:['Completed','Pending','Cancelled'],datasets:[{data:[65,25,10]}]}
});
</script>

@endsection
