library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)


  
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
  
  

