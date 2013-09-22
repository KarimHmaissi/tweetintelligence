<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <r:require modules="application,oauth,css,templateCss,plugins,modernizr, bootstrap" />
	</head>
	<body>

    <div class="page"> <!--Page Content-->

        <section class="hero hero-unit"> <!--Hero content-->
            <div class="hero-bg"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-5 col-xs-7">
                        <div class="main-message">
                            <h1 class="hero-heading margin-bottom-lg">Understand your twitter followers needs and interests </h1>
                            <p class="cta-tag">100% FREE. No Credit Card Needed</p>
                            <div class="margin-bottom">
                                <button class="btn btn-primary btn-lg btn-hero" id="twitterAuthBtn">Login With Twitter</button>
                                <button class="btn btn-success btn-lg btn-hero">Learn More</button>
                            </div>

                        </div>
                    </div>
                    <div class="pad-image"></div>
                </div>
            </div>
        </section> <!--End of hero content-->

        <div class="hero-strip margin-bottom-lg">
            <div class="container quotes">
                <p class="single-quote">"It was a revolution in our service and support culture."</p>
            </div>
        </div>

        <div class="main-content"> <!-- Main Content-->
            <section class="intro">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h2 class="main-title margin-bottom">What are your followers interested in?</h2>
                            <p class="lead text-center">Twitter Intelligence downloads data from your followers and mines this data for useful information. This allows you to better understand your following and adjust your social marketing strategy to meet their needs. </p>
                        </div>
                    </div>
                </div>

                <div class="container">

                    <div id="feature1" class="featurette">
                        <g:img class="featurette-image pull-right" dir="images" file="profileDatesChart.png" />
                        <h2 class="featurette-heading">First featurette headling. <span class="muted">It'll blow your mind.</span></h2>
                        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                    </div>

                    <div id="feature2" class="featurette">
                        <g:img class="featurette-image pull-left" dir="images" file="browser-icon-firefox.png" />
                        <h2 class="featurette-heading">Oh yeah, it's that good. <span class="muted">See for yourself.</span></h2>
                        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                    </div>

                    <div id="feature3" class="featurette">
                        <g:img class="featurette-image pull-right" dir="images" file="browser-icon-safari.png" />
                        <h2 class="featurette-heading">And lastly, this one. <span class="muted">Checkmate.</span></h2>
                        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                    </div>

                    <hr class="featurette-divider">

                </div>

                <!-- /END THE FEATURETTES -->
            </section>

            <section class="multi-devices">
                <div class="device-oveflow">
                    <div class="container">
                        <h2 class="white main-title margin-bottom">Access your follower data from any device at any time.</h2>
                        <p class="lead text-center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus in quam vulputate, pulvinar tortor ac, semper quam. Nunc iaculis ullamcorper nisi vitae bibendum. Vestibulum fermentum, massa non tempus scelerisque, ante lectus ultrices ipsum, id interdum sem odio et ligula</p>
                    </div>
                </div>
                <div style="height:400px;">
                    <div class="container text-center">
                        <div class="devices">
                            <g:img class="devices" alt="multi devices"  dir="images" file="device.png" />
                        </div>

                    </div>
                </div>
            </section>

            <section class="final-cta" style="height:400px;">

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
