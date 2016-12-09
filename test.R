library(dplyr)
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

source('./scripts/dm.R')
source('./scripts/getData.r')
source('./scripts/getWordCloud.r')

# ams_customer_id <- '2557'
# ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'

ams_customer_id <- '2598'
ams_api_key <- 'pj3uu3gsj64p4vc7pa8q8t2vgk'

#Initial Auth
ams_auth_req <- POST("http://api-v2.applymagicsauce.com/auth",
                     add_headers("Content-Type"="application/json"),
                     body = '{"customer_id": 2598,
                     "api_key": "pj3uu3gsj64p4vc7pa8q8t2vgk"}')
token <- httr::content(ams_auth_req)$token

users <- c('@RealDonaldTrump', '@samsturtevant')

print(GetData(users[1], token))

spider_data <- GetBig5DF(GetPredDF(GetData(users[1], 
                                           token)), 
                         GetPredDF(GetData(users[2],
                                           token)))
spiderChart(spider_data)
print(typeof(getJungian(users[1], token)))
#other_data1 <- GetOtherDF(GetPredDF(GetData(users[1])), GetIntDF(GetData(users[1])))
#other_data2 <- GetOtherDF(GetPredDF(GetData(users[2])), GetIntDF(GetData(users[2])))