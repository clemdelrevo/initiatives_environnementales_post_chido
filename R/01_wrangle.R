wrangle_initiatives <- function(initiatives) {
  
  # targets::tar_load(initiatives)
  initiatives$longitude <- as.numeric(initiatives$longitude)
  initiatives$latitude  <- as.numeric(initiatives$latitude)
  colnames(initiatives) <- gsub("[.]", "_", tolower(colnames(initiatives)))
  initiatives$date_souhaité <- as.Date(initiatives$date_souhaité, format = "%d/%m/%Y")
  initiatives$statut    <- NA
  initiatives$statut[Sys.Date() > initiatives$date_souhaité] <- "Terminé"
  initiatives$statut[Sys.Date() <= initiatives$date_souhaité] <- "À venir"
  initiatives$date_souhaité <- format.Date(initiatives$date_souhaité, format = "%d/%m/%Y")
  initiatives$type <- as.factor(initiatives$type)
  
  initiatives$image <- NA
  initiatives$image[initiatives$type == "Lutte Espèces Exotiques Envahissantes"] <- "images/EEE.png"
  initiatives$image[initiatives$type == "Suivis scientifiques"] <- "images/loupe.png"
  initiatives$image[initiatives$type == "Ramassage de déchets"] <- "images/dechets.jpg"
  initiatives$image[initiatives$type == "Rivière"] <- "images/riviere.jpg"
  initiatives$image[initiatives$type == "Sensibilisation"] <- "images/sensibilisation.jpg"
  initiatives$image[initiatives$type == "Déblaiement de sentier"] <- "images/deblaiement.jpg"
  initiatives$image[initiatives$type == "Replantation"] <- "images/replantation.jpg"
  initiatives$image[initiatives$type == "Déblayage de végétation"] <- "images/deblaiement.jpg"
  
  init_sf <- sf::st_as_sf(initiatives, coords = c("longitude", "latitude"), crs = sf::st_crs(4326))
  init_sf <- sf::st_transform(init_sf, crs = sf::st_crs(4471))
  identiques    <- sf::st_equals(init_sf)
  identiques_sf <- init_sf[which(sapply(identiques, length) > 1), ]
  init_sf <- init_sf[which(sapply(identiques, length) == 1), ]
  identiques_sf <- sf::st_jitter(identiques_sf, amount = 50)
  init_sf <- rbind(init_sf, identiques_sf)
  init_sf <- sf::st_transform(init_sf, crs = sf::st_crs(4326))

  init_sf$longitude <- sf::st_coordinates(init_sf)[, "X"]
  init_sf$latitude  <- sf::st_coordinates(init_sf)[, "Y"]
  
  initiatives <- sf::st_drop_geometry(init_sf)
  
  return(initiatives)
  
}