#Created by Jesse:
library(jsonlite)
library(dplyr)
library(shiny)
library(httr)

app_id <- "1850413891841129"

#AMS auth
customer_id <- '2557'
api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
need_new <- 1

base <- "http://api-v2.applymagicsauce.com/"
if (need_new > 0)  {
  r <- POST(paste0(base, "auth"), 
            add_headers("Content-Type"="application/json"), 
            body = '{"customer_id": 2557, 
                    "api_key": "hb2r82i8saloj1ectsfsi5omlq"}')
  
            if (r$status_code != 200) {
              print("Bad key/id")
            } else {
              auth_response <- content(r)
            }
}

token <- auth_response$token

ams_req <- POST(paste0(base, "text?", "source=TWEET"),
                add_headers("X-Auth-Token"=token,
                            "Content-type"="application/json"),
                body='ISIS is taking credit for the terrible stabbing attack 
                      at Ohio State University by a Somali refugee who should 
                      not have been in our country.')
ams_resp <- content(ams_req)

