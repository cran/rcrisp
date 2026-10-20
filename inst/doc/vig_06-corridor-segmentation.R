## ----srr-tags, eval=FALSE, echo=FALSE-----------------------------------------
# #' @srrstats {G2.10} This vignette uses `sf::st_geometry()` to extract the
# #'   geometry column from the `sf` objects `bucharest_osm$river_centerline` and
# #'   `streets`. This is used when only geometry information is needed from that
# #'   point onwards and all other attributes (i.e., columns) can be safely
# #'   discarded. The object returned by `sf::st_geometry()` is a simple feature
# #'   geometry list column of class `sfc`.
# #' @srrstats {SP2.2a} This vignette demonstrates the compatibility of `rcrisp`
# #'   routines with `sf` workflows.

