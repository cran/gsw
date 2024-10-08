% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_melting_ice_into_seawater}
\alias{gsw_melting_ice_into_seawater}
\title{Calculate properties related to ice melting in seawater}
\usage{
gsw_melting_ice_into_seawater(SA, CT, p, w_Ih, t_Ih)
}
\arguments{
\item{SA}{Absolute Salinity [ g/kg ].  The valid range for most `gsw`
functions is 0 to 42 g/kg.}

\item{CT}{Conservative Temperature [ degC ].}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}

\item{w_Ih}{initial mass fraction (ice) / (water + ice)}

\item{t_Ih}{initial temperature of ice [ degC ]}
}
\value{
a list containing \code{SA_final}, \code{CT_final} and \code{w_Ih_final}.
}
\description{
Calculate properties related to ice melting in seawater
}
\section{Implementation Note}{


This R function uses a wrapper to a C function contained within the GSW-C
system as updated 2022-10-11 at \url{https://github.com/TEOS-10/GSW-C} with
git commit `657216dd4f5ea079b5f0e021a4163e2d26893371`.

The C function uses data from the \code{library/gsw_data_v3_0.mat}
file provided in the GSW-Matlab source code, version 3.06-11.
Unfortunately, this version of the mat file is no longer displayed on the
TEOS-10.org website.  Therefore, in the interests of making GSW-R be
self-contained, a copy was downloaded from
\url{http://www.teos-10.org/software/gsw_matlab_v3_06_11.zip} on 2022-05-25,
the .mat file was stored in the developer/create_data directory of
\url{https://github.com/TEOS-10/GSW-R}, and then the dataset used in GSW-R
was created based on that .mat file.

Please consult \url{http://www.teos-10.org} to learn more about the various
TEOS-10 software systems.
}

\examples{
SA <- c(  34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(   4.7856,  2.4329,  1.8103,  1.2600,  0.6886,  0.4403)
p <- c(        10,      50,     125,     250,     600,    1000)
w_Ih <- c( 0.0560, 0.02513, 0.02159, 0.01210, 0.00943, 0.00751)
t_Ih <- c(-4.7856, -4.4329, -3.8103, -4.2600, -3.8863, -3.4036)
r <- gsw_melting_ice_into_seawater(SA, CT, p, w_Ih, t_Ih)
stopifnot(all.equal(r$SA_final, c(32.767939199999994, 34.014676604999998, 34.269397295999994,
                                  34.425548880000001, 34.409033862000001, 34.471559675999998)))
stopifnot(all.equal(r$CT_final, c(-0.298448911022612, 0.215263001418312, -0.074341719211557,
                                  0.207796293045473, -0.123785388299875, -0.202531182809225)))
stopifnot(all.equal(r$w_Ih_final, rep(0, 6)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_melting_ice_into_seawater.html}
}
