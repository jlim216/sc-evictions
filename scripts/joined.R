# Joins the cleaned evictions data with the cleaned boundaries data.

# Author: JB Lim
# Version: 2020-01-31

# Libraries
library(tidyverse)

# Parameters
  # read in files

evictions <- here::here("data/city_evictions.rds")
boundary <- here::here("data/city_boundary.rds")

path_name <- here::here("data/joined.rds")
#===============================================================================

evictions <-
  read_rds(evictions)

boundary <-
  read_rds(boundary)

evictions %>%
  left_join(
    boundary %>%
      select(geoid, geometry),
    by = "geoid"
  ) %>%
  write_rds(path_name)


