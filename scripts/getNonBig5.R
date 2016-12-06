## Needs predictions and interpretations df
## Will probably call dm later but calls getData atm
source('./getData.r')

gender <- as.character(predictions[1, "value.3"])
if(gender < 0.500){
  gender <- "Male"
} else {
  gender <- "Female"
}

age <- as.character(as.integer(predictions[1, "value.4"]))
num_spit <- strsplit(age, "")[[1]]

leadership <- as.double(interpretations[1, "value.1"]) 
if(leadership < 0.500){
  leadership <- "Follower"
} else {
  leadership <- "Leader"
}

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

lists <- c(age, gender, leadership, personality_1, personality_2, personality_3, personality_4)