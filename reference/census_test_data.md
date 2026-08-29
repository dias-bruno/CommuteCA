# 2021 Census of Population Test Data for the Greater Toronto Metropolitan Area and Hamilton (GTAH)

A synthetic dataset representing the 2021 Census of Population for the
Greater Toronto Metropolitan Area and Hamilton (GTAH). Contains 30,000
artificial observations created to simulate the structure of the
original census data while ensuring respondent confidentiality. This
dataset includes additional demographic and socioeconomic variables when
compared to the general test data.

## Usage

``` r
data(census_test_data)
```

## Format

A data frame with 30,000 rows and 33 columns. Each row represents a
unique synthetic respondent.

- Frame_ID:

  Household Identifier.

- PRCDDA:

  Dissemination area code of current residence.

- PR:

  Province or territory code of current residence.

- CMA:

  Census metropolitan area code of current residence.

- PCD:

  Census division code of current residence.

- POP_CNTR_IND:

  Population centre indicator. If the person lives inside a population
  centre (POPCTR) area and outside a population centre area (rural
  areas)..

- CompW1:

  Survey weight for households and dwellings universes.

- LBR_FORC:

  Labour force status.

- CfInc_AT:

  After-tax income of census family (Canadian dollars).

- CFCNT_PP:

  Census family size (number of persons).

- CF_PnCF_NumEarners:

  Number of earners in census family.

- PWDA:

  Place of work dissemination area.

- PWPR:

  Place of work province.

- PWCD:

  Place of work census division.

- PWCMA:

  Place of work census metropolitan area.

- PWDUR:

  Commuting duration in minutes.

- PWDist:

  Straight-line distance from home to work (km).

- PwMode:

  Main mode of transportation to work.

- Mob5:

  Mobility status - place of residence 5 years ago (2016).

- AGE:

  Age of respondent (in years).

- GENDER_BINARY:

  Binary gender of respondent.

- LoLICOA:

  Low-income status based on LICO-AT (after tax).

- LoLIMA:

  Low-income status based on LIM-AT (after tax).

- ACTLMFLG:

  Activities of daily living indicator.

- CFAMSTSIMPLE:

  Type of census family.

- IMMCAT5:

  Immigration admission category.

- PerImmA:

  Immigrant status and period of immigration (5-year groups).

- DVisMin:

  Visible minority status indicator.

- HCDD_7V:

  Education: Highest certificate, diploma or degree.

- LayAB:

  On temporary lay-off or absent from job or business.

- REASN:

  Reasons unable to start a job.

- MRNFY2:

  Main reason for not working the full year.

- PWStat:

  Commuting: Place of work status.

- CFKID0T5:

  Number of children aged 0-5 in census family.

- Weeks:

  Number of weeks worked during reference year.

- LOKWK:

  Looked for paid work in past four weeks (full/part-time).

- GovtI_SocAssist:

  Social assistance benefits received.

- Tenu:

  Tenure (housing ownership).

- DTYPE:

  Structural type of dwelling.

- Built:

  Period of construction (year ranges). Codes: 1: befor 1920, 2:
  1921-1945, 3: 1946-1960, 4: 1961-1970, 5: 1971-1980,6: 1981-1990,7:
  1991-1995,8: 1996-2000, 9: 2001-2005, 10: 2006-2010, 11: 2011-2015,
  12: 2016-2020, 13: 2021.

- STIR:

  Shelter-cost-to-income ratio (percentage).

- BEDNEED:

  Number of bedrooms needed for suitable housing.

- Rpair:

  Dwelling condition.

## Note

This is synthetic test data only and should not be used for analytical
purposes.
