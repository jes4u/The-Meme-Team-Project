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
    
  shinyServer(function(input, output) {
    
    #Twitter OAuth#########################################################
    
    t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
    t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
    t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
    t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"
    
    setup_twitter_oauth(t_api_key,
                        t_api_secret,
                        t_access_token,
                        t_access_token_secret)
    t_token <- get("oauth_token", twitteR:::oauth_cache)
    t_token$cache()
    
    
    #Word cloud tab stuff###################################################
    output$text1_cloud <- renderText({
      return(input$t_handle_1)
    })
    
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
    
    #Big5 tab stuff#######################################################
    
    output$spider_chart <- renderPlot({
      
      return(spiderChart(as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1)),
                                                 GetPredDF(GetData(input$t_handle_2)))),

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
      return(as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1)),
                                     GetPredDF(GetData(input$t_handle_2))))[3,])
    })
    
    output$spider_data_2 <- renderTable({
      return(as.data.frame(GetBig5DF(GetPredDF(GetData(input$t_handle_1)),
                                     GetPredDF(GetData(input$t_handle_2))))[4,])
    })
    
    
    #Compatability tab stuff##################################################
    output$text1_jung <- renderText({
      return(input$t_handle_1)
    })
    
    output$abrev_1 <- renderText({
      return(getAbrevJung(input$t_handle_1))
    })
    
    output$abrev_2 <- renderText({
      return(getAbrevJung(input$t_handle_2))
    })
    
    output$text2_jung <- renderText({
      return(input$t_handle_2)
    })
    
    output$jungian_1 <- renderTable({
      df <- as.data.frame(getJungian(input$t_handle_1))
      return(df)
    })
    
    output$jungian_2 <- renderTable({
      df <- as.data.frame(getJungian(input$t_handle_2))
      return(df)
    })
    
    output$isCompatable <- renderText({
      compatability <- isCompatable(input$t_handle_1, input$t_handle_2)
      result <- paste0("Compatability result for", 
                       input$t_handle_1, 
                       "&", 
                       input$t_handle_2, 
                       ":", 
                       compatability,
                       sep=" ")
      return(result)
    })
    
  })  
