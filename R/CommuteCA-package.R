#' CommuteCA: Datasets and Methods for Job Accessibility in Canada
#'
#' Provides datasets and standardized methods for job accessibility analysis using the
#' [*2021 Census of Population*](https://www12.statcan.gc.ca/census-recensement/index-eng.cfm) of Statistics Canada. Includes synthetic test data,
#' aggregated land-use datasets, and calibrated impedance functions for commuting
#' by transportation mode. Created with support from the [*Research Data Centre* at *McMaster University*](https://rdc.mcmaster.ca/),
#' the [*Sherman Centre for Digital Scholarship*](https://scds.ca/), and [*Mobilizing Justice*](https://mobilizingjustice.ca/).
#'
#' @docType package
#' @name CommuteCA-package
#' @author Bruno Dos Santos, School of Earth, Environment and Society, McMaster University \email{dossanb@@mcmaster.ca}
#' @author Antonio Paez, School of Earth, Environment and Society, McMaster University \email{paezha@@mcmaster.ca}
#' @references \url{https://github.com/dias-bruno/CommuteCA}
#' @section Data Attribution:
#' Data from Statistics Canada (2021 Census of Population) is included under
#' the Statistics Canada Open Licence and is reproduced and distributed on
#' an "as is" basis with the permission of Statistics Canada.
#' Source: Statistics Canada, 2021 Census of Population.
#' @importFrom stats setNames
#' @importFrom rlang :=
#' @importFrom magrittr %>%
"_PACKAGE"

# global variables to suppress R CMD check notes
utils::globalVariables(c( "pcd_impedance_functions", "cma_impedance_functions",
  "pr_impedance_functions", "pcd_education_impedance_functions",
  "cma_education_impedance_functions",  "pr_education_impedance_functions",

  # columns inside functions
  "f_p",  "f_c",  "f_t"
))

##############################################
##           Census TEST DATA               ##
##############################################

#' 2021 Census of Population Test Data for the Greater Toronto Metropolitan Area and Hamilton (GTAH)
#'
#' A synthetic dataset representing the 2021 Census of Population for
#' the Greater Toronto Metropolitan Area and Hamilton (GTAH). Contains 30,000 artificial observations created
#' to simulate the structure of the original census data while
#' ensuring respondent confidentiality. This dataset includes additional
#' demographic and socioeconomic variables when compared to the general test data.
#'
#' @format A data frame with 30,000 rows and 33 columns.
#'   Each row represents a unique synthetic respondent.
#'   \describe{
#'   \item{Frame_ID}{Unique synthetic identifier for each respondent.}
#'   \item{PRCDDA}{Dissemination area code of current residence.}
#'   \item{PR}{Province or territory code of current residence.}
#'   \item{CMA}{Census metropolitan area code of current residence.}
#'   \item{PCD}{Census division code of current residence.}
#'   \item{POP_CNTR_IND}{Population centre indicator. If the person lives inside a population centre (POPCTR) area and outside a population centre area (rural areas).. }
#'   \item{CompW1}{Survey weight for households and dwellings universes.}
#'   \item{LBR_FORC}{Labour force status.}
#'   \item{CfInc_AT}{After-tax income of census family (Canadian dollars).}
#'   \item{CFCNT_PP}{Census family size (number of persons).}
#'   \item{CF_PnCF_NumEarners}{Number of earners in census family.}
#'   \item{PWDA}{Place of work dissemination area.}
#'   \item{PWPR}{Place of work province.}
#'   \item{PWCD}{Place of work census division.}
#'   \item{PWCMA}{Place of work census metropolitan area.}
#'   \item{PWDUR}{Commuting duration in minutes.}
#'   \item{PWDist}{Straight-line distance from home to work (km).}
#'   \item{PwMode}{Main mode of transportation to work.}
#'   \item{Mob5}{Mobility status - place of residence 5 years ago (2016).}
#'   \item{AGE}{Age of respondent (in years).}
#'   \item{GENDER_BINARY}{Binary gender of respondent.}
#'   \item{LoLICOA}{Low-income status based on LICO-AT (after tax).}
#'   \item{LoLIMA}{Low-income status based on LIM-AT (after tax).}
#'   \item{ACTLMFLG}{Activities of daily living indicator.}
#'   \item{CFAMSTSIMPLE}{Type of census family.}
#'   \item{IMMCAT5}{Immigration admission category.}
#'   \item{PerImmA}{Immigrant status and period of immigration (5-year groups).}
#'   \item{DVisMin}{Visible minority status indicator.}
#'   \item{HCDD}{Highest certificate, diploma or degree obtained.}
#'   \item{CFKID0T5}{Number of children aged 0-5 in census family.}
#'   \item{Weeks}{Number of weeks worked during reference year.}
#'   \item{LOKWK}{Looked for paid work in past four weeks (full/part-time).}
#'   \item{GovtI_SocAssist}{Social assistance benefits received.}
#'   }
#'
#' @section Note:
#' This is synthetic test data only and should not be used for analytical purposes.
#'
#' @docType data
#' @keywords census toronto test data synthetic
#' @name census_test_data
#' @usage data(census_test_data)
"census_test_data"

##############################################
##              LAND USE                    ##
##############################################

#' Labour Force by Census Tract
#'
#' Total population in the labour force for each Census Tract (CT) in Canada,
#' based on the 2021 Census of Population. Labour force counts are
#' calculated by summing individual weights (CompW1) for respondents with
#' valid labour force status. This dataset has been vetted and approved for
#' release by the Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing unique Census Tracts.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{labour_force_rounded}{Total labour force population, rounded to the nearest multiple of 5 for confidentiality.}
#'   }
#'
#' @docType data
#' @keywords labour force census tract population workers
#' @name labour_force_CT_general
#' @usage data(labour_force_CT_general)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"labour_force_CT_general"

