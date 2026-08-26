# Maximum Travel Times by Census Division

Maximum travel times for commuting to work for all Census Divisions
(CDs) in Canada, obtained from the 2021 Census of Population. Travel
times are calculated separately for each transportation mode.

## Usage

``` r
data(pcd_max_travel_times)
```

## Format

A data frame with rows representing each combination of Census Division
and transportation mode.

- PCD:

  Census division code (4-digit: 2-digit province + 2-digit division).

- PCDNAME:

  Census division name.

- PR:

  Province code (2-digit).

- PRNAME:

  Province or territory name.

- PwMode_label:

  Transportation mode. One of: 'Bike', 'Car-motorized', 'Public
  transit', or 'Walk'.

- Maximum_travel_time:

  Maximum commuting duration (in minutes) for the given CD and mode.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
