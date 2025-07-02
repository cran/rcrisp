## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(rcrisp)
library(dplyr)
library(sf)
library(sfnetworks)

bucharest_osm <- get_osm_example_data()
bucharest_dem <- get_dem_example_data()

## -----------------------------------------------------------------------------
streets <- bucharest_osm$streets
railways <- bucharest_osm$railways

## -----------------------------------------------------------------------------
network <- bind_rows(streets, railways) |>
  as_sfnetwork(directed = FALSE) |>
  activate("nodes") |>
  mutate(node_id = row_number())

## -----------------------------------------------------------------------------
network_new <- flatten_network(network)

## ----warning=FALSE------------------------------------------------------------
network_cleaned <- clean_network(network_new)

## ----fig.alt="The network before and after preprocessing."--------------------
network_new_nodes <- network_cleaned |>
  activate("nodes") |>
  filter(is.na(node_id)) |>
  activate("edges") |>
  filter(is.na(from) & is.na(to))

network_removed_nodes <- network |>
  activate("nodes") |>
  filter(!node_id %in% (activate(network_cleaned, "nodes") |>
                          pull(node_id))) |>
  activate("edges") |>
  filter(is.na(from) & is.na(to))

par(mfrow = c(1, 2))
plot(network, col = "grey50",
     xlim = c(425100, 425400), ylim = c(4922400, 4923000),
     main = "Network before preprocessing")
plot(network_cleaned |> activate("nodes"), col = "grey50",
     xlim = c(425100, 425400), ylim = c(4922400, 4923000),
     main = "Network after preprocessing")
plot(network_new_nodes, col = "darkgreen",
     xlim = c(425100, 425400), ylim = c(4922400, 4923000),
     main = "Network after preprocessing", add = TRUE)
plot(network_removed_nodes, col = "red", pch = 4,
     xlim = c(425100, 425400), ylim = c(4922400, 4923000),
     main = "Network after preprocessing", add = TRUE)

