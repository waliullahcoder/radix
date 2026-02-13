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

<script>
$(document).ready(function () {

    $('.add-to-cart').click(function (e) {
        e.preventDefault();

        let button = $(this);

        let productId = button.data('id');
        // 🔥 Existing variant_id button data
        let variantId = button.data('variant_id');

        // 🔥 Selected size jodi undefined hoy
        if (variantId === undefined) {
            variantId = $('input[name="variant_id"]:checked').val();
        }

        // 🔥 Check
        if (!variantId) {
            alert('Please select a size');
            return;
        }

        let image = button.closest('.product-card').find('.product-img');
        let cart = $('.cart-icon');

        if (!image.length) {
            console.warn('Product image not found for flying animation');
            return;
        }

        let flyingImg = image.clone()
             .css({
                position: 'absolute',
                zIndex: 9999, // increase z-index
                width: image.width(),
                top: image.offset().top,
                left: image.offset().left,
                pointerEvents: 'none', // prevent hover issues
            })
            .appendTo('body');

        flyingImg.animate({
            top: cart.offset().top,
            left: cart.offset().left,
            width: 20,
            height: 20,
            opacity: 0.5
        }, 700, function () {
            flyingImg.remove();
        });

        $.post("{{ route('cart.add') }}", {
            _token: "{{ csrf_token() }}",
            product_id: productId,
            variant_id: variantId,
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

