package org.hmaissi.twitterIntelligence.download

import org.hmaissi.twitterIntelligence.auth.TwitterUser
import org.hmaissi.twitterIntelligence.twitterEnities.Follower
import org.hmaissi.twitterIntelligence.twitterEnities.Tweet
import twitter4j.Twitter
import twitter4j.TwitterException

/**
 * Handles all downloads from twitter
 * Also handles saving that data to the DB
 */
class TwitterDownloadService {

    def twitter4jService

    /**
     * Begin download of followers and tweets from twitter
     * @param loggedInUser  Currently logged in user
     */
    def beginDownload(TwitterUser loggedInUser) {

        Twitter twitter = twitter4jService.connect(loggedInUser.accessToken, loggedInUser.secretToken)

//        def tweetsResponse = twitter.getUserTimeline("KarimHmaissi")

        downloadFollowers(twitter, loggedInUser)
        downloadFollowersTweets(twitter, loggedInUser)

        loggedInUser.initialDataLoaded = true
        loggedInUser.save()
    }

    /**
     * Download followers and save to DB
     * @param twitter Instance of twitter4j
     * @param loggedInUser Currently logged in user
     */
    private downloadFollowers(twitter, loggedInUser) {

        //TODO limited implementation. Only downloads 100 followers

        def getFollowersIDsResponse = twitter.getFollowersIDs(-1)
        def idsArray = new long[99]

        //TODO check if number of followers returned is over 100
        System.arraycopy(getFollowersIDsResponse.ids,0,idsArray,0,99)

        //TODO add exception handling here - TwitterException
        def followers = twitter.lookupUsers(idsArray)

        for(def followerItem : followers) {

            try{
                Follower follower = new Follower();
                follower.profileCreatedDate = followerItem.getCreatedAt()
                follower.language = followerItem.getLang()
                follower.location = followerItem.getLocation()
                follower.screenName = followerItem.getScreenName()
                follower.favouritesCount = followerItem.getFavouritesCount()
                follower.followersCount = followerItem.getFollowersCount()
                follower.statusCount = followerItem.getStatusesCount()
                follower.friendsCount = followerItem.getFriendsCount()
                follower.followerId = followerItem.getId()
                follower.name = followerItem.getName()
                follower.timeZone = followerItem.getTimeZone()
                follower.miniProfileImageUrl = followerItem.getMiniProfileImageURL()
                follower.largeProfileImageUrl = followerItem.getBiggerProfileImageURL()
                follower.owner = loggedInUser
                follower.save(flush: true, failOnError: true)
            } catch (Exception e) {
                println "Error saving follower: " + e.message
                println "Error saving follower: " + e.toString()
            }
        }
    }

    /**
     * Downloads a sample of tweets for each follower and saves to DB
     * @param twitter twitter Instance of twitter4j
     * @param loggedInUser loggedInUser Currently logged in user
     */
    private downloadFollowersTweets(twitter, loggedInUser) {
        def followers = Follower.findAllByOwner(loggedInUser)

        //TODO limited implementation. Only download tweets for 100 followers and only downloads 20 tweets for each
        if (followers.size() > 99) {
            followers = followers.subList(0, 99)
        }

        for(def follower : followers) {
            println "About to download tweets for: " + follower.screenName

//            try {
//                def tweetsResponse = twitter.getUserTimeline(follower.screenName)
//            } catch(TwitterException e) {
//                println "Error downloading tweets?!: " + e.message
//            }
            def tweetsResponse = twitter.getUserTimeline(follower.screenName)

            for(def tweet: tweetsResponse) {

                try {
                    Tweet newTweet = new Tweet()
                    newTweet.dateStatusCreated = tweet.getCreatedAt()
                    newTweet.retweetCount = tweet.getRetweetCount()
                    newTweet.tweetId = tweet.getId()
                    newTweet.tweetText = tweet.getText()
                    newTweet.isRetweet = tweet.isRetweet()
                    newTweet.owner = follower
                    newTweet.user =  loggedInUser

                    def urlEntities = tweet.getURLEntities()
                    if (urlEntities != null) {
                        if (urlEntities.length > 0) {
                            newTweet.expandedUrlEntity = urlEntities[0].getExpandedURL()
                            newTweet.urlEntity = urlEntities[0].getURL()
                        }
                    }

                    newTweet.save(failOnError: true)

                } catch (Exception e) {
                    println "Error saving tweet: " + e.message
                    println "Error saving tweet: " + e.toString()
                }
            }

        }
    }

}
