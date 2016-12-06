library(dplyr)

#Creates big5 df for a list of prediction dfs

GetBig5DF <- function(pred_df1, pred_df2) {
  df <- data.frame(matrix(nrow = 1, ncol = 5))
  pred_df1 <- pred_df1 %>% select(-contains("3"), -contains("4"))
  pred_df2 <- pred_df2 %>% select(-contains("3"), -contains("4"))
  data1 <- pred_df1 %>% select(contains("value"))
  data2 <- pred_df2 %>% select(contains("value"))
  #df[1,] <- data
  df <- rbind(rep(1,5) , rep(0,5) , data1, data2)
  colnames(df) <- c("Openness",
                    "Extraversion",
                    "Agreeableness",
                    "Neuroticism",
                    "Conscientiousness")
  return(df)
}


#Creates other df from interpretations df and 2 elements of predictions df

GetOtherDF <- function(pred_df, int_df) {
  df_1 <- data.frame(matrix(nrow = 0, ncol = 2))
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
