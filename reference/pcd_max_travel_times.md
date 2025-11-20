# Maximum travel times in the Census Division.

This object contains the maximum travel times for commuting to work for
all Census Divisions (CD) in Canada, obtained from the Census of
Population (2021). The methodology to obtain this data set is described
in the R markdown 'making-data-v2.Rmd'.

## Usage

``` r
data(pcd_max_travel_times)
```

## Format

A simple feature class (sf) polygon object containing 1,083 rows and 3
variables; each row represents a combination of CD and transportation
mode.

- PCD:

  Uniquely identifies a census division (composed of the 2 digit
  province or territory unique identifier followed by the 2 digit census
  division code).

- PwMode:

  Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and
  'Walk.'

- Max_time_value:

  Maximum travel time for the CD using the mentioned transportation
  mode.

## Source

"[Census of Population
2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E)
accessed September 11, 2024.
