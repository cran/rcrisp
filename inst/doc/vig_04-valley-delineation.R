## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE
)

## ----srr-tags, eval=FALSE, echo=FALSE-----------------------------------------
# #' @srrstats {G1.0} This vignette provides several literature references used
# #'   for the method of valley delineation.
# #' @srrstats {G1.3} Literature references are given for the Cost Distance
# #'   algorithm used for valley delineation.
# #' @srrstats {G2.10} This vignette uses `sf::st_geometry()` to extract the
# #'   geometry column from the `bucharest_osm$river_centerline` and
# #'   `bucharest_osm$river_surface`. This is used when only geometry information
# #'   is needed from that point onwards and all other attributes (i.e., columns)
# #'   can be safely discarded. The object returned by `sf::st_geometry()` is a
# #'   simple feature geometry list column of class `sfc`.
# #' @srrstats {SP2.2a} This vignette demonstrates the compatibility of `rcrisp`
# #'   routines with `terra` workflows.

## ----setup--------------------------------------------------------------------
# Attach required packages
library(rcrisp)
library(sf)

bucharest_osm <- get_osm_example_data()
bucharest_dem <- get_dem_example_data()

if (any(is.null(bucharest_osm), is.null(bucharest_dem))) {
  cat("NOTE: Example data was not found; ",
      "subsequent code chunks will be skipped.\n", sep = "")
  knitr::opts_chunk$set(eval = FALSE)
}

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

