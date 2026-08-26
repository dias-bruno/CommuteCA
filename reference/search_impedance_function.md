# Obtain calibrated impedance function

For a given location (PCD or CMA), this function searches for impedance
parameters, first, at the most detailed level, and then falls back to
higher levels: PCD search: PCD =\> CMA =\> Province (CMACATEG). CMA
search: CMA =\> Province (CMACATEG).

## Usage

``` r
search_impedance_function(
  code,
  type = c("PCD", "CMA"),
  mode = NULL,
  use_education = FALSE,
  education = NULL,
  pcd_df = pcd_impedance_functions,
  cma_df = cma_impedance_functions,
  pr_df = pr_impedance_functions,
  pcd_edu_df = pcd_education_impedance_functions,
  cma_edu_df = cma_education_impedance_functions,
  pr_edu_df = pr_education_impedance_functions
)
```

## Arguments

- code:

  A character or numeric vector of length 1: the PCD or CMA code.

- type:

  Either `"PCD"` or `"CMA"`. Defaults to `"PCD"`.

- mode:

  Optional character string naming one of the four modes (`"Bike"`,
  `"Walk"`, `"Car-motorized"`, `"Public transit"`). If `NULL` (default),
  all four modes are returned.

- use_education:

  logical `TRUE` or `FALSE`; if `TRUE`, use education-specific impedance
  functions (with an `Education` column). If `FALSE` (default), use
  transportation mode-only functions.

- education:

  Optional character string specifying an education level. Only used
  when `use_education = TRUE`. Selection between:
  `"College or apprenticeship certificate"`,
  `"High school or no certificate"`, or
  `"University certificate or higher"`. If `NULL` (default), all three
  education levels are returned.

- pcd_df:

  Transportation mode-only PCD data frame. Defaults to
  `pcd_impedance_functions`.

- cma_df:

  Transportation mode-only CMA data frame. Defaults to
  `cma_impedance_functions`.

- pr_df:

  Transportation mode-only provincial data frame. Defaults to
  `pr_impedance_functions`.

- pcd_edu_df:

  Mode-education-function PCD data frame. Defaults to
  `pcd_education_impedance_functions`.

- cma_edu_df:

  Mode-education-function CMA data frame. Defaults to
  `cma_education_impedance_functions`.

- pr_edu_df:

  Mode-education-function provincial data frame. Defaults to
  `pr_education_impedance_functions`.

## Value

A tibble with columns:

- code:

  Input location code.

- type:

  Search type (`"PCD"` or `"CMA"`).

- PwMode_label:

  Transportation mode.

- Education:

  Education level (only if `use_education = TRUE`; otherwise `NA`).

- Distribution:

  Name of the fitted distribution.

- est_1:

  First parameter.

- est_2:

  Second parameter.

- source:

  Geographical level of the function: `"PCD"`,`"CMA"`, or `"PR"`.

## Details

It is possible to choose choose between transportation mode functions or
mode-education functions.

## Examples

``` r
if (FALSE) { # \dontrun{
# search by PCD using transportation mode-only functions (all modes)
search_impedance_function(3520)

# search by PCD with mode-education functions, all education levels
search_impedance_function(3520, use_education = TRUE)

# search by PCD with mode-education functions, filtered by one education level
search_impedance_function(3520,
                          use_education = TRUE,
                          education = "University certificate or higher")

# Search by CMA
search_impedance_function(537, type = "CMA")
} # }
```
