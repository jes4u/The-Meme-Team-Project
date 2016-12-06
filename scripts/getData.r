library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)

#Input twitter handles
user1 <- '@realDonaldTrump'
user2 <- '@barrecan'
user3 <- '@BarackObama'
user4 <- '@TheEllenShow'

#Twitter
###############################################################################
t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"

SetupTwitterOauth <- function() {
  setup_twitter_oauth(t_api_key,
                      t_api_secret,
                      t_access_token,
                      t_access_token_secret)
}

###You need to uncomment this line of code the first time you run it, then recomment###
#SetupTwitterOauth()

#Get Tweets
GetTweets <- function(t_handle) {
  t_user <- getUser(t_handle)
  timeline <- userTimeline(t_user)
  tweets <- c()
  for (i in seq(length(timeline))) {
    tweets <- c(tweets, timeline[[i]]$text)
  }
  return(toString(tweets))
}
tweets1 <- GetTweets(user1)
tweets2 <- GetTweets(user2)
tweets3 <- GetTweets(user3)
tweets4 <- GetTweets(user4)

#AMS
###############################################################################
ams_base <- "http://api-v2.applymagicsauce.com/"
ams_customer_id <- '2557'
ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'

#Initial Auth
ams_auth_req <- POST(paste0(ams_base, "auth"), 
                     add_headers("Content-Type"="application/json"), 
                     body = '{"customer_id": 2557, 
                              "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
if (ams_auth_req$status_code != 200) {
  print("Bad key/id")
}
token <- content(ams_auth_req)$token

#Request
RequestAMS <- function(token='uuj6skmeji1km2ecodfv0nsptf', tweets) {
  request <- POST(paste0(ams_base, "text?", "source=TWEET", "&interpretations=true"),
                  add_headers("X-Auth-Token"=token,
                              "Content-type"="application/json"),
                  body=tweets)
  if (request$status_code == 403) {
    ###Redundant, find more elegant solution###
    ams_auth_req <- POST(paste0(ams_base, "auth"), 
                         add_headers("Content-Type"="application/json"), 
                         body = '{"customer_id": 2557, 
                                  "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
    if (ams_auth_req$status_code != 200) {
      return("Bad key/id")
    } else {
      token <- content(ams_auth_req)$token
      request <- RequestAMS(token, tweets)
    }
  }
  return(request)
}

#Response
ams_resp1 <- RequestAMS(token=token, tweets=tweets1)
ams_resp2 <- RequestAMS(token=token, tweets=tweets2)
ams_resp3 <- RequestAMS(token=token, tweets=tweets3)
ams_resp4 <- RequestAMS(token=token, tweets=tweets4)

#Data, sweet data.
ams_data1 <- content(ams_resp1)
ams_data2 <- content(ams_resp2)
ams_data3 <- content(ams_resp3)
ams_data4 <- content(ams_resp4)

#Poorly constructed data frames
##User1
predictions1 <- as.data.frame(ams_data1$predictions)
interpretations1 <- as.data.frame(ams_data1$interpretations)

##User2
predictions2 <- as.data.frame(ams_data2$predictions)
interpretations2 <- as.data.frame(ams_data2$interpretations)

##User3
predictions3 <- as.data.frame(ams_data3$predictions)
interpretations3 <- as.data.frame(ams_data3$interpretations)

##User 4
predictions4 <- as.data.frame(ams_data4$predictions)
interpretations4 <- as.data.frame(ams_data4$interpretations)