library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)

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
#SetupTwitterOauth()

#Get Tweets(list)
GetTweets <- function(t_handle) {
  t_user <- getUser(t_handle)
  timeline <- userTimeline(t_user, n=11)
  tweets <- c()
  for (i in seq(10)) {
    tweets <- c(tweets, timeline[[i]]$text)
  }
  return(toString(tweets))
}
tweets <- GetTweets('@realDonaldTrump')

#AMS
###############################################################################
ams_base <- "http://api-v2.applymagicsauce.com/"
ams_customer_id <- '2557'
ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
need_new <- FALSE

#Auth
GenerateAuthTokenAMS <- function(need_new) {
  if (need_new == TRUE)  {
    ams_auth_req <- POST(paste0(ams_base, "auth"), 
                         add_headers("Content-Type"="application/json"), 
                         body = '{"customer_id": 2557, 
                                  "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
    if (ams_auth_req$status_code != 200) {
      print("Bad key/id")
    } else {
      return(content(ams_auth_req)$token)
    }
  } else {}
    tryCatch(expr = return(content(ams_auth_req)$token),
             finally = return(GenerateAuthTokenAMS(TRUE))
  }
}
token <- GenerateAuthTokenAMS(need_new)

#Request
RequestAMS <- function(token) {
  request <- POST(paste0(ams_base, "text?", "source=TWEET"),
                  add_headers("X-Auth-Token"=token,
                              "Content-type"="application/json"),
                  body=tweets)
}
ams_req <- RequestAMS(token)
if (ams_req$status_code != 200) {
  need_new <- TRUE
  token <- GenerateAuthTokenAMS(need_new)
  ams_req <- RequestAMS(token)
}
ams_resp <- content(ams_req)

#Data
ams_data <- DataRequestAMS(token=token, tweets=tweets)