#' Labour Force by Transportation Mode by Census Tract
#'
#' Labour force population by main transportation mode to work for each
#' Census Tract (CT) in Canada, obtained from the 2021 Census of Population.
#' Counts are calculated by summing individual weights (CompW1) for respondents
#' by mode category. This dataset has been vetted and approved for release by
#' the Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract and transportation mode.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', 'Walk', or 'Other or non-commuter'.}
#'   \item{labour_force_rounded}{Labour force population for the given mode, rounded to the nearest multiple of 5.}
#'   }
#'
#' @docType data
#' @keywords labour force transportation mode census tract
#' @name labour_force_CT_mode
#' @usage data(labour_force_CT_mode)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"labour_force_CT_mode"

#' Estimated Labour Force by Transportation Mode by Census Tract
#'
#' Estimated labour force population by primary transportation mode for each
#' Census Tract (CT) in Canada. Non-commuters (unemployed individuals and
#' those working from home) have been redistributed proportionally across the
#' four transportation modes ('Bike', 'Car-motorized', 'Public transit',
#' and 'Walk') based on the mode share within each CT. This dataset has been
#' vetted and approved for release by the Research Data Centre (RDC) at
#' McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract and transportation mode.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{est_labour_force}{Estimated labour force population for the given mode.}
#'   }
#'
#' @docType data
#' @keywords labour force transportation mode census tract estimated
#' @name estimated_labour_force_CT_mode
#' @usage data(estimated_labour_force_CT_mode)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"estimated_labour_force_CT_mode"

#' Labour Force by Education Level by Census Tract
#'
#' Labour force population by education level for each Census Tract (CT)
#' in Canada, obtained from the 2021 Census of Population. Education levels
#' are grouped based on highest certificate, diploma or degree obtained.
#' Counts are calculated by summing individual weights (CompW1) for respondents
#' by education category. This dataset has been vetted and approved for
#' release by the Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract and education level.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{labour_force_rounded}{Labour force population for the given education level, rounded to the nearest multiple of 5.}
#'   }
#'
#' @docType data
#' @keywords labour force education census tract
#' @name labour_force_CT_education
#' @usage data(labour_force_CT_education)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"labour_force_CT_education"

#' Labour Force by Education Level and Transportation Mode by Census Tract
#'
#' Labour force population by education level and primary transportation mode
#' for each Census Tract (CT) in Canada, obtained from the 2021 Census of
#' Population. Counts are calculated by summing individual weights (CompW1)
#' for respondents by education and mode categories. This dataset has been
#' vetted and approved for release by the Research Data Centre (RDC) at
#' McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract, education level, and transportation mode.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', 'Walk', or 'Other or non-commuter'.}
#'   \item{labour_force_rounded}{Labour force population for the given combination, rounded to the nearest multiple of 5.}
#'   }
#'
#' @docType data
#' @keywords labour force education transportation mode census tract
#' @name labour_force_CT_education_mode
#' @usage data(labour_force_CT_education_mode)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"labour_force_CT_education_mode"

#' Estimated Labour Force by Education Level and Transportation Mode
#'
#' Estimated labour force population by education level and primary
#' transportation mode for each Census Tract (CT) in Canada. Non-commuters
#' have been redistributed proportionally across active transportation modes.
#' This dataset has been vetted and approved for release by
#' the Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract, education level, and transportation mode.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{est_labour_force}{Estimated labour force population for the given combination.}
#'   }
#'
#' @docType data
#' @keywords labour force education transportation mode census tract estimated
#' @name estimated_labour_force_CT_education_mode
#' @usage data(estimated_labour_force_CT_education_mode)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"estimated_labour_force_CT_education_mode"

#' Job Opportunities by Census Tract
#'
#' Total job opportunities (employment locations) for each Census Tract (CT)
#' in Canada, obtained from the 2021 Census of Population. Job counts are
#' calculated by summing the weights (CompW1) of all workers whose place of
#' work is within the CT. This dataset has been vetted and approved for
#' release by the Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing unique Census Tracts.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{jobs_rounded}{Total job opportunities in the CT, rounded to the nearest multiple of 5.}
#'   }
#'
#' @docType data
#' @keywords employment jobs census tract land use
#' @name jobs_CT_general
#' @usage data(jobs_CT_general)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"jobs_CT_general"

#' Job Opportunities by Occupation Category by Census Tract
#'
#' Job opportunities by Training, Education, Experience, and Responsibilities
#' (TEER) category for each Census Tract (CT) in Canada, obtained from the
#' 2021 Census of Population. TEER categories are grouped into three broad
#' levels based on skill requirements. Counts are calculated by summing the
#' weights (CompW1) of workers whose place of work is within the CT.
#' This dataset has been vetted and approved for release by the
#' Research Data Centre (RDC) at McMaster University.
#'
#' @format A data frame with rows representing each combination of
#'   Census Tract and occupation category.
#'   \describe{
#'   \item{CTUID}{Census tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census tract name.}
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{PR}{Province code (2-digit).}
#'   \item{TEER}{Occupation category. One of: 'High school or short-term experience (4-5)', 'College or apprenticeship (2-3)', or 'Management or professional (0-1)'.}
#'   \item{jobs_rounded}{Job opportunities for the given TEER category, rounded to the nearest multiple of 5.}
#'   }
#'
#' @docType data
#' @keywords employment jobs occupation TEER census tract
#' @name jobs_CT_occupation
#' @usage data(jobs_CT_occupation)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"jobs_CT_occupation"

##############################################
##  TRAVEL TIMES AND IMPEDANCE FUNCTIONS    ##
##############################################

#' Maximum Travel Times by Census Division
#'
#' Maximum travel times for commuting to work for all Census Divisions (CDs)
#' in Canada, obtained from the 2021 Census of Population. Travel times are
#' calculated separately for each transportation mode.
#'
#' @format A data frame with rows representing each combination of
#'   Census Division and transportation mode.
#'   \describe{
#'   \item{PCD}{Census division code (4-digit: 2-digit province + 2-digit division).}
#'   \item{PCDNAME}{Census division name.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Maximum_travel_time}{Maximum commuting duration (in minutes) for the given CD and mode.}
#'   }
#'
#' @docType data
#' @keywords travel time census division maximum
#' @name pcd_max_travel_times
#' @usage data(pcd_max_travel_times)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"pcd_max_travel_times"

