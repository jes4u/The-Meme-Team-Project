source('./scripts/getData.r')

library(dplyr)
library(wordcloud)
library(randomcoloR)
library(RColorBrewer)
library(tm)

getWordMap <- function(tweets) {
  short_tweet <- substr(tweets, start = 0, stop = 1000)
  cloud <- wordcloud(short_tweet, 
                     scale=c(4,.5), 
                     max.words = 30, 
                     random.order=FALSE, 
                     rot.per=0.35, 
                     use.r.layout=FALSE, 
                     random.color = TRUE, 
                     colors=randomColor())
  return(cloud)

}
getWordMap(GetTweets('@RealDonaldTrump'))