<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <r:require modules="application,oauth,css,templateCss,plugins,modernizr" />
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

            <section id="overviewDataSection">
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
            </section>

            <section id="followerDataSection">
                <div class="row">
                    <div class="col-ld-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Follower Data</h3>
                            </div>
                            <div class="panel-body">
                                <div id="followers" class="table-responsive">
                                    <div class="overflow">
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
                        </div>
                    </div>
                </div>
            </section>

            <section id="topDomainsSection">
                <div class="row">
                    <div class="col-ld-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Most Linked To Domains In Tweets</h3>
                            </div>
                            <div class="panel-body overflow">
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
            </section>

            <div class="row">
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

</body>

<g:javascript>
    <g:javascript>

        (function() {
            loadData();
        })();

    </g:javascript>
</g:javascript>
</html>
