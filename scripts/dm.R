library(dplyr)

Big5 <- function(predictions, num_users) {
  df <- data.frame(matrix(nrow = num_users, ncol = 5))
  predictions <- predictions %>% select(-contains("3"), -contains("4"))
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  df <- rbind(rep(1, 5), rep(0, 5), df)
  data <- predictions %>% select(contains("value"))
  df[3,] <- data
  return(df)
}