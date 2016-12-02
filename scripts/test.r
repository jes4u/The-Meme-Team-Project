library(jsonlite)
library(shiny)
library(dplyr)

# Auth. Key
app_id <- "1850413891841129"

#AMS auth
customer_id <- '2557'
api_key <- 'hb2r82i8saloj1ectsfsi5omlq'

base <- "http://api-v2.applymagicsauce.com/"
auth_req <- paste0(base, "auth")
auth_data <- POST(url=auth_req, 
                  body=list(
                    "customer_id"='2557',
                    "api_key"='hb2r82i8saloj1ectsfsi5omlq'
                  ),
                  encode="json",
                  content_type_json(),
                  accept_json()
)
