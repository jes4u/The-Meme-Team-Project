source('./getData.r')

library(dplyr)
library(wordcloud)
library(randomcoloR)

getWordMap <- function(GetTweets) {
  shorten_tweet <- substr(GetTweets, start = 0, stop = 1000)
  cloud <- wordcloud(shorten_tweet, scale=c(4,.5), max.words = 30, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, random.color = TRUE, colors=randomColor())
  return(cloud)

}
