# 2021 Census of Population Test Data

This object contains test data (fake observations created to represent
the original version) of the Census of Population.

## Usage

``` r
data(census_test_data)
```

## Format

A data frame object containing 250,000 rows and 17 variables; each row
represents a unique (fake) respondent.

- Frame_ID:

  Unique identifier of the (fake) respondent.

- PRCDDA:

  Refers to the dissemination area (DA) of current residence

- Pr:

  Refers to the province or territory of current residence.

- CMA:

  Census metropolitan area or census agglomeration of current residence.

- PCD:

  Census division of current residence.

- CompW1:

  Weight for the households and dwellings universes.

- LBR_FORC:

  This variable refers to whether a person was employed, unemployed or
  not in the labour force.

- CfInc_AT:

  Total income of census family (sum of the total incomes of all members
  of that family), after tax.

- CFCNT:

  Census family size (numbers of persons).

- CF_PnCF_NumEarners:

  Number of earners in census family.

- PWDA:

  Place of work dissemination area.

- PWPR:

  Place of work province.

- PWCD:

  Census metropolitan area or census agglomeration of place of work.

- PWCMA:

  Place of work census division.

- PWDUR:

  Commuting duration, it refers to the length of time, in minutes,
  usually required by a person to travel to their place of work.

- PWDist:

  Distance (straight line) from home to work.

- PwMode:

  Main mode of commuting' refers to the main mode of transportation a
  person uses to travel to their place of work.
