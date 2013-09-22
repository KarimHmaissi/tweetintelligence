<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <r:require modules="application,oauth,css,templateCss,plugins,modernizr,bootstrap,flot" />
</head>
<body>
<h1>Twitter Intelligence Main Screen</h1>

<sec:ifLoggedIn>
    You are logged in as ${user.username}
    <g:link controller="logout">sign out</g:link>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <button id="twitterAuthBtn" >Login into twitter</button>
</sec:ifNotLoggedIn>


<div id="resultsData" class="">

    <div class="loading text-center">
        <h3>Loading...</h3>
        <g:img dir="images" file="loading.gif" />
    </div>

    <section id="overviewDataSection" class="hide">
        <div class="container">
            <div class="row">
                <div class="col-ld-sd-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Overview</h3>
                        </div>
                        <div class="panel-body">
                            <div id="averagesData">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="profileCreationDateSection" class="hide">
        <div class="container">
            <div class="row">
                <div class="col-ld-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Followers Profile Creation Date</h3>
                        </div>
                        <div id="profileDate" class="panel-body">
                            <div id="profileDateChart" style="height:500px; width:500px;">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="commonWordsSection" class="hide">
        <div class="container">
            <div class="row" >
                <div class="col-ld-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Most Common Words Found In Tweets</h3>
                        </div>
                        <div id="commonWords" class="panel-body">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="dataTables" class="hide">
        <div class="container">
            <div class="row">
                <div class="col-ld-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Data Tables</h3>
                        </div>
                        <div class="panel-body">
                            <div>
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#followersTab" data-toggle="tab">Followers Data</a></li>
                                    <li><a href="#topDomainsTab" data-toggle="tab">Domain Data</a></li>
                                </ul>

                                <div id="my-tab-content" class="tab-content">

                                    <div class="tab-pane active" id="followersTab">
                                        <div id="followers" class="table-responsive">
                                            <div>
                                                <table class="table table-bordered" id="followersTable">
                                                    <thead id="followerTableHeader">
                                                    <tr>
                                                        <th>Profile Picture</th>
                                                        <th>Name</th>
                                                        <th>Profile Creation Date</th>
                                                        <th>Follower Count</th>
                                                        <th>Favourites Count</th>
                                                        <th>Status Count</th>
                                                    </tr>
                                                    </thead>

                                                    <tbody id="followersTableBody" class="table-hover">

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="topDomainsTab">
                                        <div id="topDomains" class="table-responsive">
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>Domain</th>
                                                    <th>Count</th>
                                                </tr>
                                                </thead>
                                                <tbody  id="topDomainsTable" class="table-hover">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>



</div>

</body>

<g:javascript>
    <g:javascript>

        (function() {
            loadData();
        })();

    </g:javascript>
</g:javascript>
</html>
