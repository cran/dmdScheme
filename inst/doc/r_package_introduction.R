## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
	echo = TRUE,
	eval = TRUE,
  collapse = TRUE,
	message = TRUE,
  comment = "#>"
)
library(dmdScheme)
library(here)
# library(magrittr)
# library(dplyr)
# library(knitr)
library(kableExtra)
#


## ----echo = TRUE, eval = FALSE------------------------------------------------
#  install.packages("dmdScheme")

## ----echo=TRUE, eval = FALSE--------------------------------------------------
#  ## install the devtools package if not installed yet
#  # install.packages("devtools")
#  
#  devtools::install_github("Exp-Micro-Ecol-Hub/dmdScheme", ref = "master", build_opts = NULL)

## ----echo=TRUE, eval = FALSE--------------------------------------------------
#  ## install the devtools package if not installed yet
#  # install.packages("devtools")
#  
#  devtools::install_github("Exp-Micro-Ecol-Hub/dmdScheme", ref = "dev", build_opts = NULL)

## ----echo=TRUE, eval = FALSE--------------------------------------------------
#  cache(createPermanent = TRUE)

## -----------------------------------------------------------------------------
scheme_default()

## -----------------------------------------------------------------------------
scheme_list_in_repo()

## -----------------------------------------------------------------------------
scheme_install(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_list()

## -----------------------------------------------------------------------------
scheme_use(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_active()
scheme_use(name = "dmdScheme", version = "0.9.5")
scheme_active()

## -----------------------------------------------------------------------------
scheme_uninstall(name = "emeScheme", version = "0.9.5")


## -----------------------------------------------------------------------------
scheme_installed(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_path_xlsx()

## -----------------------------------------------------------------------------
scheme_path_xml()

## ----eval = FALSE-------------------------------------------------------------
#  open_new_spreadsheet()

## -----------------------------------------------------------------------------
x <- read_excel(
      file = scheme_path_xlsx(),
      verbose = TRUE
)

## -----------------------------------------------------------------------------
print(
  x,
  printAttr = FALSE,
  printExtAttr = FALSE,
  printData = FALSE
)

## -----------------------------------------------------------------------------
print(
  x,
  printAttr = TRUE,
  printExtAttr = FALSE,
  printData = FALSE
)

## -----------------------------------------------------------------------------
print(
  x,
  printAttr = TRUE,
  printExtAttr = TRUE,
  printData = FALSE
)

## -----------------------------------------------------------------------------
print(
  x,
  printAttr = TRUE,
  printExtAttr = TRUE,
  printData = TRUE
)

## -----------------------------------------------------------------------------
validate( scheme_path_xlsx() )


## ----eval = FALSE-------------------------------------------------------------
#  report( scheme_path_xlsx() )

## -----------------------------------------------------------------------------
x <- read_excel( scheme_path_xlsx() )
xml <- as_xml( x, file = xmlFile)
xml

## -----------------------------------------------------------------------------
xmlFile <-  tempfile(fileext = ".xml")

xml2::write_xml(x = xml, file = xmlFile)

## -----------------------------------------------------------------------------
xmlFile <-  tempfile(fileext = ".xml")

write_xml( x = x, file = xmlFile )

## -----------------------------------------------------------------------------
x <- read_xml( xmlFile )
x

