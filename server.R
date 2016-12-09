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

source('./scripts/getData.r')
source('./scripts/dm.R')
source('./scripts/getJungian.r')
source('./scripts/getWordCloud.r')
source('./scripts/SpiderChart.R')
source('./scripts/getCompatability.r')

# Twitter Oauth (Calls once when you publish the app)#######################
    t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
    t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
    t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
    t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"
    
    setup_twitter_oauth(t_api_key,
                        t_api_secret,
                        t_access_token,
                        t_access_token_secret)
    token <- get("oauth_token", twitteR:::oauth_cache)
    token$cache()
# Twitter Oauth (Calls once when you publish the app)######################################################## 
    
    
  shinyServer(function(input, output) { #################################### Shiny Server ######################################
    
    #AMS Oauth (Only calls when a user opens the app)#######################
    ams_customer_id <- '2557'
    ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
    
    #Initial Auth
    ams_auth_req <- POST("http://api-v2.applymagicsauce.com/auth", 
                         add_headers("Content-Type"="application/json"), 
                         body = '{"customer_id": 2598, 
                                  "api_key": "pj3uu3gsj64p4vc7pa8q8t2vgk"}')
    token <- httr::content(ams_auth_req)$token
    token_test <- RequestAMS(token, GetTweets(input$t_handle_1))
    #AMS Oauth (Only calls when a user opens the app)#######################
    
    
    ############################################################# The word cloud tab
    output$text1_cloud <- renderText({
      return(input$t_handle_1)
    })
    

    #Continuously calls when in app ###############################
    output$word_cloud_text_1 <- renderText({
      return(input$t_handle_1)
    })

    output$word_cloud_1 <- renderPlot({
      return(getWordMap(input$t_handle_1))
    })

    output$word_cloud_text_2 <- renderText({
      return(input$t_handle_2)
    })
    
    output$word_cloud_2 <- renderPlot({
      return(getWordMap(input$t_handle_2)) 
    })
    
    output$word_cloud_text_3 <- renderText({
      return(paste(input$t_handle_1, "&", input$t_handle_2, sep=" "))
    })
    
    output$word_cloud_3 <- renderPlot({
      return(getWordMap(input$t_handle_1, input$t_handle_2)) 
    })
    ############################################################# The Big5 tab
    
    output$spider_chart <- renderPlot({
      
      return(spiderChart(as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1,
                                                                   token)),
                                                 GetPredDF(GetData(input$t_handle_2,
                                                                   token)))),

                         input$t_handle_1,
                         input$t_handle_2))
    })
    
    output$text1_big5 <- renderText({
      return(input$t_handle_1)
    })
    
     output$text2_big5 <- renderText({
      return(input$t_handle_2)
    })
     
    output$spider_data_1 <- renderTable({
      df <- as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1,
                                                       token)),
                                     GetPredDF(GetData(input$t_handle_2,
                                                       token))))[3,]
      return(df)
    })
    
    output$spider_data_2 <- renderTable({
      df <- as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1,
                                                      token)),
                                    GetPredDF(GetData(input$t_handle_2,
                                                      token))))[4,]
      return(df)
    })
    
    
    ############################################################# The compatability tab
    output$text1_jung <- renderText({
      return(input$t_handle_1)
    })
    
    output$abrev_1 <- renderText({
      return(getAbrevJung(input$t_handle_1, token))
    })
    
    output$abrev_2 <- renderText({
      return(getAbrevJung(input$t_handle_2, token))
    })
    
    output$text2_jung <- renderText({
      return(input$t_handle_2)
    })
    
    output$jungian_1 <- renderTable({
      df <- as.data.frame(getJungian(input$t_handle_1, token))
      return(df)
    })
    
    output$jungian_2 <- renderTable({
      df <- as.data.frame(getJungian(input$t_handle_2, token))
      return(df)
    })
    
    output$displayJungianTable <- renderTable({
      df <- as.data.frame(getJungian(getCompatabilityTable())) 
      return(df)
    })
    
    output$isCompatable <- renderText({
      compatability <- isCompatable(input$t_handle_1, input$t_handle_2, token)
      result <- paste0(input$t_handle_1, " and ", input$t_handle_2, "compatability result: ", compatability)
      return(result)
    })
    
    
    
    
  
    

     
    
  })  
