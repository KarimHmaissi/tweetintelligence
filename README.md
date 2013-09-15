#Twitter Intelligence

Twitter Intelligence downloads a twitter users followers and followers tweets in order to mine this data for customer intelligence. TI then parses and displays this data for the user.

This allows users of corporate twitter accounts to better understand their followers, and therefore target their social media marketing strategy to better target those followers. 

Noticeable information gained include:

1. The most linked to content in tweets.
2. Followers retweet ratio 
3. The most active followers
4. Most mentioned words and phrases in tweets

TI was developed using Grails, HTML5 boilerplate, Bootstrap and jQuery. 

---

##Limitations
1. As it stands users can only download information for 100 followers and 20 tweets per follower. After initial testing this number will be raised significantly. 
2. Many users will shorten URLs using services such as Bit.ly. Twitter will then shorten those URLs again. Therefore making it impossible to determine the actual URL without crawling the link manually or calling an external API. 
3. The algorithm used to analyse the most used words in tweets does not take into account common words. 
4. The analytical data is not cached on request. This will need to be corrected in order to scale the app.

##Future Features
1. Automatic crawling of links posted in tweets to identify the full URL even if shortened. As well as title as other semantic content related to a link such as page title and description. 
2. Connecting to a user's stream in order to add additional tweets made after the initial download to the database. 
3. Weighting content based on a followers likelihood of retweeting or favoriting statuses. 

 

