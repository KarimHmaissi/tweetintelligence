package org.hmaissi.twitterIntelligence.twitterEnities

import org.hmaissi.twitterIntelligence.auth.TwitterUser

class Tweet {

    Date dateStatusCreated
    Integer retweetCount
    Long tweetId
    String tweetText
    String expandedUrlEntity
    String urlEntity
    boolean isRetweet


    static belongsTo = [owner: Follower, user: TwitterUser]


    static constraints = {
        tweetId unique: true, blank: false
        expandedUrlEntity nullable: true
        urlEntity nullable: true
    }
}
