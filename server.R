library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)

shinyServer(function(input, output) {
  
  #Input twitter handles
  output$users <- reactive({
    as.list(strsplit(input$users, ", ")[[1]])
  })
  
  ##################################################################
  source('./scripts/getData.R')
  
  t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
  t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
  t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
  t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"
  
  setup_twitter_oauth(t_api_key,
                      t_api_secret,
                      t_access_token,
                      t_access_token_secret)
})