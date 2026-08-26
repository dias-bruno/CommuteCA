# Impedance Functions for Canadian Census Divisions

Impedance functions fitted to commuting duration distributions for
Canadian Census Divisions (CDs). Functions were estimated using the
`fitdistrplus` package based on PwDUR (commuting duration) data from the
2021 Census of Population. The best-fit distribution was selected using
the lowest Akaike Information Criterion (AIC).

## Usage

``` r
data(pcd_impedance_functions)
```

## Format

A data frame with 675 rows representing unique parameterized impedance
functions for each combination of CD, transportation mode, and education
level (where applicable).

- PCD:

  Census division code (4-digit).

- PCDNAME:

  Census division name.

- CMA:

  Census metropolitan area code (3-digit).

- CMANAME:

  CMA or CA name.

- CMACATEG:

  CMA category. One of: 'Census Metropolitan Area or Census
  Agglomeration', 'Strong metropolitan influenced zone', 'Moderate
  metropolitan influenced zone', 'No metropolitan influenced zone', or
  'Territories (outside CAs)'.

- PR:

  Province code (2-digit).

- PRNAME:

  Province or territory name.

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
