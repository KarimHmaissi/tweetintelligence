package org.hmaissi.twitterIntelligence.webCrawler

import org.hmaissi.twitterIntelligence.twitterEnities.Tweet

class CrawledUrl {

    String originalUrl
    String finalUrl
    String pageTitle
    Date dateCreated

    static belongsTo = [owningTweet: Tweet]

    static constraints = {
    }
}
