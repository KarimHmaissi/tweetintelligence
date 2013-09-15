package org.hmaissi.twitterIntelligence.twitterEnities

import org.hmaissi.twitterIntelligence.auth.TwitterUser

class Follower {

    Date profileCreatedDate
    String language
    String location
    String screenName
    Integer favouritesCount
    Integer followersCount
    Integer statusCount
    Integer friendsCount
    Long followerId
    String name
    String timeZone
    String miniProfileImageUrl
    String largeProfileImageUrl

    static belongsTo = [owner: TwitterUser]

    static constraints = {
        id unique: true, blank: false
        screenName unique: true, blank: false
        language nullable: true
        location nullable: true
        timeZone nullable: true
        miniProfileImageUrl nullable: true
        largeProfileImageUrl nullable: true
    }
}