#' Maximum Travel Times by Census Metropolitan Area
#'
#' Maximum travel times for commuting to work for all Census Metropolitan Areas (CMAs)
#' and Census Agglomerations (CAs) in Canada, obtained from the 2021 Census of Population.
#' Travel times are calculated separately for each transportation mode.
#'
#' @format A data frame with rows representing each combination of
#'   Census Metropolitan Area and transportation mode.
#'   \describe{
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Maximum_travel_time}{Maximum commuting duration (in minutes) for the given CMA and mode.}
#'   }
#'
#' @docType data
#' @keywords travel time census metropolitan area maximum
#' @name cma_max_travel_times
#' @usage data(cma_max_travel_times)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"cma_max_travel_times"

#' Impedance Functions for Canadian Census Divisions
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian Census Divisions (CDs). Functions were estimated using the
#' \code{fitdistrplus} package based on PwDUR (commuting duration) data
#' from the 2021 Census of Population. The best-fit distribution was selected
#' using the lowest Akaike Information Criterion (AIC).
#'
#' @format A data frame with 675 rows representing unique parameterized
#'   impedance functions for each combination of CD, transportation mode,
#'   and education level (where applicable).
#'   \describe{
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{PCDNAME}{Census division name.}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time census division
#' @name pcd_impedance_functions
#' @usage data(pcd_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"pcd_impedance_functions"

#' Impedance Functions by Education Level for Census Divisions
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian Census Divisions (CDs), categorized by education level.
#' Functions were estimated using the \code{fitdistrplus} package based
#' on PwDUR (commuting duration) data from the 2021 Census of Population.
#' The best-fit distribution was selected using the lowest AIC.
#'
#' @format A data frame with rows representing unique parameterized
#'   impedance functions for each combination of CD, transportation mode,
#'   and education level.
#'   \describe{
#'   \item{PCD}{Census division code (4-digit).}
#'   \item{PCDNAME}{Census division name.}
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time education census division
#' @name pcd_education_impedance_functions
#' @usage data(pcd_education_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"pcd_education_impedance_functions"

#' Impedance Functions for Census Metropolitan Areas
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian Census Metropolitan Areas (CMAs) and Census Agglomerations (CAs).
#' Functions were estimated using the \code{fitdistrplus} package based
#' on PwDUR (commuting duration) data from the 2021 Census of Population.
#' The best-fit distribution was selected using the lowest AIC.
#'
#' @format A data frame with rows representing unique parameterized
#'   impedance functions for each combination of CMA and transportation mode.
#'   \describe{
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time census metropolitan area
#' @name cma_impedance_functions
#' @usage data(cma_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"cma_impedance_functions"

#' Impedance Functions by Education Level for Census Metropolitan Areas
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian Census Metropolitan Areas (CMAs) and Census Agglomerations (CAs),
#' categorized by education level. Functions were estimated using the
#' \code{fitdistrplus} package based on PwDUR data from the 2021 Census of Population.
#' The best-fit distribution was selected using the lowest AIC.
#'
#' @format A data frame with rows representing unique parameterized
#'   impedance functions for each combination of CMA, transportation mode,
#'   and education level.
#'   \describe{
#'   \item{CMA}{Census metropolitan area code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time education census metropolitan area
#' @name cma_education_impedance_functions
#' @usage data(cma_education_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"cma_education_impedance_functions"

#' Impedance Functions for Canadian Provinces and Territories
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian provinces and territories, categorized by CMA category.
#' Functions were estimated using the \code{fitdistrplus} package based
#' on PwDUR data from the 2021 Census of Population. The best-fit distribution
#' was selected using the lowest AIC.
#'
#' @format A data frame with rows representing unique parameterized
#'   impedance functions for each combination of province, CMA category,
#'   and transportation mode.
#'   \describe{
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time province territory
#' @name pr_impedance_functions
#' @usage data(pr_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"pr_impedance_functions"

#' Impedance Functions by Education Level for Provinces and Territories
#'
#' Impedance functions fitted to commuting duration distributions for
#' Canadian provinces and territories, categorized by CMA category and
#' education level. Functions were estimated using the \code{fitdistrplus}
#' package based on PwDUR data from the 2021 Census of Population.
#' The best-fit distribution was selected using the lowest AIC.
#'
#' @format A data frame with rows representing unique parameterized
#'   impedance functions for each combination of province, CMA category,
#'   education level, and transportation mode.
#'   \describe{
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   \item{CMACATEG}{CMA category.}
#'   \item{Education}{Education level. One of: 'High school or no certificate', 'College or apprenticeship certificate', or 'University certificate or higher'.}
#'   \item{PwMode_label}{Transportation mode. One of: 'Bike', 'Car-motorized', 'Public transit', or 'Walk'.}
#'   \item{Distribution}{Best-fitting probability distribution. One of: 'Exponential', 'Normal', 'Log-normal', 'Gamma', or 'Uniform'.}
#'   \item{est_1}{First parameter estimate for the specified distribution.}
#'   \item{est_2}{Second parameter estimate for the specified distribution.}
#'   }
#'
#' @docType data
#' @keywords impedance functions travel time education province territory
#' @name pr_education_impedance_functions
#' @usage data(pr_education_impedance_functions)
#' @source
#' Statistics Canada. (2021). Census of Population.
#' \url{https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E}
#' Reproduced and distributed on an "as is" basis with the permission of Statistics Canada.
#' This aggregated dataset was produced from confidential microdata accessed at the
#' Research Data Centre (RDC) at McMaster University and was vetted and approved
#' for release in accordance with disclosure control requirements.
#' Accessed December 19, 2024.
"pr_education_impedance_functions"

##############################################
##           GEOGRAPHIC KEYS                ##
##############################################

