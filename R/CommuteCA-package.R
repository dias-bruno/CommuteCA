#' CommuteCA: an R package to develop standardized methods for transport analysis in research
#'
#' The main objective of the *CommuteCA* package is to develop standardized methods for
#' accessibility analysis in research, especially for studies using Statistics Canada surveys.
#' Among the available surveys, we focused our efforts on the [*2021 Census of Population*](https://www12.statcan.gc.ca/census-recensement/index-eng.cfm),
#' which contain valuable variables for transportation research.
#' This package was created in conjunction with the office of the
#' [*Research Data Center* at *McMaster University*](https://rdc.mcmaster.ca/),
#' the [*Sherman Centre for Digital Scholarship*](https://scds.ca/) and
#' the [*Mobilizing Justice*](https://mobilizingjustice.ca/).
#'
#' @docType package
#' @name CommuteCA-package
#' @author Bruno Dos Santos, School of Earth, Environment and Society, McMaster University \email{dossanb@@mcmaster.ca}
#' @author Antonio Paez, School of Earth, Environment and Society, McMaster University \email{paezha@@mcmaster.ca}
#' @references \url{https://github.com/dias-bruno/CommuteCA}
"_PACKAGE"


##############################################
##           CENSUS TEST DATA               ##
##############################################

#' 2021 Census of Population Test Data
#'
#' This object contains test data (fake observations created to represent the original version) of the Census of Population.
#'
#' @format A data frame object containing 250,000 rows and 17 variables; each row represents a unique (fake) respondent.
#'   \describe{
#'   \item{Frame_ID}{Unique identifier of the (fake) respondent.}
#'   \item{PRCDDA}{Refers to the dissemination area (DA) of current residence}
#'   \item{Pr}{Refers to the province or territory of current residence.}
#'   \item{CMA}{Census metropolitan area or census agglomeration of current residence.}
#'   \item{PCD}{Census division of current residence.}
#'   \item{CompW1}{Weight for the households and dwellings universes.}
#'   \item{LBR_FORC}{This variable refers to whether a person was employed, unemployed or not in the labour force.}
#'   \item{CfInc_AT}{Total income of census family (sum of the total incomes of all members of that family), after tax.}
#'   \item{CFCNT}{Census family size (numbers of persons).}
#'   \item{CF_PnCF_NumEarners}{Number of earners in census family.}
#'   \item{PWDA}{Place of work dissemination area.}
#'   \item{PWPR}{Place of work province.}
#'   \item{PWCD}{Census metropolitan area or census agglomeration of place of work.}
#'   \item{PWCMA}{Place of work census division.}
#'   \item{PWDUR}{Commuting duration, it refers to the length of time, in minutes, usually required by a person to travel to their place of work.}
#'   \item{PWDist}{Distance (straight line) from home to work.}
#'   \item{PwMode}{Main mode of commuting' refers to the main mode of transportation a person uses to travel to their place of work.}
#'}
#' @docType data
#' @keywords census test data
#' @name census_test_data
#' @usage data(census_test_data)
"census_test_data"

##############################################
##          TORONTO TEST DATA               ##
##############################################

