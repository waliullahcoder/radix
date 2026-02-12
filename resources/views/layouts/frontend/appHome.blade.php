<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta name="description" content="Radix Collection Ltd. is a trusted stock Moja Factory and Moja fashion brand in Bangladesh, delivering premium quality apparel with modern design and reliable manufacturing.">
    <meta name="keywords" content="Radix Collection Ltd, Stock Factory manufacturer Bangladesh, fashion brand Bangladesh, apparel factory, Moja production company">

    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $settings->title }}</title>
    <link rel="shortcut icon"
        href="{{ asset(file_exists($settings->favicon) ? $settings->favicon : 'frontend/images/logo/favicon.png') }}"
        type="image/x-icon">
    @include('layouts.frontend.partial.styles')

</head>

<body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->

    <!-- Mobile Menu -->
   @include('layouts.frontend.partial.mobile_menu')
    <!-- Mobile Menu End -->

    <!-- Header Section Begin -->
    @include('layouts.frontend.partial.header')
    <!-- Header Section End -->

    <!-- Left Menu & Banner Section Begin -->
    @include('layouts.frontend.partial.left_menu_and_banner')
    <!-- Left Menu & Banner Section  End -->

    <!-- Categories Section Begin -->
   @include('layouts.frontend.partial.categories_section')
    <!-- Categories Section End -->

    <!-- Featured Section Begin -->
    @include('layouts.frontend.partial.features_section')
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    @include('layouts.frontend.partial.banner_section')
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
     @yield('content')
    <!-- Latest Product Section End -->

    <!-- Exclusive Section Begin -->
    @include('layouts.frontend.partial.exclusive_section')
    <!-- Exclusive Section End -->

    <!-- Footer Section Begin -->
    @include('layouts.frontend.partial.footer')
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    
    @include('layouts.frontend.partial.scripts')
 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>

<script defer="" src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" data-cf-beacon="{" version":"2024.11.0","token":"cd0b4b3a733644fc843ef0b185f98241","server_timing":{"name":{"cfcachestatus":true,"cfedge":true,"cfextpri":true,"cfl4":true,"cforigin":true,"cfspeedbrain":true},"location_startswith":null}}"="" crossorigin="anonymous"></script>

<script>
$(document).ready(function () {

    $('.add-to-cart').click(function (e) {
        e.preventDefault();

        let button = $(this);   // ✅ আগে declare

        let productId = button.data('id');
        let variantId = button.data('variant_id');
        let image = button.closest('.product-card').find('.product-img');
        let cart = $('.cart-icon');
  if (!image.length) {
            console.warn('Product image not found for flying animation');
            return;
        }
        let flyingImg = image.clone()
            .css({
                position: 'absolute',
                zIndex: 999,
                width: image.width(),
                top: image.offset().top,
                left: image.offset().left
            })
            .appendTo('body');

        flyingImg.animate({
            top: cart.offset().top,
            left: cart.offset().left,
            width: 20,
            opacity: 0.5
        }, 700, function () {
            flyingImg.remove();
        });

        $.post("{{ route('cart.add') }}", {
            _token: "{{ csrf_token() }}",
            product_id: productId,
            variant_id: variantId
        }, function (res) {
            $('.cart-count').text(res.count);
        });

    });

});
</script>
<script>
$(document).ready(function () {

    function calculateCart() {
        let subtotal = 0;

        $('.cart-item').each(function () {
            let price = parseFloat($(this).data('price'));
            let qty   = parseInt($(this).find('.qty').val());
            subtotal += price * qty;
        });

        let discount = subtotal * 0.10;
        let tax      = subtotal * 0.05;
        let total    = subtotal - discount + tax;

        $('#subtotal').text('৳ ' + subtotal.toFixed(2));
        $('#discount').text('- ৳ ' + discount.toFixed(2));
        $('#tax').text('৳ ' + tax.toFixed(2));
        $('#total').text('৳ ' + total.toFixed(2));
    }

    calculateCart();

    $(document).on('click', '.qty-plus, .qty-minus', function () {

        let card = $(this).closest('.cart-item');
        let qtyInput = card.find('.qty');
        let qty = parseInt(qtyInput.val());
        let price = parseFloat(card.data('price'));

        if ($(this).hasClass('qty-plus')) {
            qty++;
        } else {
            qty = Math.max(1, qty - 1);
        }

        qtyInput.val(qty);

        let itemTotal = price * qty;
        card.find('.item-subtotal').text('৳ ' + itemTotal.toFixed(2));

        $.ajax({
            url: "{{ route('cart.update') }}",
            method: "POST",
            data: {
                _token: "{{ csrf_token() }}",
                id: card.data('id'),
                qty: qty
            }
        });

        calculateCart();
    });

});
</script>
</body>


</html>

