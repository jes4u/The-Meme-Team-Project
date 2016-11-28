#Created by Jesse:

library(jsonlite)
library(dplyr)
library(shiny)
library(dplyr)
library(Rfacebook)

# Auth. Key
app_id <- "1850413891841129"

fbOAuth(app_id, app_secret, extended_permissions = FALSE,
        legacy_permissions = FALSE)


