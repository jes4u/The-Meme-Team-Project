library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)
  
  #Sends POST request to AMS
  #Handles token regenation
  #Takes auth token and concatenated tweets for a user as parameters
  RequestAMS <- function(token='uuj6skmeji1km2ecodfv0nsptf', tweets) {
    request <- POST(paste0("http://api-v2.applymagicsauce.com/", 
                           "text?", 
                           "source=TWEET", 
                           "&interpretations=true"),
                    add_headers("X-Auth-Token"=token,
                                "Content-type"="application/json"),
                    body=tweets)
    print(request$status_code)
    if (request$status_code != 200) {
      ###Redundant, find more elegant solution###
      ams_auth_req <- POST("http://api-v2.applymagicsauce.com/auth/", 
                           add_headers("Content-Type"="application/json"), 
                           body = '{"customer_id": 2598, 
                                    "api_key": "pj3uu3gsj64p4vc7pa8q8t2vgk"}')
      token <- httr::content(ams_auth_req)$token
      request <- RequestAMS(token, tweets)
    }
    return(request)
  }
  
  #Get data for a user
  GetData <- function(user, token) {
    tweets <- GetTweets(user)
    print(GetTweets(user))
    resp <- RequestAMS(token, tweets)
    print(resp)
    return(resp)
  }
  
  #Get the raw predictions df
  GetPredDF <- function(data) {
    return(as.data.frame(httr::content(data)$predictions))
  }
  
  #Get the raw interpretations df
  GetIntDF <- function(data) {
    return(as.data.frame(httr::content(data)$interpretations))
  } 
  
  #Get Tweets by twitter handle
  GetTweets <- function(t_handle) {
    t_user <- getUser(t_handle)
    timeline <- userTimeline(t_user)
    tweets <- c()
    if (length(timeline) > 0) {
      for (i in seq(length(timeline))) {
        tweets <- c(tweets, timeline[[i]]$text)
      }
    }
    return(toString(tweets))
  }
  
  

