# Calculate spatial availability (SA_ij) for a given mode and impedance

This function calculates the spatial availability of opportunities
(jobs, services, etc.) from each origin to each destination (see Soukhov
et al 2024,
https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0299077.)

## Usage

``` r
calculate_spatial_availability(df, origin, destination, pop, opp, mode, f)
```

## Arguments

- df:

  A data frame containing origin, destination, population, opportunity,
  mode, and impedance columns.

- origin:

  Unquoted column name identifying the origin zone (e.g., `PRCDDA`,
  `CTUID`, `from_id`).

- destination:

  Unquoted column name identifying the destination zone (e.g., `PWDA`,
  `to_id`).

- pop:

  Unquoted column name for the population (or labour force) at each
  origin.

- opp:

  Unquoted column name for the opportunities (e.g., jobs) at each
  destination.

- mode:

  Unquoted column name for the travel mode (used only for grouping).

- f:

  Unquoted column name containing the impedance value (e.g., `f` from
  `generate_impedance`).

## Value

A data frame (the input `df` with additional columns: `sum_pop`, `f_c`,
`f_p`, `sum_pa`, `f_t`, and `SA_ij` - the final spatial availability).

## References

This function is based on the studies of Soukhov et al. (2023) and
Soukhov et al. (2024).

Soukhov, A., Paez, A., Higgins, C. D., & Mohamed, M. (2023). Introducing
spatial availability, a singly-constrained measure of competitive
accessibility. PLoS One, 18(1), e0278468. Soukhov, A., Tarrino-Ortiz,
J., Soria-Lara, J. A., & Paez, A. (2024). Multimodal spatial
availability: A singly-constrained measure of accessibility considering
multiple modes. Plos one, 19(2), e0299077.

## Examples

``` r
if (FALSE) { # \dontrun{
accessibility_table %>%
  spatial_availability(origin = PRCDDA,
                       destination = PWDA,
                       pop = labour_force,
                       mode = PwMode_label,
                       opp = jobs,
                       f = f)
} # }
```