#' 2021 Census of Population Test Data for the City of Toronto
#'
#' This object contains test data (fake observations created to represent the original version) of the Census of Population for the City of Toronto.
#'
#' @format A data frame object containing 52,274 rows and 32 variables; each row represents a unique (fake) respondent.
#'   \describe{
#'   \item{Frame_ID}{Unique identifier of the (fake) respondent.}
#'   \item{PRCDDA}{Refers to the dissemination area (DA) of current residence}
#'   \item{Pr}{Refers to the province or territory of current residence.}
#'   \item{CMA}{Census metropolitan area or census agglomeration of current residence.}
#'   \item{PCD}{Census division of current residence.}
#'   \item{CompW1}{Weight for the households and dwellings universes.}
#'   \item{LBR_FORC}{This variable refers to whether a person was employed, unemployed or not in the labour force.}
#'   \item{CfInc_AT}{Total income of census family (sum of the total incomes of all members of that family) after tax.}
#'   \item{CFCNT}{Census family size (numbers of persons).}
#'   \item{CF_PnCF_NumEarners}{Number of earners in census family.}
#'   \item{PWDA}{Place of work dissemination area.}
#'   \item{PWPR}{Place of work province.}
#'   \item{PWCD}{Census metropolitan area or census agglomeration of place of work.}
#'   \item{PWCMA}{Place of work census division.}
#'   \item{PWDUR}{Commuting duration, it refers to the length of time, in minutes, usually required by a person to travel to their place of work.}
#'   \item{PWDist}{Distance (straight line) from home to work.}
#'   \item{PwMode}{Main mode of commuting' refers to the main mode of transportation a person uses to travel to their place of work.}
#'   \item{Mob5}{Mobility Status - Place of residence 5 years ago (2016).}
#'   \item{AGE}{Age of the (fake) respondent.}
#'   \item{GENDER_BINARY}{Gender of (fake) person (binary).}
#'   \item{LOLICOA}{Low-income status based on LICO-AT (after tax).}
#'   \item{LoLIMA}{Low-income status based on LIM-AT (after tax).}
#'   \item{ACTLMFLG}{Activities of daily living: Flag.}
#'   \item{CFAMSTSIMPLE}{Type of (fake) family.}
#'   \item{IMMCAT5}{Immigration: Admission category.}
#'   \item{PerImmA}{Immigration: Immigrant status and period of immigration (by five year group).}
#'   \item{DVisMin}{If the (fake) person is part of a visible minority group.}
#'   \item{HCDD}{Education: Highest certificate, diploma or degree.}
#'   \item{CFKID0T5}{Number of children in census family aged 0 to 5.}
#'   \item{WEEKS}{Weeks worked during the reference year.}
#'   \item{LOKWK}{Looked for paid work in past four weeks (full- or part-time work).}
#'   \item{GovtI_SocAssist}{ Income: Social assistance benefits.}
#'}
#' @docType data
#' @keywords census toronto test data
#' @name census_test_toronto
#' @usage data(census_test_toronto)
"census_test_toronto"

##############################################
##  TRAVEL TIMES AND IMPEDANCE FUNCTIONS    ##
##############################################

#' Maximum travel times in the Census Division.
#'
#' This object contains the maximum travel times for commuting to work for all Census Divisions (CD) in Canada,
#' obtained from the Census of Population (2021). The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A simple feature class (sf) polygon object containing 1,083 rows and 3 variables; each row represents a combination of CD and transportation mode.
#'   \describe{
#'   \item{PCD}{Uniquely identifies a census division (composed of the 2 digit province or territory unique identifier followed by the 2 digit census division code).}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CD using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census division
#' @name pcd_max_travel_times
#' @usage data(pcd_max_travel_times)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"pcd_max_travel_times"

#' Maximum travel times in the Census Metropolitan Area.
#'
#' This object contains the maximum travel times for commuting to work for all Census Metropolitan Area (CMA) in Canada,
#' obtained from the Census of Population (2021). The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A simple feature class (sf) polygon object containing 596 rows and 3 variables; each row represents a combination of CMA and transportation mode.
#'   \describe{
#'   \item{CMA}{Uniquely identifies a CMA.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CMA using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census metropolitan area
#' @name cma_max_travel_times
#' @usage data(cma_max_travel_times)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"cma_max_travel_times"

#' Impedance functions for Canadian Census Divisions
#'
#' This object contains impedance functions for Canadian Census Divisions (CDs)
#' for job destinations, considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk').
#' We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR' (Commuting duration) of the 2021 Census of Population.
#' The best-fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{Pr}{Province or Territory.}
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be 'exponential', 'norm', 'lnorm', 'gamma' or 'unif')}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance census division pcd
#' @name pcd_impedance_functions
#' @usage data(pcd_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"pcd_impedance_functions"

#' Impedance functions for Census Metropolitan Areas and Census Agglomerations
#'
#' This object contains impedance functions for Census Metropolitan Areas
#' and Census Agglomerations (CMA/CAs), for job destinations,
#' considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk').
#' We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR'
#' (Commuting duration) of the 2021 Census of Population.
#' The best fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{Pr}{Province or Territory.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be 'exponential', 'norm', 'lnorm', 'gamma' or 'unif')}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance census metropolitan area agglomerations cma ca
#' @name cma_impedance_functions
#' @usage data(cma_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"cma_impedance_functions"

