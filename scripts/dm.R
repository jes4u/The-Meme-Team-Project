library(dplyr)

#Creates big5 df for a prediction df

GetBig5DF <- function(pred_df) {
  df <- data.frame(matrix(nrow = 1, ncol = 5))
  pred_df <- pred_df %>% select(-contains("3"), -contains("4"))
  data <- pred_df %>% select(contains("value"))
  df[1,] <- data
  df <- rbind(rep(1,5) , rep(0,5) , data)
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  return(df)
}


#Creates other df from interpretations df and 2 elements of predictions df

GetOtherDF <- function(pred_df, int_df) {
  df_1 <- data.frame(matrix(nrow = 3, ncol = 2))
  trait <- c("Female","Age","Jungian_Personality", "Leadership" )
  pred_df <- pred_df %>% select(contains("value.3"), contains("value.4")) %>%
    t()
  int_df <- int_df %>% select(contains("value"), contains("value.1")) %>%
    t()
  value <- rbind(pred_df, int_df)
  df_1 <- data.frame(trait, value)
  rownames(df_1) <- c(1:4)
  return(df_1)
}
