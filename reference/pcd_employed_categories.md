# Employed Population by Occupation, Education, and Transportation Mode by Census Division

Employed population for each Census Division (PCD) in Canada,
categorized by occupation category (TEER), the worker's education level,
and main transportation mode used to commute to work, obtained from the
2021 Census of Population. Counts are calculated by summing the weights
(CompW1) of workers whose place of work is within the CD. This dataset
can be used to examine the match between job skill requirements and
worker qualifications, for example as input to
[`matching_spatial_availability`](https://dias-bruno.github.io/CommuteCA/reference/matching_spatial_availability.md).
This dataset has been vetted and approved for release by the Research
Data Centre (RDC) at McMaster University.

## Usage

``` r
data(pcd_employed_categories)
```

## Format

A data frame with rows representing each combination of Census Division,
occupation category, education level, and transportation mode.

- PCD:

  Census division code (4-digit: 2-digit province + 2-digit division).

- PCDNAME:

  Census division name.

- PR:

  Province code (2-digit).

- PRNAME:

  Province or territory name.

- TEER:

  Occupation category based on Training, Education, Experience, and
  Responsibilities (TEER). Possible values: 'High school or short-term
  experience (4 - 5)', 'College or apprenticeship (2 - 3)', or
  'Management or professional (0 - 1)'.

- Education:

  Education level of the worker (highest certificate, diploma or
  degree). One of: 'High school or no certificate', 'College or
  apprenticeship certificate', or 'University certificate or higher'.

- PwMode_label:

  Main transportation mode to work. One of: 'Walk', 'Bike', 'Public
  transit', 'Car-motorized', or 'Other or non-commuter'.

- employed_pop:

  Employed population for the given combination, rounded to the nearest
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
