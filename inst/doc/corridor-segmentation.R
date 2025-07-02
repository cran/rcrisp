## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warnings = FALSE
)

## ----setup--------------------------------------------------------------------
library(rcrisp)
library(sf)

bucharest_osm <- get_osm_example_data()
bucharest_dem <- get_dem_example_data()

## ----network, warning=FALSE---------------------------------------------------
# Add a buffer region around the corridor
corridor_buffer <- sf::st_buffer(bucharest_dambovita$corridor, 500)

# Filter the streets and railwayas to the buffer area
streets <- bucharest_osm$streets |>
  sf::st_filter(corridor_buffer, .predicate = sf::st_covered_by)
railways <- bucharest_osm$railways |>
  sf::st_filter(corridor_buffer, .predicate = sf::st_covered_by)

# Build combined street and railway network
network_filtered <- rbind(streets, railways) |>
  as_network()


## ----segmentation, warning=FALSE----------------------------------------------
segmented_corridor <-
  delineate_segments(bucharest_dambovita$corridor,
                     network_filtered,
                     st_geometry(bucharest_osm$river_centerline))
plot(st_geometry(streets))
plot(segmented_corridor, border = "orange", lwd = 3, add = TRUE)

