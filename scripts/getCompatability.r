# Creates a compatability table, Link: https://www.pinterest.com/pin/50172983322221151/
getCompatabilityTable <- function(){
  Types <- c("INFP", "ENFP", "INFJ", "ENFJ", "INTJ", "ENTJ", "INTP", "ENTP", "ISFP", "ESFP", "ISTP", "ESTP", "ISFJ", "ESFJ", "ISTJ", "ESTJ")
  INFP <- c("Good", "Good", "Good", "Perfect", "Good", "Perfect", "Good", "Good", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad")
  ENFP <- c("Good", "Good", "Perfect", "Good", "Perfect", "Good", "Good", "Good", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad")
  INFJ <- c("Good", "Perfect", "Good", "Good", "Good", "Good", "Good", "Perfect", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad")
  ENFJ <- c("Perfect", "Good", "Good", "Good", "Good", "Good", "Good", "Good", "Perfect", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad", "Bad")
  INTJ <- c("Good", "Prefect", "Good", "Good", "Good", "Good", "Good", "Perfect", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible")
  ENTJ <- c("Perfect", "Good", "Good", "Good", "Good", "Good", "Perfect", "Good", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "One-Sided")
  INTP <- c("Good", "Good", "Good", "Good", "Good", "Perfect", "Good", "Good", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Perfect")
  ENTP <- c("Good", "Good", "Perfect", "Good", "Perfect", "Good", "Good", "Good", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible")
  ISFP <- c("Bad", "Bad", "Bad", "Perfect", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible", "One-Sided", "Perfect", "One-Sided", "Perfect")
  ESFP <- c("Bad", "Bad", "Bad", "Bad", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible", "Perfect", "One-Sided", "Perfect", "One-Sided")
  ISTP <- c("Bad", "Bad", "Bad", "Perfect", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible", "One-Sided", "Perfect", "One-Sided", "Perfect")
  ESTP <- c("Bad", "Bad", "Bad", "Bad", "One-Sided", "One-Sided", "One-Sided", "One-Sided", "Possible", "Possible", "Possible", "Possible", "Perfect", "One-Sided", "Perfect", "One-Sided")
  ISFJ <- c("Bad", "Bad", "Bad", "Bad", "Possible", "One-Sided", "Possible", "Possible", "One-Sided", "Perfect", "One-Sided", "Perfect", "Good", "Good", "Good", "Good")
  ESFJ <- c("Bad", "Bad", "Bad", "Bad", "Possible", "One-Sided", "Possible", "Possible", "Perfect", "One-Sided", "Perfect", "One-Sided", "Good", "Good", "Good", "Good")
  ISTJ <- c("Bad", "Bad", "Bad", "Bad", "Possible", "One-Sided", "Possible", "Possible", "One-Sided", "Perfect", "One-Sided", "Perfect", "Good", "Good", "Good", "Good")
  ESTJ <- c("Bad", "Bad", "Bad", "Bad", "Possible", "One-Sided", "Perfect", "Possible", "Perfect", "One-Sided", "Perfect", "One-Sided", "Good", "Good", "Good", "Good")
  
  df <- data.frame(Types, INFP, ENFP, INFJ, ENFJ, INTJ, ENTJ, INTP, ENTP, ISFP, ESFP, ISTP, ESTP, ISFJ, ESFJ, ISTJ, ESTJ)
  rownames(df) <- df[,1]
  df[,1] <- NULL
  
  return(df)
}

#Tests whether two twitter accounts are compatable
isCompatable <- function(t_handle1, t_handle2){
  person1 <- getAbrevJung(t_handle1)
  person2 <- getAbrevJung(t_handle2)
  df <- getCompatabilityTable()
  result <- as.character(df[person1, person2])
  return(result)
}