# Impedance functions for Canadian Provinces and Territories

This object contains impedance functions for Canadian Provinces and
Territories, for job destinations, considering different transportation
modes ('Bike', 'Car', 'Transit', and 'Walk') and types of CMA/CAs
('Territories (outside CAs)','CMA/CA','Strong metropolitan influenced
zone', 'Moderate metropolitan influenced zone','Weak metropolitan
influenced zone', 'No metropolitan influenced zone'). We estimated
impedance functions using the fitdistrplus package, using the 'PwDUR'
(Commuting duration) of the 2021 Census of Population. The best-fit
function was defined by selecting the lowest Akaike information
criterion.

## Usage

``` r
data(pr_impedance_functions)
```

## Format

A data frame containing 675 rows and 12 variables; each row represents a
unique function.

- Pr:

  Province or Territory.

- CMA_type:

  Type of Census Metropolitan Area or Census Agglomeration (Possible
  values: 'Territories (outside CAs)','CMA/CA','Strong metropolitan
  influenced zone', 'Moderate metropolitan influenced zone','Weak
  metropolitan influenced zone', or 'No metropolitan influenced zone').

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
