#source('./getData.r')

library(wordcloud)
library(randomcoloR)
library(RColorBrewer)
library(tm)

getWordMap <- function(user, user2=NULL) {
  if (is.null(user2)) {
    shorten_tweet <- substr(GetTweets(user), start = 0, stop = 10000)
  } else {
    shorten_tweet <- substr(GetTweets(user), start = 0, stop = 10000)
    shorten_tweet <- paste(shorten_tweet, 
                           substr(GetTweets(user2), start = 0, stop = 10000), 
                           sep=" ")
  }
  return(wordcloud(words=shorten_tweet, 
                     scale=c(1,5), 
                     min.freq = 2, 
                     random.order=FALSE, 
                     rot.per=0.4, 
                     ordered.colors=TRUE,
                     use.r.layout=FALSE, 
                     colors=randomColor())
  )
}

