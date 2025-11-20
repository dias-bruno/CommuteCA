# Maximum travel times in the Census Metropolitan Area.

This object contains the maximum travel times for commuting to work for
all Census Metropolitan Area (CMA) in Canada, obtained from the Census
of Population (2021). The methodology to obtain this data set is
described in the R markdown 'making-data-v2.Rmd'.

## Usage

``` r
data(cma_max_travel_times)
```

## Format

A simple feature class (sf) polygon object containing 596 rows and 3
variables; each row represents a combination of CMA and transportation
mode.

- CMA:

  Uniquely identifies a CMA.

- PwMode:

  Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and
  'Walk.'

- Max_time_value:

  Maximum travel time for the CMA using the mentioned transportation
  mode.

## Source

"[Census of Population
2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E)
accessed September 11, 2024.