#' Impedance functions for Canadian Provinces and Territories
#'
#' This object contains impedance functions for Canadian Provinces and Territories, for job destinations,
#' considering different transportation modes ('Bike', 'Car', 'Transit', and 'Walk')
#' and types of CMA/CAs ('Territories (outside CAs)','CMA/CA','Strong metropolitan influenced zone',
#' 'Moderate metropolitan influenced zone','Weak metropolitan influenced zone',
#' 'No metropolitan influenced zone'). We estimated impedance functions  using the fitdistrplus package, using the 'PwDUR'
#' (Commuting duration) of the 2021 Census of Population.
#' The best-fit function was defined by selecting the lowest Akaike information criterion.
#'
#' @format A data frame containing 675 rows and 12 variables; each row represents a unique function.
#'   \describe{
#'   \item{Pr}{Province or Territory.}
#'   \item{CMA_type}{Type of Census Metropolitan Area or Census Agglomeration (Possible values: 'Territories (outside CAs)','CMA/CA','Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone','Weak metropolitan influenced zone', or 'No metropolitan influenced zone').}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{distribution}{Name of the function that best adjusted the duration values considering the specific location and transportation mode (can be 'exponential', 'norm', 'lnorm', 'gamma' or 'unif')}.
#'   \item{est_1}{Estimate of the first parameter for the function described in 'distribution.'}
#'   \item{est_2}{Estimate of the second parameter for the function described in 'distribution.'}
#'   \item{loglike}{Log Likelihood obtained for the function 'distribution.'}
#'   \item{AIC}{Akaike information criterion obtained for function 'distribution.'}
#'   \item{BIC}{Bayesian information criterion obtained for function 'distribution.'}
#'}
#' @docType data
#' @keywords impedance functions decay distance province territory census metropolitan area agglomerations
#' @name pr_impedance_functions
#' @usage data(pr_impedance_functions)
#' @source "2021 Census of Population, informations about the census is available [here](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed December 19th 2024.
"pr_impedance_functions"

##############################################
##              LAND USE                    ##
##############################################

#' Census Tract Land Use (General)
#'
#' This object contains the census tracts (CT) for all census metropolitan areas and census agglomerations (2021),
#' with land use information regarding the number of labour force and number of jobs of each CT.
#' CTs are small, relatively stable geographic areas that usually have a population of fewer than 7,500 persons,
#' based on data from the previous Census of Population Program. They are located in census metropolitan areas (CMAs)
#' and in census agglomerations (CAs) that had a core population of 50,000 or more in the previous census.
#' The labour force and number of jobs in each CT was obtained from the Census of Population. We calculated the labour force
#' by summing the number of employed people and the number of unemployed individuals who are still part of the workforce.
#' This is done by summing the weights of the census variable (CompW1). The number of jobs was obtained applying the
#' weighted sum for cases of respondents mentioning working in the DA.  Only cases of CT in accordance
#' with the Research Data Centre vetting rules were released. The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A data frame containing 6,148 rows and 8 variables; each row represents a unique CT.
#'   \describe{
#'   \item{CTUID}{Uniquely identifies a census tract. Each CT is assigned a seven character numeric 'name' (including leading zeros, decimal point and trailing zeros).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{CMAUID}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{CMANAME}{Census Metropolitan Area or Census Agglomeration name.}
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{labour_force_rounded}{Number of individuals in labour force (employed or not), rounded to the nearest multiple of 5.}
#'   \item{jobs_rounded}{Number of jobs in this CT rounded to the nearest multiple of 5.}
#'}
#' @docType data
#' @keywords land use census tract general
#' @name land_use_CT_general
#' @usage data(land_use_CT_general)
#' @source "The 2021 census tracts areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"land_use_CT_general"



