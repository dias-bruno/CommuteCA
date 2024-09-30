#' @keywords internal
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL

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
#' @docType data
#' @name CommuteCA-package
#' @author Bruno Dos Santos, School of Earth, Environment and Society, McMaster University \email{dossanb@@mcmaster.ca}
#' @author Antonio Paez, School of Earth, Environment and Society, McMaster University \email{paezha@@mcmaster.ca}
#' @references \url{https://github.com/dias-bruno/CommuteCA}
NULL

##############################################
##                DATA SETS                 ##
##############################################

#' Dissemination areas (DA) boundaries and associated data (2021).
#'
#' This object contains the dissemination areas (DA) for all Canadian provinces and territories (2021).
#'
#' @format A simple feature class (sf) polygon object containing 57,932 rows and 8 variables; each row represents a unique dissemination area (DA) with associated geo-referenced geometry. A dissemination area (DA) is a small, relatively stable geographic unit composed of one or more adjacent dissemination blocks. It is the smallest standard geographic area for which all census data are disseminated. DAs cover all Canada.
#'   \describe{
#'   \item{DAUID}{Uniquely identifies a dissemination area (composed of the 2-digit province/territory unique identifier followed by the 2-digit census division code and the 4-digit dissemination area code).}
#'   \item{DGUID}{Dissemination Geography Unique Identifier.}
#'   \item{LANDAREA}{Land area of geographic area, in square kilometres (km2)}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{PCD}{Uniquely identifies the census division.}
#'   \item{CMAUID}{Uniquely identifies the census metropolitan area or census agglomeration (if any).}
#'   \item{CMANAME}{Name of the the census metropolitan area or census agglomeration (if any).}
#'   \item{geometry}{The sfc polygon geometry (cartographic boundaries).}
#'}
#' @docType data
#' @keywords dissemination areas
#' @name dissemination_areas_ca21
#' @usage data(dissemination_areas_ca21)
#' @source "The 2021 census dissemination areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"dissemination_areas_ca21"

#' Census divisions (CD) boundaries and associated data (2021).
#'
#' This object contains the census divisions (CD) for all Canadian provinces and territories (2021).
#'
#' @format A simple feature class (sf) polygon object containing 293 rows and 7 variables; each row represents a unique CD with associated geo-referenced geometry. Group of neighbouring municipalities joined together for the purposes of regional planning and managing common services (such as police or ambulance services). These groupings are established under laws in effect in certain provinces of Canada. Census division (CD) is the general term for provincially legislated areas (such as county, municipalité régionale de comté (MRC) and regional district) or their equivalents. Census divisions are intermediate geographic areas between the province/territory level and the municipality (census subdivision).
#'   \describe{
#'   \item{CDUID}{Uniquely identifies a census division (composed of the 2-digit province or territory unique identifier followed by the 2-digit census division code).}
#'   \item{DGUID}{Dissemination Geography Unique Identifier.}
#'   \item{CDNAME}{Census division name.}
#'   \item{CDTYPE}{Census division type.}
#'   \item{LANDAREA}{Land area of geographic area, in square kilometres (km2)}
#'   \item{PRUID}{Uniquely identifies a province or territory.}
#'   \item{geometry}{The sfc polygon geometry (cartographic boundaries).}
#'}
#' @docType data
#' @keywords census divisions
#' @name census_divisions_ca21
#' @usage data(census_divisions_ca21)
#' @source "The 2021 census dissemination areas files as created by the Canadian Census available [here](https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/index2021-eng.cfm?year=21) accessed May 6th 2024. All variable definitions are based on the definitions included in the census year 2021 boundary file reference guide (Boundary Files, Reference Guide, Second edition, 2021 Census. Statistics Canada Catalogue no. 92-160-G.).
"census_divisions_ca21"

#' Maximum travel times in the Census Division.
#'
#' This object contains the maximum travel times for commuting to work for all Census Divisions (CD) in Canada, obtained from the Census of Population (2021).
#'
#' @format A simple feature class (sf) polygon object containing 1,083 rows and 3 variables; each row represents a combination of CD and transportation mode.
#'   \describe{
#'   \item{PCD}{Uniquely identifies a census division (composed of the 2-digit province or territory unique identifier followed by the 2-digit census division code).}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CD using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census division
#' @name max_travel_times_pcd
#' @usage data(max_travel_times_pcd)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"max_travel_times_pcd"

#' Maximum travel times in the Census Metropolitan Area.
#'
#' This object contains the maximum travel times for commuting to work for all Census Metropolitan Area (CMA) in Canada, obtained from the Census of Population (2021).
#'
#' @format A simple feature class (sf) polygon object containing 596 rows and 3 variables; each row represents a combination of CMA and transportation mode.
#'   \describe{
#'   \item{CMA}{Uniquely identifies a CMA.}
#'   \item{PwMode}{Transportation mode. Possible values: 'Bike', 'Car', 'Transit', and 'Walk.'}
#'   \item{Max_time_value}{Maximum travel time for the CMA using the mentioned transportation mode.}
#'}
#' @docType data
#' @keywords maximum travel time in the census metropolitan area
#' @name max_travel_times_cma
#' @usage data(max_travel_times_cma)
#' @source "[Census of Population 2021](https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/index.cfm?Lang=E) accessed September 11, 2024.
"max_travel_times_cma"
