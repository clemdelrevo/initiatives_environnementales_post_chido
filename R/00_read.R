
get_initiative_path <- function() {
  
  "data/initiatives.csv"
  
}

read_initiatives <- function(initiative_path) {
  
  read.csv("data/initiatives.csv")
  
}