#' Census Tract Land Use (by Mode)
#'
#' This object contains the census tracts (CT) for all census metropolitan areas and census agglomerations (2021),
#' with land use information regarding the number of labour force (estimated) and number of jobs of each CT.
#' CTs are small, relatively stable geographic areas that usually have a population of fewer than 7,500 persons,
#' based on data from the previous Census of Population Program. They are located in census metropolitan areas (CMAs)
#' and in census agglomerations (CAs) that had a core population of 50,000 or more in the previous census.
#' The labour force and number of jobs in each CT was obtained from the Census of Population. We estimated the labour force
#' by calculating the proportion of trips made by each mode of transport in each census tract, then distributing
#' non-commuters (people who either don't work or work from home) among these transport modes. The number of jobs was obtained
#' applying the weighted sum for cases of respondents mentioning working in the DA.  Only cases of CT in accordance
#' with the Research Data Centre vetting rules were released. The methodology to obtain this data set is described in the
#' R markdown 'making-data-v2.Rmd'.
#'
#' @format A data frame containing 23,970 rows and 9 variables; each row represents a unique CT.
#'   \describe{
#'   \item{CTUID}{Uniquely identifies a census tract. Each CT is assigned a seven character numeric 'name' (including leading zeros, decimal point and trailing zeros).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{CMAUID}{Census Metropolitan Area or Census Agglomeration unique identifier.}
#'   \item{CMANAME}{Census Metropolitan Area or Census Agglomeration name.}
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{labour_force_est_rounded}{Estimated number of individuals in labour force (employed or not), rounded to the nearest multiple of 5.}
#'   \item{jobs_rounded}{Number of jobs in this CT rounded to the nearest multiple of 5.}
#'}
#' @docType data
#' @keywords land use census tract mode walk bike car transit
#' @name land_use_CT_mode
#' @usage data(land_use_CT_mode)
#' @source "The 2021 census tracts areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"land_use_CT_mode"

##########################
####### FUNCTIONS ########
##########################

#' Calculate spatial availability (SA_ij) for a given mode and impedance
#'
#' This function computes the spatial availability of opportunities (jobs, services, etc.)
#' from each origin to each destination (see Soukhov et al 2024, https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0299077.)
#'
#' @param df A data frame containing origin, destination, population, opportunity,
#'   mode, and impedance columns.
#' @param origin Unquoted column name identifying the origin zone (e.g., `PRCDDA`, `CTUID`, `from_id`).
#' @param destination Unquoted column name identifying the destination zone (e.g., `PWDA`, `to_id`).
#' @param pop Unquoted column name for the population (or labour force) at each origin.
#' @param opp Unquoted column name for the opportunities (e.g., jobs) at each destination.
#' @param mode Unquoted column name for the travel mode (used only for grouping).
#' @param f Unquoted column name containing the impedance value (e.g., `f` from `generate_impedance`).
#'
#' @return A data frame (the input `df` with additional columns: `sum_pop`, `f_c`, `f_p`,
#'   `sum_pa`, `f_t`, and `SA_ij` – the final spatial availability).
#' @export
#'
#' @importFrom dplyr distinct summarise pull group_by summarize left_join mutate
#' @importFrom rlang enquo as_name sym
#' @importFrom magrittr %>%
#' @examples
#' \dontrun{
#' accessibility_table %>%
#'   spatial_availability(origin = PRCDDA,
#'                        destination = PWDA,
#'                        pop = labour_force,
#'                        mode = PwMode_label,
#'                        opp = jobs,
#'                        f = f)
#' }
calculate_spatial_availability <- function(df, origin, destination, pop, opp, mode, f){

  origin <- rlang::enquo(origin)
  destination <- rlang::enquo(destination)
  pop <- rlang::enquo(pop)
  opp <- rlang::enquo(opp)
  mode <- rlang::enquo(mode)
  f <- rlang::enquo(f)

  # Calculate sum of population in the system
  sum_pop <- df %>%
    dplyr::distinct(!!origin, !!mode,
                    .keep_all = TRUE) %>%
    dplyr::summarise(pop = sum(!!pop)) %>%
    dplyr::pull(pop) %>%
    sum()

  df$sum_pop <- sum_pop

  # Calculate f_p: population factor
  f_p <- dplyr::pull(df, !!pop)/ sum_pop

  # Calculate sum of impedance
  sum_impedance <- df %>%
    dplyr::group_by(!!destination) %>%
    dplyr::summarize(sum_impedance = sum(!!f))

  df <- df %>%
    dplyr::left_join(sum_impedance, by = rlang::as_name(destination))

  # Calculate f_c: impedance factor
  f_c <- dplyr::pull(df, !!f) / df$sum_impedance

  df$f_c <- f_c
  df$f_p <- f_p

  # Calculate f_p * f_c  (using !! with explicit symbols for new columns)
  sum_pa <- df %>%
    dplyr::group_by(!!destination) %>%
    dplyr::summarize(sum_pa = sum(!!rlang::sym("f_p") * !!rlang::sym("f_c")))

  df <- df %>%
    dplyr::left_join(sum_pa,
                     by = rlang::as_name(destination))

  # Calculate f_t: balancing factor
  df$f_t <- (f_p * f_c) / dplyr::pull(df, sum_pa)

  # Calculate the Spatial Availability (use !! for f_t as well)
  df %>%
    dplyr::mutate(SA_ij = !!opp * !!rlang::sym("f_t"))
}


