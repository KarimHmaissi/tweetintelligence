package org.hmaissi.twitterIntelligence.analyse

import org.hmaissi.twitterIntelligence.twitterEnities.Follower
import org.hmaissi.twitterIntelligence.twitterEnities.Tweet

class AnalyseDataService {

    def beginAnalysis(followers, tweets) {

        def result = [
                averages: findFollowerAverages(followers),
                listOfSites: getListOfSites(tweets),
                commonWords: findMostCommonWordInTweets(tweets),
                topDomains: getTopDomains(tweets),
                followerData: getFollowerData(followers)
        ]

        return result
    }

    /**
     * Returns averages from a list of followers such average
     * follower count or average number of status updates
     * @param followers
     * @return
     */
    def findFollowerAverages(followers) {

        def followerCountList = []
        def statusCountList =  []
        def favouritesCountList = []
        def averagesMap = [:]

        for(Follower follower : followers) {
            followerCountList.add(follower.followersCount)
            statusCountList.add(follower.statusCount)
            favouritesCountList.add(follower.favouritesCount)
        }

        averagesMap = [
                averageNumberFollowers :  Math.round(followerCountList.sum() / followers.size()),
                averageNumberStauses:  Math.round(statusCountList.sum() / followers.size()),
                averageNumberFavourites: Math.round(favouritesCountList.sum() / followers.size())
        ]

        return averagesMap
    }

    /**
     * Returns a list of expanded urls from tweets
     * @param followers
     * @param tweets
     * @return
     */
    def getListOfSites(tweets) {
        def sitesList = []
        for(Tweet tweet: tweets) {
            sitesList.add(tweet.expandedUrlEntity)
        }

        return sitesList
    }

    private getListOfFollowers(followers) {

    }

    /**
     * Returns a list of the 50 most used words in tweets from most used to least used.
     * @param tweets
     * @return Map
     */
    def findMostCommonWordInTweets(tweets) {

        String allTweetText = ""

        for(Tweet tweet: tweets) {
            allTweetText += tweet.tweetText
        }

        allTweetText = allTweetText.toLowerCase()

        //replace punctuation
        allTweetText = allTweetText.replaceAll("\\p{Punct}+", "")

        def wordArray = allTweetText.split(" ")

        def wordMap = [:]

        //Loop over array of words. Increase count in map as each word is found
        for(def x = 0; x < wordArray.length; x++) {
            String word = wordArray[x]
            if (!(word.length() <= 3)) {
                if (wordMap.containsKey(wordArray[x])) {
                    def newCount = wordMap.get(wordArray[x]) + 1
                    wordMap.put(wordArray[x], newCount)
                } else {
                    wordMap.put(wordArray[x], 1)
                }
            }
        }

        wordMap = wordMap.sort { -it.value }

        def wordList = wordMap.keySet()

        wordList = wordList.toList()

        if (wordList.size() > 50) {
            wordList = wordList.subList(0,50)
        }

        return wordList
    }

    /**
     *
     * @param follower
     */
    def getFollowerData(followers) {
        def followersData = []

        for(Follower follower : followers) {
            def followerData = [
                    profilePic :  follower.largeProfileImageUrl,
                    name : follower.name,
                    profileCreationDate : follower.profileCreatedDate,
                    followerCount : follower.followersCount,
                    favouritesCount : follower.favouritesCount,
                    statusCount : follower.statusCount,
            ]

            followersData.add(followerData)
        }

        return followersData
    }

    /**
     * Returns a map of domains with a value counter of each occurrence in a tweet
     * @param tweets
     * @return Map
     */
    def getTopDomains(tweets) {

        def domainMap = [:]

        for(Tweet tweet : tweets) {
            def domain = getDomainName(tweet.expandedUrlEntity)
                if (domainMap.containsKey(domain)) {
                    domainMap.put(domain, domainMap.get(domain) + 1)
                } else {
                    domainMap.put(domain, 1)
                }


        }

        domainMap = domainMap.sort { -it.value }

        return domainMap
    }

    /**
     * Uses Java java.net.URI to parse domains from urls
     * @param url
     * @return
     */
    private getDomainName(url) {
        try {
            if (url) {
                URI uri = new URI(url);
                String domain = uri.getHost();
                return domain.startsWith("www.") ? domain.substring(4) : domain;
            }
        } catch (URISyntaxException) {
            print "error: " + url
            return "Error parsing url."
        }
    }



}
