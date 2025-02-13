
get_initiative_path <- function() {
  
  "data/initiatives.csv"
  
}

read_initiatives <- function(initiative_path) {
  
  read.csv(initiative_path)
  
}

get_bversant_path <- function() {
  
  "data/BASSIN_VERSANT_TOPOGRAPHIQUE.shp"
  
}

read_bversant <- function(bversant_path) {
  
  sf::read_sf(bversant_path)
  
}