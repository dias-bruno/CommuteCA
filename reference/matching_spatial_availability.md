# Calculate matching spatial availability (SA_ij) for eligible population segments

This function extends the spatial availability measure by allowing only
eligible population segments to compete for each opportunity type. For
each opportunity type \\t\\, the total eligible population \\q\\ is used
as the denominator, and the impedance factor is normalized using only
the impedance values of eligible groups.

## Usage

``` r
matching_spatial_availability(
  df,
  origin,
  destination,
  pop,
  opp,
  mode,
  pop_segment,
  opp_type,
  f
)
```

## Arguments

- df:

  A data frame containing origin, destination, population, opportunity,
  mode, population segment, opportunity type, and impedance columns.

- origin:

  Unquoted column name identifying the origin zone (e.g., `PRCDDA`,
  `CTUID`).

- destination:

  Unquoted column name identifying the destination zone (e.g., `PWDA`).

- pop:

  Unquoted column name for the population (or labour force) at each
  origin, categorized by mode and population segment.

- opp:

  Unquoted column name for the opportunities (e.g., jobs) at each
  destination, categorized by opportunity type.

- mode:

  Unquoted column name for the travel mode (used only for grouping).

- pop_segment:

  Unquoted column name for the population segment (e.g., education
  level) that determines eligibility.

- opp_type:

  Unquoted column name for the opportunity type (e.g., TEER category)
  that determines which population segments are eligible.

- f:

  Unquoted column name containing the impedance value (e.g., from a
  decay function calibrated per mode and population segment).

## Value

The input data frame with additional columns:

- sum_pop:

  Total eligible population for each opportunity type.

- f_p:

  Population factor.

- sum_impedance:

  Sum of impedances for each destination and opportunity type.

- f_c:

  Impedance factor.

- sum_pa:

  Sum of population factor multiplied by impedance factor.

- f_t:

  Balancing factor.

- SA_ij:

  Matching spatial availability for the row
  (origin-destination-mode-segment-type).

## Examples

``` r
if (FALSE) { # \dontrun{
# Assuming a data frame `trips` with columns:
# origin_id, destination_id, mode, edu_level, teer, pop, jobs, f
result <- matching_spatial_availability(df = trips,
  origin = origin_id,
  destination = destination_id,
  pop = pop,
  opp = jobs,
  mode = mode,
  pop_segment = edu_level,
  opp_type = teer,
  f = f
)
head(result$SA_ij)
} # }
```
