<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
        <r:require modules="application,oauth,css,templateCss,plugins,modernizr, bootstrap" />
	</head>
	<body>



    <!--Header Section-->
    <div class="jumbotron">
        <div class="container">
            <h1>Twitter Intelligence</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <button class="btn btn-primary btn-lg" id="twitterAuthBtn" >Login into twitter &raquo;</button>
        </div>
    </div>
    <!--End Of Header Section-->


    <!--Social Strip-->
    <div class="socialStrip">
        <hr class="featurette-divider">
        <hr class="featurette-divider">
    </div>
    <!--End Social Strip-->


    <!--Main Content-->
    <div id="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2></h2>
                </div>
            </div>
        </div>
    </div>
    <!--End Of Main Content-->




        %{--<div>--}%

        %{--</div>--}%
        %{--<div id="testing">--}%

        %{--</div>--}%

    %{--<div id="controller-list" role="navigation">--}%
        %{--<h2>Available Controllers:</h2>--}%
        %{--<ul>--}%
            %{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">--}%
                %{--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>--}%
            %{--</g:each>--}%
        %{--</ul>--}%
    %{--</div>--}%
	</body>

<g:javascript>
    <g:javascript>

        (function() {
            init();
        })();

    </g:javascript>
</g:javascript>
</html>
