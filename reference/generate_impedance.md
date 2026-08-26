# Generate impedance values

This function calculate the impedance (`f`) related to a travel cost
(usually duration) by applying probability density functions (PDF).

## Usage

``` r
generate_impedance(
  df,
  travel_cost_col = "travel_cost",
  distribution_col = "distribution",
  est1_col = "est_1",
  est2_col = "est_2",
  output_col = "f"
)
```

## Arguments

- df:

  A data frame containing columns for travel cost, distribution name,
  and two parameters.

- travel_cost_col:

  Name of the column with the travel costs (numeric). Default
  `"travel_time"`.

- distribution_col:

  Name of the column with the distribution name. Default
  `"distribution"`.

- est1_col:

  Name of the column for the first distribution parameter. Default
  `"est_1"`.

- est2_col:

  Name of the column for the second distribution parameter. Default
  `"est_2"`.

- output_col:

  Name of the new column to store impedance values. Default `"f"`.

## Value

The input data frame with an additional column (`output_col`) containing
the impedance values.

## Examples

``` r
if (FALSE) { # \dontrun{
df <- data.frame(Distribution = c("lnorm", "lnorm", "gamma"),
  Est_1 = c(0.5, 0.5, 1.2),
  Est_2 = c(0.8, 0.8, 0.3),
  travel_time = c(1, 5, 10))

df_with_impedance <- generate_impedance(df, travel_cost_col = travel_time,
                                        distribution_col = Distribution,
                                        est1_col = Est_1, est2_col = Est_2)
} # }
```
