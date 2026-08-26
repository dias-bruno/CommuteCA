# Estimated Labour Force by Transportation Mode by Census Tract

Estimated labour force population by primary transportation mode for
each Census Tract (CT) in Canada. Non-commuters (unemployed individuals
and those working from home) have been redistributed proportionally
across the four transportation modes ('Bike', 'Car-motorized', 'Public
transit', and 'Walk') based on the mode share within each CT. This
dataset has been vetted and approved for release by the Research Data
Centre (RDC) at McMaster University.

## Usage

``` r
data(estimated_labour_force_CT_mode)
```

## Format

A data frame with rows representing each combination of Census Tract and
transportation mode.

- CTUID:

  Census tract unique identifier (7-digit code).

- CTNAME:

  Census tract name.

- PCD:

  Census division code (4-digit).

- CMA:

  Census metropolitan area code (3-digit).

- PR:

  Province code (2-digit).

- PwMode_label:

  Transportation mode. One of: 'Bike', 'Car-motorized', 'Public
  transit', or 'Walk'.

- est_labour_force:

  Estimated labour force population for the given mode.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
