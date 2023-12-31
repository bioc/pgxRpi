% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pgxCount.R
\name{pgxCount}
\alias{pgxCount}
\title{Count samples in one collation of a given filter}
\usage{
pgxCount(filters = NULL, domain = "http://progenetix.org")
}
\arguments{
\item{filters}{A single or a comma-concatenated list of identifiers such as c("NCIT:C7376","icdom-98353")}

\item{domain}{A string specifying the domain of database. Default is "http://progenetix.org".}
}
\value{
Count of samples in the given filter
}
\description{
This function returns the number of samples for every filter in
Progenetix database.
}
\examples{
pgxCount(filters = "NCIT:C3512")
}
