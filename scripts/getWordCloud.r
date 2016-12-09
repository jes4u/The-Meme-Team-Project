#source('./getData.r')

library(wordcloud)
library(randomcoloR)
library(RColorBrewer)
library(tm)

getWordMap <- function(user) {
  shorten_tweet <- substr(GetTweets(user), start = 0, stop = 10000)
  cloud <- wordcloud(words=shorten_tweet, 
                     scale=c(4,.5), 
                     min.freq = 2, 
                     max.words = Inf, 
                     random.order=FALSE, 
                     rot.per=0.35, 
                     use.r.layout=FALSE, 
                     colors=randomColor()
                     )
  return(cloud)

}

