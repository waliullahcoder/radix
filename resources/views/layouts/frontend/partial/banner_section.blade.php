<div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="{{ asset(file_exists($settings->banner_one) ? $settings->banner_one : 'frontend/images/banner-2.png') }}" alt="" loading="lazy" decoding="async">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="{{ asset(file_exists($settings->banner_two) ? $settings->banner_two : 'frontend/images/banner-2.png') }}" alt="" loading="lazy" decoding="async">
                    </div>
                </div>
            </div>
        </div>
    </div>