#source('./getData.r')
library(knitr)

getJungian <- function(t_handle){
  
  interpretations <- GetIntDF(GetData(t_handle))
  
  personality <- as.character(interpretations[1, "value"]) 
  personality_split <- strsplit(personality, "")[[1]]
  if(identical(personality_split[1], "I")){ 
    personality_1 <- "Introverted"
  } else {
    personality_1 <- "Extroverted"
  }
  if(identical(personality_split[2], "N")){
    personality_2 <- "Intuitive"
  } else {
    personality_2 <- "Sensible"
  }
  if(identical(personality_split[3], "T")){
    personality_3  <- "Thinker"
  } else {
    personality_3 <- "Feeler"
  }
  if(identical(personality_split[4], "J")){
    personality_4 <- "Judger"
  } else {
    personality_4 <- "Perceptive"
  }
  
  Type <- c("Deductive", "Inductive")
  Subjective <- c(personality_2, personality_3)
  Objective <- c(personality_1, personality_4)
  
  df <- data.frame(Type, Subjective, Objective)
  
  rownames(df) <- df[,1]
  df[,1] <- NULL
  
  return(kable(df))
}