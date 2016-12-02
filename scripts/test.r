library(jsonlite)
library(dplyr)

library(shiny)
library(dplyr)
library(httr)


library(devtools)
install_github("geoffjentry/twitteR")
library(twitteR)




#AMS auth
customer_id <- '2557'
api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
need_new <- 0

base <- "http://api-v2.applymagicsauce.com/"
if (need_new > 0)  {
  r <- POST(paste0(base, "auth"), 
            add_headers("Content-Type"="application/json"), 
            body = '{"customer_id": 2557, 
            "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
  
  if (r$status_code != 200) {
    print("Bad key/id")
  } else {
    auth_response <- content(r)
  }
  }

token <- auth_response$token

ams_req <- POST(paste0(base, "text?", "source=TWEET", "&interpretations=true"),
                add_headers("X-Auth-Token"=token,
                            "Content-type"="application/json"),
                body='ISIS is taking credit for the terrible stabbing attack 
                at Ohio State University by a Somali refugee who should 
                not have been in our country.')
ams_resp <- content(ams_req)


api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
