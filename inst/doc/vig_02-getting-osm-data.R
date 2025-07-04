## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE,
  message = FALSE,
  warning = FALSE
)

bucharest_osm <- rcrisp::get_osm_example_data()
bucharest_dem <- rcrisp::get_dem_example_data()

## ----setup, include = FALSE---------------------------------------------------
# library(rcrisp)
# library(purrr)
# 
# bucharest_osm <- get_osm_example_data()
# bucharest_dem <- get_dem_example_data()
# 
# city_boundary <- bucharest_osm$boundary
# river_surface <- bucharest_osm$river_surface
# river_centerline <- bucharest_osm$river_centerline
# railways <- bucharest_osm$railways
# streets <- bucharest_osm$streets

## -----------------------------------------------------------------------------
# city_name <- "Bucharest"
# river_name <- "Dâmbovița"
# crs <- 32635  # EPSG code for UTM zone 35N
# bbox_buffer <- 2000  # in m, expand bbox for street network

## -----------------------------------------------------------------------------
# bb <- get_osm_bb(city_name)

## -----------------------------------------------------------------------------
# city_boundary <- get_osm_city_boundary(city_name, bb, crs)
# river <- get_osm_river(river_name, bb, crs)
# streets <- get_osm_streets(bb, crs)
# railways <- get_osm_railways(bb, crs)

## -----------------------------------------------------------------------------
# bucharest_osm <- list(
#   bb = bb,
#   boundary = city_boundary,
#   river_centerline = river$centerline,
#   river_surface = river$surface,
#   streets = streets,
#   railways = railways
# )
# 
# walk2(
#   bucharest_osm,
#   names(bucharest_osm),
#   ~ st_write(
#     .x,
#     dsn = sprintf("%s_%s.gpkg", .y, city_name),
#     append = FALSE,
#     quiet = TRUE
#   )
# )

## -----------------------------------------------------------------------------
# bucharest_osm <- get_osmdata(city_name, river_name, buffer = bbox_buffer)

## -----------------------------------------------------------------------------
# names(bucharest_osm)

## ----eval=TRUE, fig.alt="All layers combined", fig.cap="All layers combined"----
if (requireNamespace("ggplot2", quietly = TRUE)) {
  library(ggplot2)
  ggplot() +
    geom_sf(data = bucharest_osm$boundary, fill = "grey", color = "black") +
    geom_sf(data = bucharest_osm$railways, color = "orange") +
    geom_sf(data = bucharest_osm$streets, color = "black") +
    geom_sf(data = bucharest_osm$river_surface, fill = "blue", color = "blue") +
    geom_sf(data = bucharest_osm$river_centerline, color = "blue") +
    xlim(417000, 439000) +
    ylim(4908800, 4932500)
} else {
  message("ggplot2 not available; skipping plot examples.")
}

