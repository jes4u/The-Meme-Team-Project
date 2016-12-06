library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)
#Twitter#######################################################################

#Get Tweets by twitter handle
GetTweets <- function(t_handle) {
  t_user <- getUser(t_handle)
  timeline <- userTimeline(t_user)
  tweets <- c()
  for (i in seq(length(timeline))) {
    tweets <- c(tweets, timeline[[i]]$text)
  }
  return(toString(tweets))
}

#AMS###########################################################################

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

#Sends POST request to AMS
#Handles token regenation
#Takes auth token and concatenated tweets for a user as parameters
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

#Get data for a user
GetData <- function(user) {
  tweets <- GetTweets(user)
  resp <- RequestAMS(token, tweets)
  return(content(resp))
}

#Get the shitty predictions df
GetPredDF <- function(data) {
  return(as.data.frame(data$predictions))
}

#Get the shitty interpretations df
GetIntDF <- function(data) {
  return(as.data.frame(data$interpretations))
}

