package org.hmaissi.twitterIntelligence.download

import groovyx.net.http.ContentType
import groovyx.net.http.HTTPBuilder
import groovyx.net.http.HttpResponseException
import groovyx.net.http.Method
import org.hmaissi.twitterIntelligence.twitterEnities.Tweet
import org.hmaissi.twitterIntelligence.webCrawler.CrawledUrl

class WebCrawlerService {

    def htmlParserService

    /**
     * Sends links contained in tweets to web crawler.
     * Web crawler will download content from each link and save the information before returning here
     * @param tweets
     * @return
     */
    def crawlLinks(tweets) {

        def listOfUrlsToCrawl = []

        for(Tweet tweet : tweets) {
            def url = tweet.expandedUrlEntity

            if (url != null && url != "") {

                listOfUrlsToCrawl.add(url)
            }
        }

        def crawledUrls = getDomainFromUrl(listOfUrlsToCrawl)

        return crawledUrls

    }

    /**
     * Loops over a list of url and downloads html for each
     * Send html to html parser for saving
     * @param urls
     * @return
     */
    def List<CrawledUrl> getDomainFromUrl(List<String> urls) {

        def htmlResponses = []

        for(def url : urls) {
            try {

                def htmlResponse = getHtmlFromUrl(url)

                if (!(htmlResponse == "error")) {
                    htmlResponses.add(htmlResponse)
                }

            } catch (HttpResponseException e) {
                println "Caught httpResponseException: "
                println e.message
                continue

            } catch (ConnectException e) {
                println "Caught connectException: "
                println e.message
                continue

            } catch (SocketException e) {
                println "Caught SocketException: "
                println e.message
                continue

            }
        }

        return htmlParserService.parseHtmlResponses(htmlResponses)

    }

    /**
     * TODO headers + error checking
     * @param url
     * @return
     */
    private String getHtmlFromUrl(String url) throws HttpResponseException, ConnectException, SocketException {

        println("making http request---------------")

        try {
            def ret = null
            def http = new HTTPBuilder()

            // perform a GET request, expecting TEXT response
            http.request(url, Method.GET, ContentType.TEXT) {

                headers.'User-Agent' = 'Twitter Intelligence Web Crawler'
                uri.path = ''
                uri.query = [ v:'1.0', q: '' ]

                // response handler for a success response code
                response.success = { resp, reader ->
                    println "response status: ${resp.statusLine}"

                    ret = reader.getText()

                }

                response.failure = { resp, reader ->
                    println "response status: ${resp.statusLine}"
                    return "error"
                }
            }
            return ret

        } catch (HttpResponseException e) {

           println "Caught HttpResponseException in getHtmlFromUrl throwing...."
           throw new HttpResponseException()

        } catch (ConnectException e) {

           println "Caught ConnectException in getHtmlFromUrl throwing...."
           throw new ConnectException()

        } catch (SocketException e) {
            println "Caught SocketException in getHtmlFromUrl throwing...."
            throw new SocketException()
        }

    }
}
