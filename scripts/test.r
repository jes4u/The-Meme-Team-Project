library(jsonlite)
library(dplyr)

library(shiny)
library(dplyr)
library(httr)
# Auth. Key
app_id <- "1850413891841129"

#AMS auth
customer_id <- '2557'
api_key <- 'hb2r82i8saloj1ectsfsi5omlq'
need_new <- 0

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

ams_req <- POST(paste0(base, "text?", "source=TWEET", "&interpretations=true"),
                add_headers("X-Auth-Token"=token,
                            "Content-type"="application/json"),
                body='ISIS is taking credit for the terrible stabbing attack 
                at Ohio State University by a Somali refugee who should 
                not have been in our country.')
ams_resp <- content(ams_req)

#twitter api key: RIXgPEn59oOUm2qn5WBQX2sW1
#twitter api secret: 70qPb7pp7mQCOjRPU3jP7kxhu4N91vavVupBvih08Bp3aHrkXN
#twitter acces token: 	4081108513-Lj3BaXetniCt09A1uvn4U5YFZGSM1JQHiyapjfq
#twitter access secret: S1YtKDOJIXDj2ARejfFv3tbx8OmBVFUHgStiCoLBdwOGr
