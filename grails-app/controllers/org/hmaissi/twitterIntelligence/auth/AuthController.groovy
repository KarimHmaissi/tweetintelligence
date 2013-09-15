package org.hmaissi.twitterIntelligence.auth

class AuthController {

    def twitter4jService
    def springSecurityService

    def loginTwitterUser() {
        if (!springSecurityService.isLoggedIn()) {

            def token = params.token,
                secretToken = params.tokenSecret

            if ((token != null || token != "") && (secretToken != null || secretToken != "")) {

                //Retrieve user details from twitter
                def twitterUser = twitter4jService.connect(token, secretToken).verifyCredentials()

                //check if user is already present in system. If not create new user
                def user = TwitterUser.findByUsername(twitterUser.screenName)

                if (user == null) {
                    TwitterUser newUser = new TwitterUser()
                    newUser.username = twitterUser.screenName
                    newUser.twitterId = twitterUser.id
                    newUser.password = twitterUser.id
                    newUser.accessToken = token
                    newUser.secretToken = secretToken
                    newUser.initialDataLoaded = false

                    try {
                        newUser.save(failOnError: true, flush: true)

                        //login new user
                        springSecurityService.reauthenticate newUser.username

                        //redirect to main screen
                        redirect(controller: "mainScreen", action: "index")
                    } catch(Exception e) {
                        render "Error logging in. Have you checked your twitter details? Please try again."
                    }

                } else {
                    //login user
                    springSecurityService.reauthenticate user.username

                    //redirect to main screen
                    redirect(controller: "mainScreen", action: "index")
                }
            }

        } else {

            //redirect to main screen
            redirect(controller: "mainScreen", action: "index")
        }
    }






 }