#' Generate impedance values for a given travel cost
#'
#' @param impedance_function A list (or a 1‑row data frame) with elements/columns
#'   containing the distribution name and its two parameters.
#' @param travel_cost A numeric vector of travel costs.
#' @param col_distribution Name of the element/column for the distribution type.
#'   Defaults to `"distribution"`.
#' @param col_est1 Name of the element/column for the first parameter.
#'   Defaults to `"est_1"`.
#' @param col_est2 Name of the element/column for the second parameter.
#'   Defaults to `"est_2"`.
#' @return A numeric vector of impedance values (same length as `travel_cost`).
#' @importFrom scales rescale
#' @export
#' @examples
#' impedance <- list(distribution = "lnorm", est_1 = 0.5, est_2 = 0.8)
#' generate_impedance(impedance, 1:10)
#'
#' # With custom names and alias
#' impedance2 <- list(dist_type = "Lognormal", param1 = 0.5, param2 = 0.8)
#' generate_impedance(impedance2, 1:10,
#'                    col_distribution = "dist_type",
#'                    col_est1 = "param1",
#'                    col_est2 = "param2")
generate_impedance <- function(impedance_function,
                               travel_cost = 60,
                               col_distribution = "distribution",
                               col_est1 = "est_1",
                               col_est2 = "est_2"){

  # Input validation (allow both list and 1-row data frame)
  if (is.data.frame(impedance_function) && nrow(impedance_function) == 1){
    impedance_function <- as.list(impedance_function)
  }
  stopifnot(is.list(impedance_function),
    all(c(col_distribution, col_est1, col_est2) %in% names(impedance_function)),
    is.numeric(travel_cost))

  normalize_dist <- function(x){
    x <- tolower(trimws(x))
    x <- gsub("[-_ ]", "", x)  # remove hyphens, underscores, spaces
    switch(x,
           lognormal = "lnorm",
           lnorm = "lnorm",
           gamma = "gamma",
           normal = "norm",
           norm = "norm",
           exponential = "exp",
           exp ="exp",
           uniform = "unif",
           unif = "unif",
           stop("Unknown distribution alias: ", x, call. = FALSE))
  }


 dist_raw <- impedance_function[[col_distribution]]
  a <- impedance_function[[col_est1]]
  b <- impedance_function[[col_est2]]

  dist <- normalize_dist(dist_raw)

  f <- switch(dist,
              lnorm = dlnorm(travel_cost, meanlog = a, sdlog = b),
              unif = dunif(travel_cost, min = 0, max = b),   # as in original: min=0, max=est_2
              exp = rescale(dexp(travel_cost, rate = a)),   # original used rescale
              gamma = dgamma(travel_cost, shape = a, rate = b),
              norm = dnorm(travel_cost, mean = a, sd = b),
              stop("Unsupported distribution (after normalisation): ", dist, call. = FALSE)
  )

  return(f)
}

