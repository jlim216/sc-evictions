# Reads in and writes out city evictions data.

# Author: JB Lim
# Version: 2020-01-30

# Libraries
library(tidyverse)

# Parameters
  # URL for raw file data
url_file <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

  # Variable types
vars_type <-
  cols_only(
    'GEOID' = col_integer(),
    "year" = col_integer(),
    "name" = col_character(),
    "evictions" = col_double()
  )

path_name <- here::here("data/city_evictions.rds")
#===============================================================================

url_file %>%
  read_csv(col_types = vars_type) %>%
  rename_all(str_to_lower) %>%
  filter(year == 2016) %>%
  write_rds(path_name)
