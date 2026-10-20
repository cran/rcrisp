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

