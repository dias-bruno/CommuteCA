# Labour Force by Education Level and Transportation Mode by Census Tract

Labour force population by education level and primary transportation
mode for each Census Tract (CT) in Canada, obtained from the 2021 Census
of Population. Counts are calculated by summing individual weights
(CompW1) for respondents by education and mode categories. This dataset
has been vetted and approved for release by the Research Data Centre
(RDC) at McMaster University.

## Usage

``` r
data(labour_force_CT_education_mode)
```

## Format

A data frame with rows representing each combination of Census Tract,
education level, and transportation mode.

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

- Education:

  Education level. One of: 'High school or no certificate', 'College or
  apprenticeship certificate', or 'University certificate or higher'.

- PwMode_label:

  Transportation mode. One of: 'Bike', 'Car-motorized', 'Public
  transit', 'Walk', or 'Other or non-commuter'.

- labour_force_rounded:

  Labour force population for the given combination, rounded to the
  nearest multiple of 5.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
