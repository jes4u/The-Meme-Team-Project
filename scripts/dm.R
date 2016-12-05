library(jsonlite)
library(dplyr)
library(shiny)
library(httr)
library(devtools)
library(twitteR)
source("~/desktop/Aut16/INFO 201/The-Meme-Team-Project/scripts/getData.r")
dm <- function(ams_data_frame1) {
  value <- select(ams_data_frame1, contains("value")) %>%
  t()
  rownames(value) <- c()
  colnames(value) <- c("value")
  
  traits <- select(ams_data_frame1, contains("trait")) %>%
    t() 
  rownames(traits) <- c()
  colnames(traits) <- c("trait")
  data_table <- cbind(traits, value)
  return(data_table)
}


