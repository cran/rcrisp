## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE,
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(rcrisp)
# library(purrr)
# 
# city_name <- "Bucharest"
# river_name <- "Dâmbovița"
# crs <- 32635  # EPSG code for UTM zone 35N, where Bucharest is located
# network_buffer <- 3000  # in m, buffer around the river to get the network
# buildings_buffer <- 100  # in m, buffer around the river to get the buildings

## -----------------------------------------------------------------------------
# bb <- get_osm_bb(city_name)

## -----------------------------------------------------------------------------
# city_boundary <- get_osm_city_boundary(bb, city_name, crs)
# river <- get_osm_river(bb, river_name, crs)
# aoi_network <- get_river_aoi(river, bb, buffer_distance = network_buffer)
# streets <- get_osm_streets(bb, crs)
# railways <- get_osm_railways(bb, crs)
# aoi_buildings <- get_river_aoi(river, bb, buffer_distance = buildings_buffer)
# buildings <- get_osm_buildings(bb, crs)
# 
# bucharest_osm <- list(
#   boundary = city_boundary,
#   river_centerline = river$centerline,
#   river_surface = river$surface,
#   aoi_network = aoi_network,
#   streets = streets,
#   railways = railways,
#   aoi_buildings = aoi_buildings,
#   buildings = buildings
# )

## -----------------------------------------------------------------------------
# bucharest_osm <- get_osmdata(city_name, river_name,
#                              network_buffer = network_buffer)

## -----------------------------------------------------------------------------
# names(bucharest_osm)

## ----plot, echo=FALSE, fig.alt="All layers combined", fig.cap="All layers combined (buildings not shown)"----
# bbox <- sf::st_bbox(bucharest_osm$boundary)
# plot(
#   NA,
#   xlim = c(bbox["xmin"], bbox["xmax"]),
#   ylim = c(bbox["ymin"], bbox["ymax"]),
#   asp = 1,
#   xaxt = "n",
#   yaxt = "n",
#   xlab = "",
#   ylab = "",
#   bty = "n"
# )
# plot(bucharest_osm$railways$geom, col = "orange", add = TRUE)
# plot(bucharest_osm$streets$geom, color = "black", add = TRUE)
# plot(bucharest_osm$river_surface, col = "blue", border = "blue", add = TRUE)
# plot(bucharest_osm$river_centerline, col = "blue", add = TRUE)
# plot(bucharest_osm$boundary, border = "red", add = TRUE)

## ----eval=FALSE---------------------------------------------------------------
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

