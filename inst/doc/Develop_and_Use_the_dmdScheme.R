## ----setup, include = FALSE---------------------------------------------------
library(knitr)

knitr::opts_chunk$set(
	echo = TRUE,
	eval = TRUE,
  	collapse = TRUE,
	message = TRUE,
  	comment = "#>",
  	# tidy.opts = list(width.cutoff=60),
  	# tidy = TRUE,
  	linewidth = 60
)
library(dmdScheme)
library(here)
library(kableExtra)

## This is from here https://groups.google.com/forum/#!topic/knitr/WnxJfORwCTk

# hook_output = knitr::knit_hooks$get('output')
# knitr::knit_hooks$set(output = function(x, options) {
#   # this hook is used only when the linewidth option is not NULL
#   if (!is.null(n <- options$linewidth)) {
#     x = knitr:::split_lines(x)
#     # any lines wider than n should be wrapped
#     if (any(nchar(x) > n)) x = strwrap(x, width = n)
#     x = paste(x, collapse = '\n')
#   }
#   hook_output(x, options)
# })


## ----fig1, echo = FALSE, fig.show = "hold", out.width = "33%", fig.align = "default", fig.cap = "**Figure 1**: Workflow of using `dmdScheme` (A) via the web app, (B) via the app locally, (C) via the R prompt. Square boxes indicate steps which are not common to all three, rounded boxes indicate steps identical to the different ways, although how they are executed can differ."----
knitr::include_graphics("./figs/workflow_enterMetaData_app_online.png", auto_pdf = TRUE)
knitr::include_graphics("./figs/workflow_enterMetaData_app_local.png", auto_pdf = TRUE)
knitr::include_graphics("./figs/workflow_enterMetaData_R.png", auto_pdf = TRUE)

## ----fig2, fig.show = "hold", out.width = "40%", fig.align = "center", fig.cap = "**Figure 2**: Screenshot of the dmdScheme app.", echo = FALSE----
knitr::include_graphics("./figs/app.jpg", auto_pdf = TRUE)

## ----fig3, fig.show = "hold", out.width = "90%", fig.align = "center", fig.cap = "**Figure 3**: Some example tabs from the `emeScheme` spreadsheet. The first to contains bibliometric metadata modelled along the requirements by DataCite and the authors in the second tab. The third one contains metadata about the Species used in the experiment. The complete spreadsheet can be found in the supplemental material `emeScheme.xlsx`.", echo = FALSE----
knitr::include_graphics("./figs/Spreadsheet_01_MdBibliometric.jpg", auto_pdf = TRUE)
knitr::include_graphics("./figs/Spreadsheet_02_MdAuthor.jpg", auto_pdf = TRUE)
# knitr::include_graphics("./figs/Spreadsheet_03_Experiment.jpg", auto_pdf = TRUE)
knitr::include_graphics("./figs/Spreadsheet_04_Genus.jpg", auto_pdf = TRUE)
# knitr::include_graphics("./figs/Spreadsheet_08_DataFileMetadata.jpg", auto_pdf = TRUE)

## ----fig4, fig.show = "hold", out.width = "90%", fig.align = "center", fig.cap = "**Figure 4**: Example validation report, as cfrom the validation included in the `emeScheme` package [@Krug2019b].", echo = FALSE----
knitr::include_graphics("./figs/ValidationReport.jpg", auto_pdf = TRUE)

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
scheme_repo()

## -----------------------------------------------------------------------------
scheme_list_in_repo()

## -----------------------------------------------------------------------------
scheme_download(name = "emeScheme", version = "0.9.5", destfile = tempfile())

## -----------------------------------------------------------------------------
scheme_install(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_install_r_package(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_list()

## -----------------------------------------------------------------------------
scheme_use(name = "emeScheme", version = "0.9.5")

## -----------------------------------------------------------------------------
scheme_active()
scheme_use(name = "dmdScheme", version = "0.9.9")
scheme_active()

## -----------------------------------------------------------------------------
scheme_path_index_template()

## -----------------------------------------------------------------------------
scheme_path_xlsx()

## -----------------------------------------------------------------------------
scheme_path_xml()

## -----------------------------------------------------------------------------
scheme_uninstall(name = "emeScheme", version = "0.9.5")


## -----------------------------------------------------------------------------
scheme_installed(name = "emeScheme", version = "0.9.5")

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

## ----eval = FALSE-------------------------------------------------------------
#  scheme_make( "TheFile.xlsx" )

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  scheme_install(file = "NAME_VERSION.tar.gz")
#  scheme_use("NAME", "VERSION")

## ----fig5, fig.show = "hold", out.width = "50%", fig.align = "center", fig.cap = "**Figure 5**: Create a new domain specific scheme based on dmdScheme.", echo = FALSE----
knitr::include_graphics("./figs/workflow_newScheme.png", auto_pdf = TRUE)

