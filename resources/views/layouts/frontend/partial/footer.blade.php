<footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="{{route('home')}}"><img src="{{ asset(file_exists($settings->logo) ? $settings->logo : 'frontend/images/logo.png') }}" alt="" loading="lazy" decoding="async"></a>
                        </div>
                        <ul>
                            <li>{{ $settings->description ?? 'Description' }}</li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Address</h6>
                        <p>{{ $settings->address ?? 'Address' }}</p>
                      
                        <div class="footer__widget__social">
                            <a href="{{ $settings->facebook_page ?? '#' }}" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="{{ $settings->instagram ?? '#' }}" target="_blank"><i class="fa fa-instagram"></i></a>
                            <a href="{{ $settings->twitter ?? '#' }}" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="{{ $settings->pinterest ?? '#' }}" target="_blank"><i class="fa fa-pinterest"></i></a>
                            <a href="{{ $settings->linkedin ?? '#' }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Radix can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright ©<script>document.write(new Date().getFullYear());</script> All rights reserved | This Website is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://radix.com.bd" target="_blank">Radix</a>
  <!-- Link back to Radix can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="frontend/images/payment-item.png" alt="" loading="lazy" decoding="async"></div>
                    </div>
                </div>
            </div>
        </div>
        <script>
    window.addEventListener("scroll", function () {
        let header = document.querySelector(".sticky-header");
        if (window.scrollY > 100) {
            header.classList.add("sticky-active");
        } else {
            header.classList.remove("sticky-active");
        }
    });
</script>

    </footer>