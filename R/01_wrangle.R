wrangle_initiatives <- function(initiatives) {
  
  # targets::tar_load(initiatives)
  initiatives$longitude <- as.numeric(initiatives$longitude)
  initiatives$latitude  <- as.numeric(initiatives$latitude)
  initiatives$date      <- as.Date(initiatives$date, format = "%d/%m/%y")
  initiatives$statut    <- NA
  initiatives$statut[Sys.Date() > initiatives$date] <- "Terminé"
  initiatives$statut[Sys.Date() < initiatives$date] <- "À venir"
  initiatives$date <- format.Date(initiatives$date, format = "%d/%m/%y")
  initiatives$type <- as.factor(initiatives$type)
  
  initiatives$image <- NA
  initiatives$image[initiatives$type == "Lutte Espèces Exotiques Envahissantes"] <- "images/EEE.png"
  initiatives$image[initiatives$type == "Suivis scientifiques"] <- "images/loupe.png"
  initiatives$image[initiatives$type == "Ramassage de déchets"] <- "images/dechets.jpg"
  initiatives$image[initiatives$type == "Rivière"] <- "images/riviere.jpg"
  initiatives$image[initiatives$type == "Sensibilisation"] <- "images/sensibilisation.jpg"
  initiatives$image[initiatives$type == "Déblaiement de sentier"] <- "images/deblaiement.jpg"
  
  return(initiatives)
  
}