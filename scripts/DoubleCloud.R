#source('./getData.r')

library(wordcloud)
library(randomcoloR)
library(RColorBrewer)
library(tm)

getWordMap2 <- function(user1, user2) {
  shorten_tweet1 <- substr(GetTweets(user1), start = 0, stop = 10000)
  shorten_tweet2 <- substr(GetTweets(user2), start = 0, stop = 10000)
  both_tweets <- as.String(c(shorten_tweet1, shorten_tweet2))
  cloud <- wordcloud(words=both_tweets, 
                     scale=c(4,.5), 
                     min.freq = 1, 
                     max.words = Inf, 
                     random.order=FALSE, 
                     rot.per=0.35, 
                     use.r.layout=FALSE, 
                     colors=randomColor()
  )
  return(cloud)
  
}

