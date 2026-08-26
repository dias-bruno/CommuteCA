# Job Opportunities by Census Tract

Total job opportunities (employment locations) for each Census Tract
(CT) in Canada, obtained from the 2021 Census of Population. Job counts
are calculated by summing the weights (CompW1) of all workers whose
place of work is within the CT. This dataset has been vetted and
approved for release by the Research Data Centre (RDC) at McMaster
University.

## Usage

``` r
data(jobs_CT_general)
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

- jobs_rounded:

  Total job opportunities in the CT, rounded to the nearest multiple of
  5.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
