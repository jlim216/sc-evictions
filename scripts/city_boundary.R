# Reads in and writes out city boundaries data.

# Author: JB Lim
# Version: 2020-01-31

# Libraries
library(tidyverse)
library(sf)

# Parameters
  #File Name
url_file <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

path_name <- here::here("data/city_boundary.rds")
#===============================================================================

url_file %>%
  read_sf() %>%
  select(GEOID, n, geometry) %>%
  rename(
    "geoid" = GEOID,
    "name" = n
  ) %>%
  mutate(geoid = as.integer(geoid)) %>%
  write_rds(path_name)

