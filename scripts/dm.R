library(dplyr)

#Creates big5 df for a prediction df

GetBig5DF <- function(pred_df) {
  df <- data.frame(matrix(nrow = 1, ncol = 5))
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  pred_df <- pred_df %>% select(-contains("3"), -contains("4"))
  data <- pred_df %>% select(contains("value"))
  df[1,] <- data
  return(df)
}

#Creates other df from interpretations df and 2 elements of predictions df

GetOtherDF <- function(pred_df, int_df) {
  df <- data.frame(matrix(nrow = 1, ncol = 4))
  colnames(df) <- c("Age",
                    "Female",
                    "Leadership",
                    "Jung_Type")
  pred_df <- pred_df %>% select(contains("value.3"), contains("value.4"))
  ###mutate int_df columns onto pred_df, df[1,] <- data###
}
