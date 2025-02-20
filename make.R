# Project Structure ---

# dirs <- c("R", "data", "outputs", "analyses")
# lapply(dirs, dir.create, showWarnings = FALSE)

# renv ---

# renv::init()
# renv::install("usethis")
# renv::snapshot() ; renv::status()
# usethis::use_description(check_name = FALSE)

# Install deps with renv ---
# renv::install() ; renv::snapshot(prompt = FALSE); renv::status()

# Load functions ---
# devtools::load_all()

# Targets pipeline management ---

# dir.create("outputs/pipeline")
# file.create("analyses/pipeline.R", showWarnings = FALSE)
# targets::tar_config_set(
# store = "outputs/pipeline/",
# script = "analyses/pipeline.R"
# )

# targets::tar_visnetwork(targets_only = T)
targets::tar_make()
quarto::quarto_render("initiatives_environnementales_post_chido.qmd", output_file = "index.html")
fs::dir_copy(here::here("images"), here::here("docs", "images"), overwrite = TRUE)
