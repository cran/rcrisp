## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE
)

## ----setup, warning=FALSE, message=FALSE--------------------------------------
library(rcrisp)
library(sf)

bucharest_osm <- get_osm_example_data()
bucharest_dem <- get_dem_example_data()

if (any(is.null(bucharest_osm), is.null(bucharest_dem))) {
  cat("NOTE: Example data was not found; ",
      "subsequent code chunks will be skipped.\n", sep = "")
  knitr::opts_chunk$set(eval = FALSE)
}

## ----variables----------------------------------------------------------------
city_name <- "Bucharest"
river_name <- "Dâmbovița"

## ----delineate, eval=FALSE----------------------------------------------------
# bucharest_dambovita <- delineate(
#   city_name,
#   river_name,
#   segments = TRUE,
#   riverspace = TRUE
# )

## ----plot, fig.alt="Delineation of the corridor of River Dâmbovița in Bucharest"----
# Plot all layers within the extent of the delineated corridor
bbox <- st_bbox(bucharest_dambovita$corridor)
plot(bucharest_dambovita$valley, col = "grey", border = NA,
     xlim = c(bbox["xmin"], bbox["xmax"]), ylim = c(bbox["ymin"], bbox["ymax"]))
plot(bucharest_dambovita$riverspace, col = "lightgreen", border = NA,
     add = TRUE)
plot(bucharest_osm$river_centerline, col = "blue", add = TRUE)
plot(bucharest_dambovita$segments, border = "lightblue", add = TRUE)
plot(bucharest_dambovita$corridor, border = "red", wt = 2, add = TRUE)

