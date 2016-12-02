library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
install_github("geoffjentry/twitteR")
library(twitteR)

app_id <- "1850413891841129"

#AMS auth
customer_id <- '2557'
api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
need_new <- 1

ams_base <- "http://api-v2.applymagicsauce.com/"
if (need_new > 0)  {
  ams_auth_req <- POST(paste0(ams_base, "auth"), 
                       add_headers("Content-Type"="application/json"), 
                       body = '{"customer_id": 2557, 
                                "api_key": "hb2r82i8saloj1ectsfsi5omlq"}'
                       )
              
  if (ams_auth_req$status_code != 200) {
    print("Bad key/id")
  } else {
    ams_auth_resp <- content(ams_auth_req)
  }
}

token <- ams_auth_resp$token

ams_req <- POST(paste0(ams_base, "text?", "source=TWEET"),
                add_headers("X-Auth-Token"=token,
                            "Content-type"="application/json"),
                body='ISIS is taking credit for the terrible stabbing attack 
                at Ohio State University by a Somali refugee who should 
                not have been in our country.')
ams_resp <- content(ams_req)

#twitter api key: RIXgPEn59oOUm2qn5WBQX2sW1
#twitter api secret: 70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN
#twitter acces token: 	4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq
#twitter access secret: S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr

twitter_auth_req <- POST('https://api.twitter.com/oauth2/token',
                         )
