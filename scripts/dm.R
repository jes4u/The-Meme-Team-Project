## setwed()
## source()
library(dplry)

dm <- function(ams_data_frame1) {
  colnames(ams_data_frame1)[7] <- "age"
  colnames(ams_data_frame1)[9] <- "gender"
  colnames(ams_data_frame1)[8] <- "age_num"
  colnames(ams_data_frame1)[10] <- "gender_prob"
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


