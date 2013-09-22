<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <r:require modules="application,oauth,css,templateCss,plugins,modernizr, bootstrap" />
</head>
<body>

<div class="page hidden-overflow"> <!--Page Content-->

    <section class="hero hero-unit"> <!--Hero content-->
        <div class="hero-bg"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12">
                    <div class="main-message">
                        <h1 class="hero-heading margin-bottom-lg">Understand your twitter followers needs and interests </h1>
                        <p class="cta-tag">100% FREE. No Credit Card Needed</p>
                        <div class="margin-bottom">
                            <button class="btn btn-primary btn-lg btn-hero login-btn">Login With Twitter</button>
                            <a href="#main-content"><button class="btn btn-success btn-lg btn-hero">Learn More</button></a>
                        </div>

                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-5 col-xs-12">
                    <div class="pad-image"></div>
                </div>
            </div>
        </div>
    </section> <!--End of hero content-->

    <div class="hero-strip margin-bottom-lg">
        <div class="container quotes">
            <p class="single-quote">"It was a revolution in our service and support culture."</p>
        </div>
    </div>

    <div class="main-content" id="main-content"> <!-- Main Content-->

        <section class="intro">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="main-title margin-bottom">What are your followers interested in?</h2>
                        <p class="lead text-center">Twitter Intelligence downloads data from your followers and mines this data for useful information. This allows you to better understand your following and adjust your social marketing strategy to meet their needs. </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="featuresSection">
            <div class="container">

                <div id="feature1" class="featurette">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <h2 class="featurette-heading">How new are your followers to twitter? <span class="muted">Charts!</span></h2>
                            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                            <g:img class="featurette-image featurette-left" dir="images" file="profileDatesChart.png" />
                        </div>
                    </div>
                </div>

                <div id="feature2" class="featurette margin-bottom">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                            <g:img class="featurette-image featurette-right" dir="images" file="followerInfo.png" />
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <h2 class="featurette-heading">More info on your followers <span class="muted">than you have ever seen. </span></h2>
                            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                        </div>
                    </div>
                </div>

                <div id="feature3" class="featurette">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <h2 class="featurette-heading">Your followers links <span class="muted">crawled and analysed. </span></h2>
                            <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
                            <g:img class="featurette-image featurette-left" dir="images" file="spider.png" />
                        </div>

                    </div>
                </div>

                <hr class="featurette-divider">

            </div>
        </section>

        <section class="multi-devices hidden-overflow">
            <div class="device-oveflow">
                <div class="container">
                    <h2 class="white main-title margin-bottom">Access your follower data from any device at any time.</h2>
                    <p class="lead text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in quam vulputate, pulvinar tortor ac, semper quam. Nunc iaculis ullamcorper nisi vitae bibendum. Vestibulum fermentum, massa non tempus scelerisque, ante lectus ultrices ipsum, id interdum sem odio et ligula</p>
                </div>
            </div>
            <div class="margin-bottom-lg">
                <div class="container text-center">
                    <div class="devices">
                        <g:img class="devices" alt="multi devices"  dir="images" file="device.png" />
                    </div>

                </div>
            </div>
        </section>

        <section class="final-cta" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="main-title text-center">Login to twitter intelligence for free right now</h2>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary btn-lg btn-hero login-btn">Login With Twitter</button>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div> <!-- End of main content-->


</div> <!--End of page content-->


</body>

<g:javascript>
    <g:javascript>

        (function() {
            init();
        })();

    </g:javascript>
</g:javascript>
</html>
