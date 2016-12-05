## setwed()
## source()
library(dplry)

dm <- function(ams_data_frame1) {
  max <- rep(1, length(1:5))
  min <- rep(0, length(1:5))
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
  data_table2 <- data.frame(matrix(seq(5),nrow = 1, ncol = 5))
  data_table2 <- rbind(data_table2, max, min, data_table[,2])
  colnames(data_table2) <- data_table[,1]
  data_table2 <- data_table2[-c(1),]
  rownames(data_table2)[1] <- "max"
  rownames(data_table2)[2] <- "min"
  rownames(data_table2)[3] <- "value"
  return(data_table2)
}


