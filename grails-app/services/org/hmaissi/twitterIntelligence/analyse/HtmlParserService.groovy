package org.hmaissi.twitterIntelligence.analyse

import org.hmaissi.twitterIntelligence.webCrawler.CrawledUrl
import org.jsoup.Jsoup
import org.jsoup.nodes.Document

class HtmlParserService {

    def List<CrawledUrl> parseHtmlResponses(htmlList) {

        for(def htmlPage: htmlList) {

            Document doc = Jsoup.parse(htmlPage);
        }


    }
}
