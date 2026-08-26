# Impedance Functions by Education Level for Census Metropolitan Areas

Impedance functions fitted to commuting duration distributions for
Canadian Census Metropolitan Areas (CMAs) and Census Agglomerations
(CAs), categorized by education level. Functions were estimated using
the `fitdistrplus` package based on PwDUR data from the 2021 Census of
Population. The best-fit distribution was selected using the lowest AIC.

## Usage

``` r
data(cma_education_impedance_functions)
```

## Format

A data frame with rows representing unique parameterized impedance
functions for each combination of CMA, transportation mode, and
education level.

- CMA:

  Census metropolitan area code (3-digit).

- CMANAME:

  CMA or CA name.

- PR:

  Province code (2-digit).

- PRNAME:

  Province or territory name.

- Education:

  Education level. One of: 'High school or no certificate', 'College or
  apprenticeship certificate', or 'University certificate or higher'.

- PwMode_label:

  Transportation mode. One of: 'Bike', 'Car-motorized', 'Public
  transit', or 'Walk'.

- Distribution:

  Best-fitting probability distribution. One of: 'Exponential',
  'Normal', 'Log-normal', 'Gamma', or 'Uniform'.

- est_1:

  First parameter estimate for the specified distribution.

- est_2:

  Second parameter estimate for the specified distribution.

## Source

Statistics Canada. (2021). Census of Population.
<https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E>
Reproduced and distributed on an "as is" basis with the permission of
Statistics Canada. This aggregated dataset was produced from
confidential microdata accessed at the Research Data Centre (RDC) at
McMaster University and was vetted and approved for release in
accordance with disclosure control requirements. Accessed December 19,
2024.
