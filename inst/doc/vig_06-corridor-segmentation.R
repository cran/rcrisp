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

if (any(is.null(bucharest_osm), is.null(bucharest_dem))) {
  cat("NOTE: Example data was not found; ",
      "subsequent code chunks will be skipped.\n", sep = "")
  knitr::opts_chunk$set(eval = FALSE)
}

## ----srr-tags, eval=FALSE, echo=FALSE-----------------------------------------
# #' @srrstats {G2.10} This vignette uses `sf::st_geometry()` to extract the
# #'   geometry column from the `sf` objects `bucharest_osm$river_centerline` and
# #'   `streets`. This is used when only geometry information is needed from that
# #'   point onwards and all other attributes (i.e., columns) can be safely
# #'   discarded. The object returned by `sf::st_geometry()` is a simple feature
# #'   geometry list column of class `sfc`.
# #' @srrstats {SP2.2a} This vignette demonstrates the compatibility of `rcrisp`
# #'   routines with `sf` workflows.

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

