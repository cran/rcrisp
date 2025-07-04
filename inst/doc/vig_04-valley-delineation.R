## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

## ----setup--------------------------------------------------------------------
# Attach required packages
library(rcrisp)
library(sf)

bucharest_osm <- get_osm_example_data()
bucharest_dem <- get_dem_example_data()

# Load data for valley delineation
dem <- bucharest_dem
river_centerline <- st_geometry(bucharest_osm$river_centerline)
river_surface <- st_geometry(bucharest_osm$river_surface)
river <- c(river_centerline, river_surface)

## -----------------------------------------------------------------------------
terra::plot(dem)
plot(river, col = "white", border = NA, add = TRUE)

## -----------------------------------------------------------------------------
valley <- delineate_valley(dem, river)

## -----------------------------------------------------------------------------
terra::plot(dem)
plot(valley, border = "white", add = TRUE)

