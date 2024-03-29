% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scaffold.R
\name{scaffold}
\alias{scaffold}
\title{Scaffold Leprechaun}
\usage{
scaffold(
  ui = c("navbarPage", "fluidPage"),
  bs_version = bootstrap_version(),
  overwrite = FALSE
)
}
\arguments{
\item{ui}{Type of UI to use.}

\item{bs_version}{Bootstrap version to use.
If shiny > 1.6 is installed defaults to version 5,
otherwise version 4.}

\item{overwrite}{Whether to force overwrite all files.
This is not recommended, make sure you have save and/or
committed and checked that the files that will be overwritten
can be before proceeding with this option.}
}
\value{
Invisibly return \code{NULL}, called for side-effects.
}
\description{
Scaffolds a leprechaun project.
This must be run from within a package
and should only be run once per project.
}
\examples{
\dontrun{scaffold()}

}
