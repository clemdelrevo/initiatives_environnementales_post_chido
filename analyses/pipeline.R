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
  
   tar_target(initiatives, read_initiatives())
  ,tar_target(winitiatives, wrangle_initiatives(initiatives))
  
)