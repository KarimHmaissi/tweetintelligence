modules = {
    application {
        resource url: 'js/application.js'
        dependsOn('plugins')
    }

    css {
        resource url: 'css/main.css', disposition: 'head'
        dependsOn 'templateCss'
    }

    templateCss {

        resource url: 'css/bootstrap.min.css', disposition: 'head'
//        resource url: 'css/bootstrap-theme.min.css', disposition: 'head'
//        resource url: 'css/narrow.css', disposition: 'head'
    }

    oauth {
        resource url: 'js/oauth.min.js'
    }

    modernizr {
        resource url: 'js/modernizr-2.6.2.min.js', disposition: 'head'
    }

    plugins {
//        resource url: 'js/plugins.js'
        resource url: 'js/plugins/jqcloud/jqcloud.css'
        resource url: 'js/plugins/jqcloud/jqcloud-1.0.4.min.js'
        resource url: 'js/plugins/fixedheadertable.min.js'
        resource url: 'js/plugins/waypoints.min.js'
//

    }

    flot {

        resource url: 'js/plugins/flot/jquery.flot.js'
        resource url: 'js/plugins/flot/jquery.flot.time.js'
        resource url: 'js/plugins/flot/date.js'
    }

    bootstrap {
        resource url: 'js/bootstrap.min.js'
    }


}