//if (typeof jQuery !== 'undefined') {
//	(function($) {
//		$('#spinner').ajaxStart(function() {
//			$(this).fadeIn();
//		}).ajaxStop(function() {
//			$(this).fadeOut();
//		});
//	})(jQuery);
//}

/**
* On page load
*/
function init() {
    console.log("called init...")
    var $twitterAuth = $('#twitterAuthBtn');

    $twitterAuth.click(function() {
        console.log("logging in ...")
        login();
    });
}

function login() {
    //https://oauth.io Simple oauth
    OAuth.initialize('tI9harWd9q7s-G6wu_ZV7Fddl2U');
    OAuth.popup('twitter', function(error, result) {

        //TODO implement error condition
        console.log(error)
        console.log("redirecting user...")
        //redirect user to main screen after logging in
        window.location = 'auth/loginTwitterUser' + '?token=' + result.oauth_token +
            '&tokenSecret=' + result.oauth_token_secret;

    });
}

/**
 * Ajax request for data
 */
function loadData() {
    $.getJSON('../mainScreen/retrieveData', function(data) {

        console.log("received response: ");
        console.log(data);

        loadOverview(data.averages);
        loadFollowerData(data.followerData);
        loadTopDomains(data.topDomains);
        loadMostUsedWords(data.commonWords);

        //remove loading gif and show sections
        finishedLoading();

        //Add fixed header to tables
        setUpFixedHeader();
    });
}


/**
 * Appends the overview data to DOM
 * @param data
 */
function loadOverview(data) {
    console.log("loadOverview -----");
    console.log(data);

    var $averagesDiv = $('#averagesData');

    $averagesDiv.append(
        '<h3>Average Number Of Followers Per Follower: ' + '<strong>' + data.averageNumberFollowers + '</strong>' + '</h3>' +
            '<h3>Average Number Of Tweets Per Follower: ' + '<strong>' + data.averageNumberStauses + '</strong>' + '</h3>' +
            '<h3>Average Number Of Favourites Per Follower: ' + '<strong>' + data.averageNumberFavourites + '</strong>' + '</h3>'
    );
}

/**
 *
 * @param data
 */
function loadFollowerData(data) {
    var $followers = $('#followersTableBody');

    //loop over each follower
    $.each(data, function(name, value) {
        var $tableRow = $('<tr />');

        //loop over each followers data
        $.each(value, function(k, v) {

            //display profile as an img not text
            if(k == 'profilePic') {
                $('<td />').append($('<img />', {
                    src: v,
                    class: 'profilePic',
                    alt: 'profile pic'
                })).appendTo($tableRow);
            } else {
                $('<td />', {
                    text: v
                }).appendTo($tableRow);
            }

        });

        $followers.append($tableRow);
    });
}

/**
 * Appends the top domain data to table
 * @param data
 */
function loadTopDomains(data) {
    var $topDomainTable = $('#topDomainsTable');

    $.each(data, function(name, value) {
        $topDomainTable.append(
            '<tr><td>' + name + '</td>' +
                '<td>' + value + '</td></tr>'
        );
    });
}


/**
 * Append most used words data to dom and setup word cloud
 * @param data
 */
function loadMostUsedWords(data) {
    var $commonWords = $('#commonWords');
    var wordData = [];

    $.each(data, function(word, value) {

        var number = 1 + Math.floor(Math.random() * 30)

        wordData.push(
            {
                text: value,
                weight: number
            }
        )
    });

    setUpWordCloud($commonWords, wordData);
}

/**
 * Init JQCloud plugin https://github.com/lucaong/jQCloud
 * @param container
 */
function setUpWordCloud(container, data) {
    var $container = container;

    $container.css('height', '500px')
        .css('width', '500px')
        .css('margin', 'auto');

    $container.jQCloud( data );

}

function finishedLoading() {
    var $sections = $('section'),
        $loading = $('.loading');

    $loading.each(function(i, obj) {
        $(obj).addClass('hide');
    });

    $sections.each(function(i, obj) {
        $(obj).removeClass('hide');
    });
}

/**
 * Fixed header hack
 */
function setUpFixedHeader() {
//    var $FollowerTableHack = $('table#tableHack'),
//        $followerTableHeader = $('thead#followerTableHeader'),
//        $followerTable = $('table#followersTable');
//
//    $FollowerTableHack.append($followerTableHeader.clone());
//
//
//    $followerTable.find('tbody')
//        .first()
//        .clone()
//        .appendTo($('<tbody />'))
//        .appendTo($FollowerTableHack)
//
//
//    $followerTableHeader.addClass('hide');

}

