library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)

source('./scripts/getData.R')

shinyServer(function(input, output) {
  
  #Input twitter handles
  output$users <- reactive({
    as.list(strsplit(input$users, ", ")[[1]])
  })
  
  #Initial Auth################################################################
  
  t_api_key <- "RIXgPEn59oOUm2qn5WBQX2sW1"
  t_api_secret <- "70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN"
  t_access_token <- "4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq"
  t_access_token_secret <- "S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr"
  
  setup_twitter_oauth(t_api_key,
                      t_api_secret,
                      t_access_token,
                      t_access_token_secret)
  
  ams_base <- "http://api-v2.applymagicsauce.com/"
  ams_customer_id <- '2557'
  ams_api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
  
  ams_auth_req <- POST(paste0(ams_base, "auth"), 
                       add_headers("Content-Type"="application/json"), 
                       body = '{"customer_id": 2557, 
                       "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
  if (ams_auth_req$status_code != 200) {
    print("Bad key/id")
  }
  token <- content(ams_auth_req)$token
})