% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_geo_strf_dyn_height_1}
\alias{gsw_geo_strf_dyn_height_1}
\title{Geostrophic Dynamic Height Anomaly (provisional version)}
\usage{
gsw_geo_strf_dyn_height_1(SA, CT, p, p_ref = 0, max_dp = 1, interp_method = 2)
}
\arguments{
\item{SA}{Absolute Salinity [ g/kg ].  The valid range for most `gsw`
functions is 0 to 42 g/kg.}

\item{CT}{Conservative Temperature [ degC ].}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}

\item{p_ref}{reference pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}

\item{max_dp}{numeric value indicating the maximum tolerated pressure
separation between levels. If any pressure step exceeds \code{max_dp}, then
a uniform grid is constructed with \code{max_dp} as the interval.}

\item{interp_method}{integer specifying interpolation scheme (1 for linear, 2 for pchip)}
}
\value{
A vector containing geopotential anomaly in
\eqn{m^2/s^2}{m^2/s^2} for each level. For more on the units, see [2].
}
\description{
This calculates a geopotential anomaly, called either the
dynamic height anomaly or the geostrophic streamfunction
in the TEOS-10 document listed as [1] below.

To get the column-integrated value in meters, take the first
value of the returned vector and divide by
9.7963\eqn{m/s^2}{m/s^2}. Note that this yields an integral
with the top measured pressure (not zero) as an upper limit.
}
\details{
Because of the scheme used in the underlying C code, the
pressures must be in order, and must not have any repeats.
Also, there must be at least 4 pressure values. Violating
any of these restrictions yields an error.

If \code{p_ref} exceeds the largest \code{p} value, a vector
of zeros is returned, in accordance with the underlying C code.
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
SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
p_ref <- 1000
dh <- gsw_geo_strf_dyn_height_1(SA, CT, p, p_ref, 1, 2)
## FIXME: The following test values fail.
## all.equal(dh, c(17.039204557769487, 14.665853784722286, 10.912861136923812,
##                 7.567928838774945, 3.393524055565328, 0))
}
\references{
1. \url{http://www.teos-10.org/pubs/gsw/html/gsw_geo_strf_dyn_height.html}

2. Talley et al., 2011. Descriptive Physical Oceanography, Edition 6, Elsevier.
}
