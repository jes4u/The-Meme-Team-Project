#source('./getData.r')
library(knitr)

#Separates each character of a twitter accounts Jugian value and puts it into a data frame
getJungian <- function(t_handle, token){
  
  personality <- getAbrevJung(t_handle, token)

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
  
  
  return(df)
}

# Creates a twitter users Jungian value
getAbrevJung <- function(t_handle, token){
  interpretations <- GetIntDF(GetData(t_handle, token))
  personality <- as.character(interpretations[1, "value"]) 
  
  return(personality)
}