#' Generate theoretical impedance curves for combinations of categorical fields
#'
#' This function creates a data frame of impedance values (`f`) for a sequence of travel
#' costs (`t`), based on distribution parameters stored in a dataframe. The user can
#' specify which categorical columns (e.g., `PwMode_label`, `PCD`, `Education`) define the unique
#' curves, and also provide custom column names for the distribution type and parameters.
#'
#' @param df_functions A data frame containing columns for distribution, parameters,
#'   and the categorical grouping columns.
#' @param travel_cost A numeric value – the maximum travel cost. The function creates a
#'   sequence from 1 to `travel_cost` in steps of 0.5.
#' @param group_cols A character vector naming the columns in `df_functions` that define
#'   the unique impedance functions (e.g., `c("PwMode_label", "PCD")`). Defaults to
#'   `c("PwMode_label", "PCD")` for backward compatibility.
#' @param col_distribution Name of the column that contains the distribution name.
#'   Defaults to `"distribution"`.
#' @param col_est1 Name of the column for the first parameter (e.g., meanlog, shape).
#'   Defaults to `"est_1"`.
#' @param col_est2 Name of the column for the second parameter (e.g., sdlog, rate).
#'   Defaults to `"est_2"`.
#'
#' @return A data frame with columns: `t` (travel cost), `f` (impedance), and each of the
#'   grouping columns.
#' @export
#'
#' @importFrom dplyr distinct filter across all_of bind_rows
#' @importFrom rlang sym
#' @examples
#' \dontrun{
#' # Default: group by PwMode_label and PCD
#' curves <- theoretical_impedance(functions_df, travel_cost = 30)
#'
#' # With three grouping columns and custom parameter column names
#' curves <- theoretical_impedance(functions_df, travel_cost = 30,
#'                                 group_cols = c("PwMode_label", "PCD", "Education"),
#'                                 col_distribution = "dist_type",
#'                                 col_est1 = "param1",
#'                                 col_est2 = "param2")
#' }
theoretical_impedance <- function(df_functions,
                                  travel_cost = 60,
                                  group_cols = c("PwMode_label", "PCD"),
                                  col_distribution = "distribution",
                                  col_est1 = "est_1",
                                  col_est2 = "est_2"){

  stopifnot(is.data.frame(df_functions),
    is.numeric(travel_cost), length(travel_cost) == 1,
    is.character(group_cols), length(group_cols) >= 1,
    all(group_cols %in% names(df_functions)),
    all(c(col_distribution, col_est1, col_est2) %in% names(df_functions)))

  normalize_dist <- function(x){
    x <- tolower(trimws(x))
    x <- gsub("[-_ ]", "", x)  # remove hyphens, underscores, spaces
    switch(x,
           lognormal = "lnorm",
           lnorm = "lnorm",
           gamma = "gamma",
           normal = "norm",
           norm = "norm",
           exponential = "exp",
           exp ="exp",
           uniform = "unif",
           unif = "unif",
           stop("Unknown distribution alias: ", x, call. = FALSE))
  }

  # Create the t sequence
  t_seq <- seq(1, travel_cost, by = 0.5)

  # Get all unique combinations of the grouping columns
  combos <- df_functions %>%
    dplyr::distinct(dplyr::across(dplyr::all_of(group_cols)))

  # Initialize an empty list to store results
  result_list <- list()

  # Loop over each combination
  for (i in seq_len(nrow(combos))) {
    combo <- combos[i, , drop = FALSE]

    # Build filter expression: column == value for each group
    filter_expr <- NULL
    for (col in group_cols) {
      val <- combo[[col]]
      if (is.null(filter_expr)) {
        filter_expr <- rlang::expr(!!rlang::sym(col) == !!val)
      } else {
        filter_expr <- rlang::expr(!!filter_expr & !!rlang::sym(col) == !!val)
      }
    }

    # Subset the function parameters for this combination
    subset <- df_functions %>% dplyr::filter(!!filter_expr)

    # Ensure we have exactly one row (take the first if multiple)
    if (nrow(subset) == 0) {
      warning("No parameters found for combination: ",
              paste(paste(group_cols, combo[1, ], sep = "="), collapse = ", "),
              " – skipping")
      next
    }
    subset <- subset[1,]

    combo_msg <- paste(paste(group_cols, combo[1, ], sep = "="), collapse = ", ")
    message("Processing: ", combo_msg)

    dist_raw <- subset[[col_distribution]]
    a <- subset[[col_est1]]
    b <- subset[[col_est2]]

    # distribution name
    dist <- normalize_dist(dist_raw)

    # Compute impedance values
    f_vals <- switch(dist,
                     lnorm = dlnorm(t_seq, meanlog = a, sdlog = b),
                     gamma = dgamma(t_seq, shape = a, rate = b),
                     norm = dnorm(t_seq, mean = a, sd = b),
                     exp = dexp(t_seq, rate = a),
                     unif = dunif(t_seq, min = a, max = b),
                     stop("Unsupported distribution (after normalisation): ", dist, call. = FALSE))

    # Build a data frame for this combination
    temp_df <- data.frame(t = t_seq, f = f_vals, stringsAsFactors = FALSE)

    # Add each grouping column as a separate column
    for (col in group_cols) {
      temp_df[[col]] <- combo[[col]]
    }

    # Store in list
    result_list[[i]] <- temp_df
  }

  # Combine all results
  result <- dplyr::bind_rows(result_list)

  return(result)
}
