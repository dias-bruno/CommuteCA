# Unique Census Division (CD) Keys

A version of the geographic keys "census_geographical_keys" containing
one row per unique Census Division (CD).

## Usage

``` r
data(pcd_keys)
```

## Format

A data frame with rows representing unique CDs. All geographic
identifiers are stored as factors.

- PCD:

  Census Division code (4-digit: 2-digit province + 2-digit division).

- PCDNAME:

  Census Division name.

- CMA:

  Census Metropolitan Area or Census Agglomeration code (3-digit).

- CMANAME:

  CMA or CA name.

- CMACATEG:

  CMA category. One of: 'Census Metropolitan Area or Census
  Agglomeration', 'Strong metropolitan influenced zone', 'Moderate
  metropolitan influenced zone', 'Weak metropolitan influenced zone',
  'No metropolitan influenced zone', or 'Territories (outside CAs)'.

- PR:

  Province code (2-digit).

- PRNAME:

  Province or territory name.

## Source

Obtained from
[`census_geographical_keys`](https://dias-bruno.github.io/CommuteCA/reference/census_geographical_keys.md).
