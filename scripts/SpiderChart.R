library(fmsb)
library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)
library(wordcloud)
library(randomcoloR)
library(RColorBrewer)
library(tm)
library(base64enc)
library(knitr)
library(plotly)

source('./scripts/getData.R')
source('./scripts/dm.R')

t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"

# setup_twitter_oauth(t_api_key,
#                     t_api_secret,
#                     t_access_token,
#                     t_access_token_secret)
  
  
  #AMS Oauth (Only calls when a user opens the app)########################################################
  
  ams_customer_id <- '2557'
  ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
  
  #Initial Auth
  ams_auth_req <- POST("http://api-v2.applymagicsauce.com/auth", 
                       add_headers("Content-Type"="application/json"), 
                       body = '{"customer_id": 2557, 
                       "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
  token <- httr::content(ams_auth_req)$token
  
spiderChart <- function(data) {
    
  colors_border <- c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9), rgb(0.7,0.5,0.1,0.9))
  colors_in <- c(rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4), rgb(0.7,0.5,0.1,0.4))
  spider <- radarchart(data, 
                       axistype=1, 
                       pcol=colors_border, 
                       pfcol=colors_in,
                       
                       cglcol="grey", 
                       axislabcol="grey", 
                       caxislabels=seq(0,1,0.2))
  person <- c("person1", "person2")
  bar <- legend(x=0.9, 
                y=1, 
                legend=person, 
                bty="n", 
                pch=20, 
                col=colors_in, 
                text.col = "grey",
                cex=1.2, 
                pt.cex=3)
  return(spider)
}

spiderChart(as.data.frame(GetBig5DF(GetPredDF(GetData('@RealDonaldTrump',
                                                      token)),
                                    GetPredDF(GetData('@BarackObama',
                                                      token)))))