# Job Opportunities by Occupation Category by Census Tract

Job opportunities by Training, Education, Experience, and
Responsibilities (TEER) category for each Census Tract (CT) in Canada,
obtained from the 2021 Census of Population. TEER categories are grouped
into three broad levels based on skill requirements. Counts are
calculated by summing the weights (CompW1) of workers whose place of
work is within the CT. This dataset has been vetted and approved for
release by the Research Data Centre (RDC) at McMaster University.

## Usage

``` r
data(jobs_CT_occupation)
```

## Format

A data frame with rows representing each combination of Census Tract and
occupation category.

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

- TEER:

  Occupation category. One of: 'High school or short-term experience
  (4-5)', 'College or apprenticeship (2-3)', or 'Management or
  professional (0-1)'.

- jobs_rounded:

  Job opportunities for the given TEER category, rounded to the nearest
  multiple of 5.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
