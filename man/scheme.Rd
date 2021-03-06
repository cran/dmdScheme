% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scheme_active.R, R/scheme_default.R,
%   R/scheme_download.R, R/scheme_install.R, R/scheme_install_r_package.R,
%   R/scheme_installed.R, R/scheme_list.R, R/scheme_list_in_repo.R,
%   R/scheme_repo.R, R/scheme_uninstall.R, R/scheme_use.R
\name{scheme_active}
\alias{scheme_active}
\alias{scheme_default}
\alias{scheme_download}
\alias{scheme_install}
\alias{scheme_install_r_package}
\alias{scheme_installed}
\alias{scheme_list}
\alias{scheme_list_in_repo}
\alias{scheme_repo}
\alias{scheme_uninstall}
\alias{scheme_use}
\title{Functions to manage schemes}
\usage{
scheme_active()

scheme_default(name = NULL, version = NULL)

scheme_download(
  name,
  version,
  destfile = NULL,
  overwrite = FALSE,
  baseurl = scheme_repo(),
  ...
)

scheme_install(
  name,
  version,
  repo = scheme_repo(),
  file = NULL,
  overwrite = FALSE,
  install_package = FALSE
)

scheme_install_r_package(name, version, reinstall = FALSE)

scheme_installed(name, version)

scheme_list()

scheme_list_in_repo(baseurl = scheme_repo(), ...)

scheme_repo(repo = NULL)

scheme_uninstall(name = NULL, version = NULL)

scheme_use(name = NULL, version = NULL)
}
\arguments{
\item{name}{a \code{character} string containing the name of the scheme
definition}

\item{version}{a \code{character} string containing the version of the scheme
definition}

\item{destfile}{a \code{character} string containing the name of the
downloaded scheme definition. If \code{NULL}, a temporary file will be used.}

\item{overwrite}{if \code{TRUE}, the scheme will be overwritten if it exists}

\item{baseurl}{a \code{character} string containing the base url of the
repository in which the scheme definitions are located.}

\item{...}{additional parameter for the function \code{download.file}.}

\item{repo}{repo of the schemes.}

\item{file}{if give, this file will be used as the local scheme definition,
and \code{repo} will be ignored}

\item{install_package}{if \code{TRUE}, install / update the accompanying R
package. You can do it manually later by running
\code{scheme_install_r_package("NAME", "VERSION")}.}

\item{reinstall}{if \code{TRUE}, the R package will be uninstalled before
installing it.}
}
\value{
\code{data.frame} with two columns containing name and version of the default scheme

\code{data.frame} with two columns containing name and version of the default scheme

invisibly the value of \code{destfile}

invisibly \code{NULL}

invisibly \code{NULL}

\code{TRUE} if the theme is installed, \code{FALSE} if not

\code{data.frame} with two columns containing name and version of the intalled schemes

Returns the info about the scheme definitions in this repo as a \code{list}.

URL of the repo toi be used. If not set previously, the default repo
  at \url{https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository/} is
  used.

invisibly returns the temporary location where the scheme definition
  is moved to.
}
\description{
\bold{\code{scheme_active()}:} Shows the name and version of the active scheme.

\bold{\code{scheme_default()}:} Shows the name of the default scheme which
comes with the package and can not be deleted. If \code{name}and
\code{version} is specified, the default scheme to be used will be set.
\bold{There is no need to do this only internally!}. Otherwise, the scheme
repository used is only returned.

\bold{\code{scheme_download()}:} Scheme definitions can be stored in an online repo. The default is a github
repo at \url{https://github.com/Exp-Micro-Ecol-Hub/dmdSchemeRepository}. This
function dowloads a scheme definition, specified by \code{name} and
\code{version}, and saves it locally under the name \code{destfile}

\bold{\code{scheme_install()}:} Installed schemes are copied to
\code{cache("installedSchemes")} and , if necessary, an \code{.xlsx}
definition is saved in addition. These can be listed by using
\link{scheme_list}.

\bold{\code{scheme_install_r_package()}:} Install R package for scheme
\code{name} \code{version} definition using the script
\code{install_R_package.R} in the scheme package.

\bold{\code{scheme_installed()}:} Checks if a scheme is installed

\bold{\code{scheme_list()}:} Lists all definitions for schemes which are installed. Each follows the
pattern \code{SCHEMENAME_SCHEMEVERSION.EXT}. All files with the same basename
but different extensions represent different representations of the same
scheme definition and are effectively equivalent, only that the tab
Documentation can only be found in the \code{.xls} files.

\bold{\code{scheme_list_in_repo()}:} Scheme definitions can be stored in an online repo.

\bold{\code{scheme_repo()}:} Get or set scheme repository. If \code{repo} is specified, the scheme
repository to be used is set. Otherwise, the scheme repository used is only
returned.

\bold{\code{scheme_uninstall()}:} Installed schemes are deleted from
\code{cache("installedSchemes")} and moved to a temporary folder which is
rteturned invisibly.

\bold{\code{scheme_use()}:} Switch from the current scheme to a new scheme as defined in the scheme
\code{schemeDefinition}. Installed schemes can be listed by using \code{scheme_list()}.
New schemes can be added to the library via a call to \code{scheme_add()}.
The name of the active scheme is saved in \code{dmdScheme_active}
}
\examples{
scheme_active()

scheme_default()

scheme_download(
  name = "dmdScheme",
  version = "0.9.5"
)
\dontrun{
scheme_install("path/to/definition.xml")
scheme_install("path/to/definition.xlsx")
}

\dontrun{
scheme_install_r_package()
}

\dontrun{
scheme_installed("dmdScheme", "0.9.9")
scheme_installed("dmdScheme", "0.7.3")
}
scheme_list_in_repo()

# returns the repo used:
scheme_repo()
\dontrun{
scheme_uninstall(name = "schemename", version = "schemeversion")
}

scheme_list()
scheme_use(name = "dmdScheme", version = "0.9.9")

}
