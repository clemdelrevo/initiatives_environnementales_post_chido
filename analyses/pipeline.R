library(targets)
library(tarchetypes)

# targets options
tar_option_set(
  format = "qs",
)

# functions and options
tar_source()


# Pipeline
list(
  
   tar_target(initiative_path, get_initiative_path(), format = "file")
  ,tar_target(bversant_path, get_bversant_path(), format = "file") 
  ,tar_target(initiatives, read_initiatives(initiative_path))
  ,tar_target(winitiatives, wrangle_initiatives(initiatives))
  ,tar_target(bversant, read_bversant(bversant_path))
  
)