#' Complete geographic keys for census spatial units
#'
#' A key dataset linking Dissemination Areas (DAs) to some higher-level
#' geographic units used in the 2021 Census of Population. This dataset provides
#' the hierarchical relationships between DAs, Census Tracts (CTs), Census Subdivisions
#' (CSDs), Census Divisions (CDs), Census Metropolitan Areas (CMAs), and Provinces (PRs).
#' It is created based on the Statistics Canada's geographic reference files.
#'
#' @format A data frame with rows representing unique Dissemination Areas (DAs)
#'   and columns with geographic identifiers and names at each level.
#'   All geographic identifiers are stored as factors.
#'   \describe{
#'   \item{DAUID}{Dissemination Area unique identifier (8-digit code).}
#'   \item{CTUID}{Census Tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census Tract name.}
#'   \item{PCSD}{Census Subdivision unique identifier (7-digit code).}
#'   \item{PCSDNAME}{Census Subdivision name.}
#'   \item{PCD}{Census Division code (4-digit: 2-digit province + 2-digit division).}
#'   \item{PCDNAME}{Census Division name.}
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'Weak metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   }
#'
#' @docType data
#' @keywords geography keys census dissemination area
#' @name census_geographical_keys
#' @usage data(census_geographical_keys)
#' @source
#' Statistics Canada. (2021). Census of Population Geographic Files.
#' Methodology documented in the package GitHub repository under '/data-raw/make-data/'.
"census_geographical_keys"

#' Unique Census Metropolitan Area (CMA) Keys
#'
#' A version of the geographic keys "census_geographical_keys" containing one row per
#' unique Census Metropolitan Area (CMA) or Census Agglomeration (CA).
#'
#' @format A data frame with rows representing unique CMAs/CAs.
#'   All geographic identifiers are stored as factors.
#'   \describe{
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'Weak metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   }
#'
#' @docType data
#' @keywords geography cma key
#' @name cma_keys
#' @usage data(cma_keys)
#' @source Obtained from \code{\link{census_geographical_keys}}.
"cma_keys"

#' Unique Census Division (CD) Keys
#'
#' A version of the geographic keys "census_geographical_keys" containing one row per
#' unique Census Division (CD).
#'
#' @format A data frame with rows representing unique CDs.
#'   All geographic identifiers are stored as factors.
#'   \describe{
#'   \item{PCD}{Census Division code (4-digit: 2-digit province + 2-digit division).}
#'   \item{PCDNAME}{Census Division name.}
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'Weak metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   }
#'
#' @docType data
#' @keywords geography pcd key census division
#' @name pcd_keys
#' @usage data(pcd_keys)
#' @source Obtained from \code{\link{census_geographical_keys}}.
"pcd_keys"

#' Unique Census Tract (CT) Keys
#'
#' A version of the geographic keys "census_geographical_keys" containing one row per
#' unique Census Tract (CT).
#'
#' @format A data frame with rows representing unique CTs.
#'   All geographic identifiers are stored as factors.
#'   \describe{
#'   \item{CTUID}{Census Tract unique identifier (7-digit code).}
#'   \item{CTNAME}{Census Tract name.}
#'   \item{PCSD}{Census Subdivision unique identifier (7-digit code).}
#'   \item{PCSDNAME}{Census Subdivision name.}
#'   \item{PCD}{Census Division code (4-digit).}
#'   \item{PCDNAME}{Census Division name.}
#'   \item{CMA}{Census Metropolitan Area or Census Agglomeration code (3-digit).}
#'   \item{CMANAME}{CMA or CA name.}
#'   \item{CMACATEG}{CMA category. One of: 'Census Metropolitan Area or Census Agglomeration', 'Strong metropolitan influenced zone', 'Moderate metropolitan influenced zone', 'Weak metropolitan influenced zone', 'No metropolitan influenced zone', or 'Territories (outside CAs)'.}
#'   \item{PR}{Province code (2-digit).}
#'   \item{PRNAME}{Province or territory name.}
#'   }
#'
#' @docType data
#' @keywords geography ct key census tract
#' @name ct_keys
#' @usage data(ct_keys)
#' @source Obtained from \code{\link{census_geographical_keys}}.
"ct_keys"

##############################################
##              FUNCTIONS                   ##
##############################################

