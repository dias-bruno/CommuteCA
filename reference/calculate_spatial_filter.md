# Calculate a spatial filter for a spatial variable based on a set of eigenvectors

This function builds a spatial filter by iteratively adding eigenvectors
to a linear model. Only eigenvectors with a p-value below a threshold
are retained and cumulatively added to the filter (default \<= 0.05).
The function can optionally divide the data by one or more categorical
variables (e.g., mode, education level) and calculate separate filters
for each subset. The result is a single data frame containing the
identifier, the response variable, the computed filter, and the grouping
columns (if any).

## Usage

``` r
calculate_spatial_filter(
  spatial_data_frame,
  matrix_eigv,
  by = "ID",
  group_vars = NULL,
  response = "access",
  ev_prefix = "EV",
  threshold = 0.05
)
```

## Arguments

- spatial_data_frame:

  A data frame containing the spatial variable (`response`) and the
  identifier (join key). Must contain a column named by `response` and a
  column matching `by` (or the left side of `by` if it is named).

- matrix_eigv:

  A data frame containing the eigenvectors (columns starting with
  `ev_prefix`) and an identifier (join key) matching the right side of
  `by`.

- by:

  A character string or a named character vector of length 1 specifying
  the join key(s). If a single string, it is used as the column name in
  both tables. If named (e.g. `c("ID" = "CTUID")`), the name is the
  column in `spatial_data_frame` and the value is the column in
  `matrix_eigv`. Default: `"ID"`.

- group_vars:

  Optional character vector naming columns in `spatial_data_frame` by
  which to divide the data before computing the filter. For each unique
  combination of these variables, a separate filter is built. If `NULL`
  (default), a single filter is computed for all rows.

- response:

  Character string naming the response (e.g., `y`, dependent) variable
  in `spatial_data_frame`. Default: `"access"`.

- ev_prefix:

  Character string giving the prefix of the eigenvector columns in
  `matrix_eigv`. Default: `"EV"`.

- threshold:

  Numeric p-value threshold for including an eigenvector in the filter
  (two-sided test). Default: `0.05`.

## Value

A data frame with the following columns:

- the identifier column (named as in `by` or its left side)

- the response variable (named `response`)

- the spatial filter, named `Sf_<response>`

- any grouping columns specified in `group_vars` (if provided)

The rows are in the same order as the original `spatial_data_frame`.

## Details

The function performs a forward selection procedure:

1.  Join `spatial_data_frame` with `matrix_eigv` on the specified key.

2.  Initialize `Sf = 0` and `x = 1`.

3.  For each eigenvector (in the order they appear in the joined data),
    fit the model `response ~ x + Sf + EV_i`.

4.  If the coefficient of `EV_i` has a p-value \< `threshold`, add
    `coef(EV_i) * EV_i` to `Sf`.

5.  Return a data frame with only the ID, response, filter, and groups.

The same procedure is applied independently to each group defined by
`group_vars`, and the results are row-bound into a single data frame.

## Note

The eigenvectors are assumed to have been pre-computed (e.g., from a
spatial weights matrix).

## References

This function is based on the study of Le Gallo, J., & Paez, A. (2013).

Le Gallo, J., & Paez, A. (2013). *Using synthetic variables in
instrumental variable estimation of spatial series models.*.
*Environment and Planning A*, *45*(9), 2227-2242.
[doi:10.1068/a45443](https://doi.org/10.1068/a45443)

## Examples

``` r
if (FALSE) { # \dontrun{
# Single group (no splitting)
result_df <- calculate_spatial_filter(spatial_data_frame = my_access,
  matrix_eigv = eigen_matrix)

# Split by transportation mode (column "PwMode")
result_by_mode <- calculate_spatial_filter(spatial_data_frame = SA_mode,
  matrix_eigv = matrix_eigv,
  by = "PRCDDA",
  group_vars = "PwMode",
  response = "SA_im")

# Split by combination of education and mode
result_by_edu_mode <- calculate_spatial_filter(spatial_data_frame = my_data,
  matrix_eigv = eigen_matrix,
  by = c("CTUID" = "ID"),
  group_vars = c("Education", "Mode"),
  response = "SA_i",
  ev_prefix = "EIG",
  threshold = 0.10)
} # }
```
