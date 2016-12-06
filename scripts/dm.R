library(dplyr)

#Creates big5 df for a list of prediction dfs

GetBig5 <- function(df) {
  df <- data.frame(matrix(nrow = 1, ncol = 5))
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  df <- df %>% select(-contains("3"), -contains("4"))
  data <- df %>% select(contains("value")) %>% as.data.frame()
  df[1,] <- data
  return(df)
}
