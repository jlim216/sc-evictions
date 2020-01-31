Exploratory Data Analysis for City Eviction Data
================
JB Lim
2020-01-31

``` r
# Libraries
library(tidyverse)

# Parameters
evictions <- here::here("data/city_evictions.rds")

#===============================================================================
```

## Read in Cleaned Evictions Data

``` r
city_evictions <-  
  evictions %>%
  read_rds()
```

## City with Most Evictions in South Carolina

``` r
city_evictions %>%
  top_n(1, wt = evictions)
```

    ## # A tibble: 1 x 4
    ##     geoid  year name             evictions
    ##     <int> <int> <chr>                <dbl>
    ## 1 4550875  2016 North Charleston     3660.

  - North Charleston had the most evictions in 2016 at South Carolina
    with a record of 3660.10.
