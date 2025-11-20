# Impedance functions for Canadian Census Divisions

This object contains impedance functions for Canadian Census Divisions
(CDs) for job destinations, considering different transportation modes
('Bike', 'Car', 'Transit', and 'Walk'). We estimated impedance functions
using the fitdistrplus package, using the 'PwDUR' (Commuting duration)
of the 2021 Census of Population. The best-fit function was defined by
selecting the lowest Akaike information criterion.

## Usage

``` r
data(pcd_impedance_functions)
```

## Format

A data frame containing 675 rows and 12 variables; each row represents a
unique function.

- PCD:

  Uniquely identifies the census division.

- Pr:

  Province or Territory.

- CMA:

  Census Metropolitan Area or Census Agglomeration unique identifier.

- PwMode:

  Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and
  'Walk.'

- distribution:

  Name of the function that best adjusted the duration values
  considering the specific location and transportation mode (can be
  'exponential', 'norm', 'lnorm', 'gamma' or 'unif')

- est_1:

  Estimate of the first parameter for the function described in
  'distribution.'

- est_2:

  Estimate of the second parameter for the function described in
  'distribution.'

- loglike:

  Log Likelihood obtained for the function 'distribution.'

- AIC:

  Akaike information criterion obtained for function 'distribution.'

- BIC:

  Bayesian information criterion obtained for function 'distribution.'

## Source

"2021 Census of Population, informations about the census is available
[here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E)
accessed December 19th 2024.
