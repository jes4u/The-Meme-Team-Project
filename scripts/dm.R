## source()

library(dplyr)

#Creates big5 df for all predictions dfs passed in
Big5 <- function(pred1, 
                 pred2=NULL, 
                 pred3=NULL,
                 pred4=NULL) {
  df <- data.frame(matrix(nrow = 1, ncol = 5))
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  pred1 <- pred1 %>% select(-contains("3"), -contains("4"))
  data <- predictions1 %>% select(contains("value"))
  df[1,] <- data
  if (!is.null(pred2)) {
    pred2 <- pred2 %>% select(-contains("3"), -contains("4"))
    data <- predictions2 %>% select(contains("value"))
    df[2,] <- data
  }
  if (!is.null(pred3)) {
    pred3 <- pred3 %>% select(-contains("3"), -contains("4"))
    data <- predictions3 %>% select(contains("value"))
    df[3,] <- data
  }
  if (!is.null(pred4)) {
    pred4 <- pred4 %>% select(-contains("3"), -contains("4"))
    data <- predictions4 %>% select(contains("value"))
    df[4,] <- data
  }
  df <- rbind(rep(1, 5), rep(0, 5), df)
  return(df)
}
test <- Big5(predictions1, predictions2, predictions3, predictions4)
