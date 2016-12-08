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
source('./scripts/getJungian.R')
source('./scripts/getWordCloud.R')
source('./scripts/SpiderChart.R')

# Twitter Oauth (Calls once when you publish the app)########################################################
    t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
    t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
    t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
    t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"
    
    # setup_twitter_oauth(t_api_key,
    #                     t_api_secret,
    #                     t_access_token,
    #                     t_access_token_secret)
# Twitter Oauth (Calls once when you publish the app)######################################################## 
    
    
# Shiny Server################################################################################ Shiny Server
  shinyServer(function(input, output) {
    
  
    #AMS Oauth (Only calls when a user opens the app)########################################################
    
    ams_customer_id <- '2557'
    ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
    
    #Initial Auth
    ams_auth_req <- POST("http://api-v2.applymagicsauce.com/auth", 
                         add_headers("Content-Type"="application/json"), 
                         body = '{"customer_id": 2557, 
                         "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
    token <- httr::content(ams_auth_req)$token
    #AMS Oauth (Only calls when a user opens the app)########################################################
    
    #Continuously calls when in app ###############################
    output$word_cloud_1 <- renderPlot({
      return(getWordMap(input$t_handle_1))
    })
    
    output$word_cloud_2 <- renderPlot({
      return(getWordMap(input$t_handle_2)) 
    })
    
    output$spider_chart <- renderPlot({
      return(spiderChart(as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_3)),
                                                 GetPredDF(GetData(input$t_handle_4)))),
                         input$t_handle_3,
                         input$t_handle_4))
    })
    
    
    #Continuously calls when in app ###############################
  })

# Shiny Server################################################################################ Shiny Server