#' Obtain calibrated impedance function
#'
#' For a given location (PCD or CMA), this function searches for impedance
#' parameters, first, at the most detailed level, and then falls back to higher levels:
#' PCD search: PCD => CMA => Province (CMACATEG).
#' CMA search: CMA => Province (CMACATEG).
#'
#' It is possible to choose choose between transportation mode functions or mode-education functions.
#'
#' @param code A character or numeric vector of length 1: the PCD or CMA code.
#' @param type Either `"PCD"` or `"CMA"`. Defaults to `"PCD"`.
#' @param mode Optional character string naming one of the four modes
#'   (`"Bike"`, `"Walk"`, `"Car-motorized"`, `"Public transit"`).
#'   If `NULL` (default), all four modes are returned.
#' @param use_education logical `TRUE` or `FALSE`; if `TRUE`, use education-specific impedance functions
#'   (with an `Education` column). If `FALSE` (default), use transportation mode-only functions.
#' @param education Optional character string specifying an education level.
#'   Only used when `use_education = TRUE`. Selection between:
#'   `"College or apprenticeship certificate"`,
#'   `"High school or no certificate"`, or `"University certificate or higher"`.
#'   If `NULL` (default), all three education levels are returned.
#' @param pcd_df Transportation mode-only PCD data frame. Defaults to `pcd_impedance_functions`.
#' @param cma_df Transportation mode-only CMA data frame. Defaults to `cma_impedance_functions`.
#' @param pr_df Transportation mode-only provincial data frame. Defaults to `pr_impedance_functions`.
#' @param pcd_edu_df Mode-education-function PCD data frame.
#'   Defaults to `pcd_education_impedance_functions`.
#' @param cma_edu_df Mode-education-function CMA data frame.
#'   Defaults to `cma_education_impedance_functions`.
#' @param pr_edu_df Mode-education-function provincial data frame.
#'   Defaults to `pr_education_impedance_functions`.
#'
#' @return A tibble with columns:
#'   \item{code}{Input location code.}
#'   \item{type}{Search type (`"PCD"` or `"CMA"`).}
#'   \item{PwMode_label}{Transportation mode.}
#'   \item{Education}{Education level (only if `use_education = TRUE`; otherwise `NA`).}
#'   \item{Distribution}{Name of the fitted distribution.}
#'   \item{est_1}{First parameter.}
#'   \item{est_2}{Second parameter.}
#'   \item{source}{Geographical level of the function: `"PCD"`,`"CMA"`, or `"PR"`.}
#'
#' @export
#'
#' @importFrom dplyr filter select mutate bind_rows
#' @importFrom rlang .data
#'
#' @examples
#' \dontrun{
#' # search by PCD using transportation mode-only functions (all modes)
#' search_impedance_function(3520)
#'
#' # search by PCD with mode-education functions, all education levels
#' search_impedance_function(3520, use_education = TRUE)
#'
#' # search by PCD with mode-education functions, filtered by one education level
#' search_impedance_function(3520,
#'                           use_education = TRUE,
#'                           education = "University certificate or higher")
#'
#' # Search by CMA
#' search_impedance_function(537, type = "CMA")
#' }
search_impedance_function <- function(code,
                                      type = c("PCD", "CMA"),
                                      mode = NULL,
                                      use_education = FALSE,
                                      education = NULL,
                                      pcd_df = pcd_impedance_functions,
                                      cma_df = cma_impedance_functions,
                                      pr_df = pr_impedance_functions,
                                      pcd_edu_df = pcd_education_impedance_functions,
                                      cma_edu_df = cma_education_impedance_functions,
                                      pr_edu_df = pr_education_impedance_functions){

  type <- match.arg(type)

  stopifnot(length(code) == 1, is.numeric(code) || is.character(code),
            is.data.frame(pcd_df), is.data.frame(cma_df), is.data.frame(pr_df),
            is.data.frame(pcd_edu_df), is.data.frame(cma_edu_df),
            is.data.frame(pr_edu_df))

  all_modes <- c("Bike", "Walk", "Car-motorized", "Public transit")
  all_edu <- c("College or apprenticeship certificate",
               "High school or no certificate",
               "University certificate or higher")

  if(!is.null(mode)){
    if(length(mode) != 1 || !mode %in% all_modes){
      stop("Transportation mode (`mode`) must be one of: ",
           paste(all_modes, collapse = ", "))
    }

    search_modes <- mode
  }else{search_modes <- all_modes}

  if(use_education){
    if(!is.null(education)){
      if(length(education) != 1 || !education %in% all_edu){
        stop("Education level (`education`) must be one of: ",
             paste(all_edu, collapse = ", "))
      }
      edu_levels <- education
    }else{edu_levels <- all_edu}

  }else{edu_levels <- NA_character_}

  if(type == "PCD"){
    pcd_source <- if(use_education){
      pcd_edu_df
    }else{pcd_df}

    pcd_record <- pcd_source  %>%
      dplyr::filter(.data$PCD == code) %>%
      dplyr::slice(1)

    if(nrow(pcd_record)==0){
      warning("PCD ", code, " not found in ",
              if(use_education){"education-specific "}else{""},
              "PCD-level data. Falling back to CMA/PR using only provided codes.")
      cma_code <- NA
      cmacat <- NA
      pr_code <- NA
    }else{
      cma_code <- pcd_record$CMA[1]
      cmacat <- pcd_record$CMACATEG[1]
      pr_code <- pcd_record$PR[1]
    }

    testar_levels <- c("PCD", "CMA", "PR")

  }else{cma_source <- if(use_education){
    cma_edu_df
  }else{cma_df}

  cma_record <- cma_source %>%
    dplyr::filter(.data$CMA == code) %>%
    dplyr::slice(1)

    if(nrow(cma_record) == 0){
      warning("CMA ", code, " not found in ",
              if(use_education){
                "education-specific "
              }else{""},
              "CMA-level data. It will try a provincial function.")

      pr_code <- NA
      cmacat <- NA
    }else{

      pr_code <- cma_record$PR[1]
      cmacat <- cma_record$CMACATEG[1]
      }

    cma_code <- code
    testar_levels <- c("CMA","PR")
  }

  if(use_education){
    level_dfs <- list(PCD = pcd_edu_df, CMA = cma_edu_df,PR= pr_edu_df)
    }else{
      level_dfs<- list(PCD = pcd_df,CMA = cma_df,PR = pr_df)
  }

  fetch_pair <-function(modo,edu){
    for(level in testar_levels){
      if(level == "PCD"){
        if(type == "PCD"){

          row <- level_dfs$PCD %>%
            dplyr::filter(.data$PCD == code, .data$PwMode_label == modo)

          if(use_education){
            row <- row %>% dplyr::filter(.data$Education == edu)
          }

          row <- row %>% dplyr::slice(1)

          if(nrow(row) == 1){
            return(
              row %>%
                dplyr::select(.data$Distribution, .data$est_1, .data$est_2) %>%
                dplyr::mutate(source = "PCD")
            )
          }
        }
      }else if(level == "CMA"){
        if(!is.na(cma_code)){
          row <- level_dfs$CMA %>%
            dplyr::filter(.data$CMA == cma_code,
                          .data$PwMode_label == modo)
          if(use_education){
            row <- row %>%
              dplyr::filter(.data$Education == edu)
          }

          row <- row %>%
            dplyr::slice(1)

          if(nrow(row)==1){
            return(
              row %>%
                dplyr::select(.data$Distribution, .data$est_1, .data$est_2) %>%
                dplyr::mutate(source = "CMA")
            )
          }
        }
      }else if(level == "PR"){
        if(!is.na(pr_code) && !is.na(cmacat)){
          row <- level_dfs$PR %>%
            dplyr::filter(.data$PR == pr_code,
                          .data$CMACATEG == cmacat,
                          .data$PwMode_label == modo)
          if(use_education){
            row <- row %>% dplyr::filter(.data$Education == edu)
          }

          row <- row %>% dplyr::slice(1)

          if(nrow(row) == 1){
            return(
              row %>%
                dplyr::select(.data$Distribution, .data$est_1, .data$est_2) %>%
                dplyr::mutate(source = "PR")
            )
          }
        }
      }
    }

    if(use_education){
      warning("No impedance function found for transportation mode '", modo,
              "' and education level '", edu,
              "' for location ", code, " (type: ", type, "). Returning NA.")
    }else{
      warning("No impedance function found for transportation mode '", modo,
              "' for location ", code, " (type: ", type, "). Returning NA.")
    }

    return(
      data.frame(Distribution = NA_character_,
                 est_1 = NA_real_,
                 est_2 = NA_real_,
                 source = "missing",
                 stringsAsFactors = FALSE))
    }

  results <- list()
  idx <- 1

  if(use_education){
    for(modo in search_modes){
      for(edu in edu_levels){
        pars <- fetch_pair(modo, edu)
        results[[idx]] <- data.frame(code = code,
                                     type = type,
                                     PwMode_label = modo,
                                     Education = edu,
                                     pars, row.names = NULL, stringsAsFactors=FALSE)
        idx <- idx + 1
      }
    }
  }else{
    for(modo in search_modes){
      pars <- fetch_pair(modo, NA_character_)
      results[[idx]] <- data.frame(code = code,
                                   type = type,
                                   PwMode_label = modo,
                                   Education = "All levels of education",
                                   pars, row.names = NULL, stringsAsFactors=FALSE)
      idx <- idx+1
      }
  }

  dplyr::bind_rows(results)

}

