## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
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

## ----data---------------------------------------------------------------------
buildings <- bucharest_osm$buildings
river <- bucharest_osm$river_surface

## ----riverspace---------------------------------------------------------------
riverspace <- delineate_riverspace(river, buildings)

## ----plot-riverspace, fig.alt="Riverspace delineation"------------------------
riverspace_segment_2_4 <- riverspace |>
  st_intersection(bucharest_dambovita$segments[2:4])

buildings_segment_2_4 <- buildings |>
  st_sf() |>
  st_filter(bucharest_dambovita$segments[2:4], .predicate = st_intersects) |>
  st_filter(riverspace_segment_2_4, .predicate = st_intersects)

plot(riverspace_segment_2_4, col = "orange", border = NA)
plot(buildings_segment_2_4, add = TRUE)

