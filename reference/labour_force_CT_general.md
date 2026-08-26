# Labour Force by Census Tract

Total population in the labour force for each Census Tract (CT) in
Canada, based on the 2021 Census of Population. Labour force counts are
calculated by summing individual weights (CompW1) for respondents with
valid labour force status. This dataset has been vetted and approved for
release by the Research Data Centre (RDC) at McMaster University.

## Usage

``` r
data(labour_force_CT_general)
```

## Format

A data frame with rows representing unique Census Tracts.

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

- labour_force_rounded:

  Total labour force population, rounded to the nearest multiple of 5
  for confidentiality.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
