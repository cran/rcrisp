## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(rcrisp)
# 
# # Parameters
# city_name <- "Bucharest"
# river_name <- "Dâmbovița"
# epsg_code <- 32635
# 
# # Delineation
# bd <- delineate(city_name, river_name, segments = TRUE)
# 
# # Base layers for visualisation
# bb <- get_osm_bb(city_name)
# streets <- get_osm_streets(bb, epsg_code)$geometry
# railways <- get_osm_railways(bb, epsg_code)$geometry
# 
# # Plot
# plot(bd$corridor)
# plot(railways, col = "darkgrey", add = TRUE, lwd = 0.5)
# plot(streets, add = TRUE)
# plot(bd$segments, border = "orange", add = TRUE, lwd = 3)
# plot(bd$corridor, border = "red", add = TRUE, lwd = 3)

