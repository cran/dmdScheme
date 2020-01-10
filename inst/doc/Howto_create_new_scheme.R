## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  open_new_spreadsheet(keepData = TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  scheme_make( "TheFile.xlsx" )

## ----eval = FALSE, echo = TRUE------------------------------------------------
#  scheme_install(file = "NAME_VERSION.tar.gz")
#  scheme_use("NAME", "VERSION")

## ----eval = TRUE, echo = TRUE-------------------------------------------------
if (!scheme_installed("emeScheme", "0.9.5")) {
  scheme_install("emeScheme", "0.9.5")
}
scheme_use("emeScheme", "0.9.5")

make_new_package( path = tempdir() )

scheme_use("dmdScheme", "0.9.5")
scheme_uninstall("emeScheme", "0.9.5")

