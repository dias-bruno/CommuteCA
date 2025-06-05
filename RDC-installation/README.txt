# README: Installing the CommuteCA R Package in RDC Offices

This README provides instructions on how to install the CommuteCA R package and its required libraries in a Research Data Centre (RDC) environment. Most RDC offices do not have internet access, making it impossible to install R packages directly from CRAN or other repositories. To address this, we have created two scripts that help researchers install CommuteCA and all its dependencies offline.

- Requirements: To use CommuteCA within an RDC, the following are required:
	-    R and RStudio must be installed on RDC computers.
	-    You must have permission to access the 2021 Census of Population master data files.

Note that installation procedures may vary across RDC offices. At McMaster RDC, where CommuteCA was developed, the process for installing R packages involves:
	-    The researcher emailing the RDC analyst with the R package(s) attached.
	-    Upon approval, the analyst places the package(s) in the researcher’s personal RDC folder.

# Installation Procedure
To streamline the installation process, we have created a project folder called `RDC_CommuteCA_Project` You can download it here: https://mcmasteru365-my.sharepoint.com/:f:/g/personal/dossanb_mcmaster_ca/EoCHX-N5WFVCh4z61N5vRgMBlJii0sGsVBpDuXrABNqzFQ?e=xAkWwD

- Folder Structure
The `RDC_CommuteCA_Project.Rproj` contains the following:
	-	packages-to-install/: Stores all required R packages for the analysis.
	-   data-raw/: Contains two R files. Inside data-raw/, there are two folders named `input`, to include input files, and `output`, to save files

Two key scripts are located in data-raw/:
-    01_downloading_packages.R: Downloads all necessary packages.
-    02_installing_r_packages.R: Installs the downloaded packages within the RDC.

# Step-by-Step Instructions
	
	On a *computer with internet access and R/RStudio installed*:

        Download and unzip the RDC_CommuteCA_Project.
        Open the RDC_CommuteCA_Project.Rproj file.
        Navigate to the data-raw/ folder.
        Open and run the 01_downloading_packages.R script to download the required packages.

    Zip the entire project folder and send it to your RDC analyst, requesting that it be added to your personal RDC folder.

    Once approved and placed in your RDC folder:
        Unzip the folder in your RDC workspace.
        Open the R project in RStudio.
        Navigate to data-raw/ and run the 02_installing_r_packages.R script to install the packages.

    After installation:
        Restart RStudio.
        Go to `File > New File > R Markdown > From Template`.

        Select the desired CommuteCA R Markdown template to begin your analysis.