package org.hmaissi.twitterIntelligence.main

import grails.converters.JSON
import org.hmaissi.twitterIntelligence.auth.TwitterUser
import org.hmaissi.twitterIntelligence.twitterEnities.Follower
import org.hmaissi.twitterIntelligence.twitterEnities.Tweet

/**
 *
 */
class MainScreenController {

    def springSecurityService
    def twitterDownloadService
    def analyseDataService

    def index() {
        def user = TwitterUser.get(springSecurityService.principal.id)

        render(view: "main", model: [user:user])
    }

    /**
     * Expects an ajax call for all the follower and tweet data on a users account
     * @return JSON feed of data
     */
    def retrieveData() {
        TwitterUser user = TwitterUser.get(springSecurityService.principal.id)

        //check user is logged in
        if (user) {

            //check if this if the first time user has logged in
            if (!user.initialDataLoaded) {
                twitterDownloadService.beginDownload(user)
            }

            def followers = Follower.findAllByOwner(user)
            def tweets = Tweet.findAllByUser(user)

            render analyseDataService.beginAnalysis(followers, tweets, user) as JSON




        } else {
            render "<h2>You are not logged in!</h2>"
        }
    }
}
