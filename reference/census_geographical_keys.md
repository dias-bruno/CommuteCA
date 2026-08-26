# Complete geographic keys for census spatial units

A key dataset linking Dissemination Areas (DAs) to some higher-level
geographic units used in the 2021 Census of Population. This dataset
provides the hierarchical relationships between DAs, Census Tracts
(CTs), Census Subdivisions (CSDs), Census Divisions (CDs), Census
Metropolitan Areas (CMAs), and Provinces (PRs). It is created based on
the Statistics Canada's geographic reference files.

## Usage

``` r
data(census_geographical_keys)
```

## Format

A data frame with rows representing unique Dissemination Areas (DAs) and
columns with geographic identifiers and names at each level. All
geographic identifiers are stored as factors.

- DAUID:

  Dissemination Area unique identifier (8-digit code).

- CTUID:

  Census Tract unique identifier (7-digit code).

- CTNAME:

  Census Tract name.

- PCSD:

  Census Subdivision unique identifier (7-digit code).

- PCSDNAME:

  Census Subdivision name.

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

Statistics Canada. (2021). Census of Population Geographic Files.
Methodology documented in the package GitHub repository under
'/data-raw/make-data/'.