#' Generate impedance values
#'
#' This function calculate the impedance (`f`) related to a travel cost (usually duration)
#' by applying probability density functions (PDF).
#'
#' @param df A data frame containing columns for travel cost, distribution name,
#' and two parameters.
#' @param travel_cost_col Name of the column with the travel costs (numeric).
#'   Default `"travel_time"`.
#' @param distribution_col Name of the column with the distribution name.
#'   Default `"distribution"`.
#' @param est1_col Name of the column for the first distribution parameter. Default `"est_1"`.
#' @param est2_col Name of the column for the second distribution parameter. Default `"est_2"`.
#' @param output_col Name of the new column to store impedance values.
#'   Default `"f"`.
#'
#' @return The input data frame with an additional column (`output_col`)
#'   containing the impedance values.
#' @export
#'
#' @importFrom dplyr group_by across all_of group_map bind_rows
#' @importFrom rlang sym
#' @importFrom scales rescale
#'
#' @examples
#' \dontrun{
#' df <- data.frame(Distribution = c("lnorm", "lnorm", "gamma"),
#'   Est_1 = c(0.5, 0.5, 1.2),
#'   Est_2 = c(0.8, 0.8, 0.3),
#'   travel_time = c(1, 5, 10))
#'
#' df_with_impedance <- generate_impedance(df, travel_cost_col = travel_time,
#'                                         distribution_col = Distribution,
#'                                         est1_col = Est_1, est2_col = Est_2)
#' }
generate_impedance <- function(df, travel_cost_col = "travel_cost",
                               distribution_col = "distribution",
                               est1_col = "est_1", est2_col = "est_2",
                               output_col = "f"){

  required <- c(travel_cost_col, distribution_col, est1_col, est2_col)

  if(!all(required %in% names(df))){
    stop("Missing column(s): ",
         paste(setdiff(required, names(df)), collapse = ", "))
  }

  normalize_dist <- function(x){
    x <- tolower(trimws(x))
    x <- gsub("[-_ ]", "", x) #remove hyphens, underscores, spaces
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

  df_grouped <- df %>%
    dplyr::group_by(
      dplyr::across(dplyr::all_of(c(distribution_col, est1_col, est2_col))))

  group_results <- df_grouped %>%
    dplyr::group_map(~ {
      dist_raw <- .y[[distribution_col]][1]
      a <- as.numeric(.y[[est1_col]][1])
      b <- as.numeric(.y[[est2_col]][1])
      dist <- normalize_dist(dist_raw)

      t_vals <- .x[[travel_cost_col]]

      f_vals <- switch(dist,
                       lnorm = dlnorm(t_vals, meanlog = a, sdlog = b),
                       gamma = dgamma(t_vals, shape = a, rate = b),
                       norm = dnorm(t_vals, mean = a, sd = b),
                       exp = rescale(dexp(t_vals, rate = a)),
                       unif = dunif(t_vals, min = a, max = b),
                       stop("Distribution not included in our function: ", dist, call. = FALSE))

      .x[[output_col]] <- f_vals
      .x
    })

  dplyr::bind_rows(group_results)
}

#' Calculate spatial availability
#'
#' This function calculates the spatial availability of opportunities (jobs, services, etc.)
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
#'   `sum_pa`, `f_t`, and `SA_ij` - the final spatial availability).
#' @export
#'
#' @references
#' This function is based on the studies of Soukhov et al. (2023) and Soukhov et al. (2024).
#'
#'  Soukhov, A., Paez, A., Higgins, C. D., & Mohamed, M. (2023). Introducing spatial availability, a singly-constrained measure of competitive accessibility. PLoS One, 18(1), e0278468.
#'  Soukhov, A., Tarrino-Ortiz, J., Soria-Lara, J. A., & Paez, A. (2024). Multimodal spatial availability: A singly-constrained measure of accessibility considering multiple modes. Plos one, 19(2), e0299077.
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

#' Calculate matching spatial availability
#'
#' This function extends the spatial availability measure by allowing only eligible
#' population segments to compete for each opportunity type. For each opportunity
#' type \eqn{t}, the total eligible population \eqn{q} is used as the denominator, and
#' the impedance factor is normalized using only the impedance values of eligible
#' groups.
#'
#'
#' @param df A data frame containing origin, destination, population, opportunity,
#'   mode, population segment, opportunity type, and impedance columns.
#' @param origin Unquoted column name identifying the origin zone (e.g., `PRCDDA`, `CTUID`).
#' @param destination Unquoted column name identifying the destination zone (e.g., `PWDA`).
#' @param pop Unquoted column name for the population (or labour force) at each origin,
#'   categorized by mode and population segment.
#' @param opp Unquoted column name for the opportunities (e.g., jobs) at each destination,
#'   categorized by opportunity type.
#' @param mode Unquoted column name for the travel mode (used only for grouping).
#' @param pop_segment Unquoted column name for the population segment (e.g., education level)
#'   that determines eligibility.
#' @param opp_type Unquoted column name for the opportunity type (e.g., TEER category)
#'   that determines which population segments are eligible.
#' @param f Unquoted column name containing the impedance value (e.g., from a decay function
#'   calibrated per mode and population segment).
#'
#' @return The input data frame with additional columns:
#'   \item{sum_pop}{Total eligible population for each opportunity type.}
#'   \item{f_p}{Population factor.}
#'   \item{sum_impedance}{Sum of impedances for each destination and opportunity type.}
#'   \item{f_c}{Impedance factor.}
#'   \item{sum_pa}{Sum of population factor multiplied by impedance factor.}
#'   \item{f_t}{Balancing factor.}
#'   \item{SA_ij}{Matching spatial availability for the row (origin-destination-mode-segment-type).}
#'
#' @export
#'
#' @importFrom dplyr distinct summarise group_by summarise ungroup left_join mutate pull
#' @importFrom rlang enquo as_name sym
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{
#' # Assuming a data frame `trips` with columns:
#' # origin_id, destination_id, mode, edu_level, teer, pop, jobs, f
#' result <- matching_spatial_availability(df = trips,
#'   origin = origin_id,
#'   destination = destination_id,
#'   pop = pop,
#'   opp = jobs,
#'   mode = mode,
#'   pop_segment = edu_level,
#'   opp_type = teer,
#'   f = f
#' )
#' head(result$SA_ij)
#' }
matching_spatial_availability <- function(df, origin, destination,
                                          pop, opp, mode,
                                          pop_segment, opp_type, f){
  origin <- rlang::enquo(origin)
  destination <- rlang::enquo(destination)
  pop <- rlang::enquo(pop)
  opp <- rlang::enquo(opp)
  mode <- rlang::enquo(mode)
  pop_segment <- rlang::enquo(pop_segment)
  opp_type <- rlang::enquo(opp_type)
  f <- rlang::enquo(f)

  # sum_pop per opp_type: total eligible population (across all matched segments/modes/origins) competing for that opp_type
  sum_pop <- df %>%
    dplyr::distinct(!!origin, !!mode, !!pop_segment, !!opp_type, .keep_all = TRUE) %>%
    dplyr::group_by(!!opp_type) %>%
    dplyr::summarise(sum_pop = sum(!!pop, na.rm = TRUE)) %>%
    dplyr::ungroup()

  df <- df %>%
    dplyr::left_join(sum_pop, by = rlang::as_name(opp_type))

  # f_p: population factor, within matched segments for that opp_type
  df$f_p <-
    dplyr::pull(df, !!pop) / df$sum_pop

  # sum_impedance per (destination, opp_type)
  sum_impedance <- df %>%
    dplyr::group_by(!!destination, !!opp_type) %>%
    dplyr::summarise(sum_impedance = sum(!!f)) %>%
    dplyr::ungroup()

  df <- df %>%
    dplyr::left_join(sum_impedance,
                     by = c(rlang::as_name(destination), rlang::as_name(opp_type)))

  # f_c: impedance factor, within matched segments for that opp_type
  df$f_c <- dplyr::pull(df, !!f) / df$sum_impedance

  # sum_pa per (destination, opp_type): normalizing constant
  sum_pa <- df %>%
    dplyr::group_by(!!destination, !!opp_type) %>%
    dplyr::summarise(sum_pa = sum(f_p * f_c)) %>%
    dplyr::ungroup()

  df <- df %>%
    dplyr::left_join(sum_pa,
                     by = c(rlang::as_name(destination), rlang::as_name(opp_type)))

  # f_t: balancing factor
  df$f_t <- (df$f_p * df$f_c)/df$sum_pa

  df <- df %>%
    dplyr::mutate(SA_ij = !!opp*f_t)
}

#' Calculate a spatial filter
#'
#' This function builds a spatial filter by iteratively adding
#' eigenvectors to a linear model. Only eigenvectors with a p-value below a
#' threshold are retained and cumulatively added to the filter (default <= 0.05).
#' The function can optionally divide the data by one or more categorical variables
#' (e.g., mode, education level) and calculate separate filters for each subset.
#' The result is a single data frame containing the identifier, the response
#' variable, the computed filter, and the grouping columns (if any).
#'
#' @param spatial_data_frame A data frame containing the spatial variable (`response`)
#'   and the identifier (join key). Must contain a column named by `response` and a
#'   column matching `by` (or the left side of `by` if it is named).
#' @param matrix_eigv A data frame containing the eigenvectors (columns
#'   starting with `ev_prefix`) and an identifier (join key) matching the right side of `by`.
#' @param by A character string or a named character vector of length 1
#'   specifying the join key(s). If a single string, it is used as the
#'   column name in both tables. If named (e.g. `c("ID" = "CTUID")`),
#'   the name is the column in `spatial_data_frame` and the value is the
#'   column in `matrix_eigv`. Default: `"ID"`.
#' @param group_vars Optional character vector naming columns in
#'   `spatial_data_frame` by which to divide the data before computing
#'   the filter. For each unique combination of these variables, a
#'   separate filter is built. If `NULL` (default), a single filter is
#'   computed for all rows.
#' @param response Character string naming the response (e.g., `y`, dependent)
#'   variable in `spatial_data_frame`. Default: `"access"`.
#' @param ev_prefix Character string giving the prefix of the eigenvector
#'   columns in `matrix_eigv`. Default: `"EV"`.
#' @param threshold Numeric p-value threshold for including an eigenvector
#'   in the filter (two-sided test). Default: `0.05`.
#'
#' @return A data frame with the following columns:
#'   \itemize{
#'     \item the identifier column (named as in `by` or its left side)
#'     \item the response variable (named `response`)
#'     \item the spatial filter, named `Sf_<response>`
#'     \item any grouping columns specified in `group_vars` (if provided)
#'   }
#'   The rows are in the same order as the original `spatial_data_frame`.
#'
#' @details The function performs a forward selection procedure:
#'   \enumerate{
#'     \item Join `spatial_data_frame` with `matrix_eigv` on the specified key.
#'     \item Initialize `Sf = 0` and `x = 1`.
#'     \item For each eigenvector (in the order they appear in the joined
#'           data), fit the model \code{response ~ x + Sf + EV_i}.
#'     \item If the coefficient of `EV_i` has a p-value < `threshold`,
#'           add `coef(EV_i) * EV_i` to `Sf`.
#'     \item Return a data frame with only the ID, response, filter, and groups.
#'   }
#'   The same procedure is applied independently to each group defined by
#'   `group_vars`, and the results are row-bound into a single data frame.
#'
#' @references
#' This function is based on the study of Le Gallo, J., & Paez, A. (2013).
#'
#' Le Gallo, J., & Paez, A. (2013). \emph{Using synthetic variables in
#' instrumental variable estimation of spatial series models.}.
#' *Environment and Planning A*, *45*(9), 2227-2242.
#' \doi{10.1068/a45443}
#'
#' @note The eigenvectors are assumed to have been pre-computed (e.g., from a
#'   spatial weights matrix).
#'
#' @importFrom dplyr %>% left_join group_by across all_of group_split group_keys mutate bind_rows pull
#' @importFrom stats lm as.formula
#' @export
#'
#' @examples
#' \dontrun{
#' # Single group (no splitting)
#' result_df <- calculate_spatial_filter(spatial_data_frame = my_access,
#'   matrix_eigv = eigen_matrix)
#'
#' # Split by transportation mode (column "PwMode")
#' result_by_mode <- calculate_spatial_filter(spatial_data_frame = SA_mode,
#'   matrix_eigv = matrix_eigv,
#'   by = "PRCDDA",
#'   group_vars = "PwMode",
#'   response = "SA_im")
#'
#' # Split by combination of education and mode
#' result_by_edu_mode <- calculate_spatial_filter(spatial_data_frame = my_data,
#'   matrix_eigv = eigen_matrix,
#'   by = c("CTUID" = "ID"),
#'   group_vars = c("Education", "Mode"),
#'   response = "SA_i",
#'   ev_prefix = "EIG",
#'   threshold = 0.10)
#' }
calculate_spatial_filter <- function(spatial_data_frame,
                                   matrix_eigv,
                                   by = "ID",
                                   group_vars = NULL,
                                   response = "access",
                                   ev_prefix = "EV",
                                   threshold = 0.05){

  if(!response %in% colnames(spatial_data_frame)){
    stop("Dependent variable '", response, "' is not in spatial_data_frame")
  }

  if(is.character(by) && length(by) == 1 && !is.null(names(by))){
    left_key <- names(by)[1]
    right_key <- by[1]
  }else if(is.character(by) && length(by) == 1){
    left_key <- right_key <- by
  }else{
    stop("'by' must be a single character string (e.g., `KEY`) or a named character vector of length 1 (e.g., `c(CTUID = ID)`)")
  }

  if(!left_key %in% colnames(spatial_data_frame)){
    stop("Key '", left_key, "' is not in spatial_data_frame")
  }
  if(!right_key %in% colnames(matrix_eigv)){
    stop("Key '", right_key, "' is not in matrix_eigv")
  }

  ev_cols <- grep(paste0("^", ev_prefix), colnames(matrix_eigv), value = TRUE)
  if(length(ev_cols) == 0){
    stop("No columns starting with '", ev_prefix, "' found in matrix_eigv")
  }

  if(!is.null(group_vars)){
    missing <- group_vars[!group_vars %in% colnames(spatial_data_frame)]
    if(length(missing) > 0){
      stop("group_vars not found in spatial_data_frame: ", paste(missing, collapse = ", "))
    }
  }

  processa_group <- function(data){
    if(left_key != right_key){
      y <- data %>%
        left_join(matrix_eigv, by = setNames(right_key, left_key)) %>%
        mutate(x = 1, Sf = 0)
    }else{
      y <- data %>%
        left_join(matrix_eigv, by = left_key) %>%
        mutate(x = 1, Sf = 0)
    }

    ev_names <- names(y)[startsWith(names(y), ev_prefix)]

    for (ev_name in ev_names){
      formula <- as.formula(paste(response, "~ x + Sf +", ev_name))
      model <- lm(formula, data = y)
      coefs <- summary(model)$coefficients

      if(ev_name %in% rownames(coefs)){
        p_val <- coefs[ev_name, "Pr(>|t|)"]
        b_val <- coefs[ev_name, "Estimate"]

        if(!is.na(p_val) && p_val < threshold){
          y$Sf <- y$Sf + b_val * y[[ev_name]]
        }
      }
    }

    saida <- data %>%
      mutate(!!paste0("Sf_", response) := y$Sf) %>%
      select(all_of(c(left_key, group_vars, response, paste0("Sf_", response))))

    return(saida)
  }

  if(is.null(group_vars)){
    result <- processa_group(spatial_data_frame)
  }else{
    grouped <- spatial_data_frame %>%
      group_by(across(all_of(group_vars))) %>%
      group_split()

    result <- bind_rows(lapply(grouped, processa_group))
  }

  return(result)
}
