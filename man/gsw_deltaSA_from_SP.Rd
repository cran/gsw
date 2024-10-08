% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_deltaSA_from_SP}
\alias{gsw_deltaSA_from_SP}
\title{Absolute Salinity Anomaly from Practical Salinity}
\usage{
gsw_deltaSA_from_SP(SP, p, longitude, latitude)
}
\arguments{
\item{SP}{Practical Salinity (PSS-78) [ unitless ]. The valid range for most
`gsw` functions is from 2 to 42.}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}

\item{longitude}{longitude in decimal degrees, positive to the east of Greenwich. (This
is called \code{long} in the TEOS-10 Matlab code.)}

\item{latitude}{latitude in decimal degrees, positive to the north of the equator. (This
is called \code{lat} in the TEOS-10 Matlab code.)}
}
\value{
deltaSA Absolute Salinity Anomaly  [ g/kg ]
}
\description{
Absolute Salinity Anomaly from Practical Salinity
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
SP =   c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p =    c(     10,      50,     125,     250,     600,    1000)
lat =  c(      4,       4,       4,       4,       4,       4)
long = c(    188,     188,     188,     188,     188,     188)
deltaSA = gsw_deltaSA_from_SP(SP,p,long,lat)
stopifnot(all.equal(deltaSA, c(0.000167203365230, 0.000268836122231, 0.000665803155705,
                               0.002706154619403, 0.005652977406832,  0.009444734661606)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_deltaSA_from_SP.html}
}
\seealso{
Other things related to salinity: 
\code{\link{gsw_C_from_SP}()},
\code{\link{gsw_SA_from_SP}()},
\code{\link{gsw_SA_from_SP_Baltic}()},
\code{\link{gsw_SA_from_Sstar}()},
\code{\link{gsw_SP_from_C}()},
\code{\link{gsw_SP_from_SA}()},
\code{\link{gsw_SP_from_SK}()},
\code{\link{gsw_SP_from_SR}()},
\code{\link{gsw_SP_from_Sstar}()},
\code{\link{gsw_SR_from_SP}()},
\code{\link{gsw_Sstar_from_SA}()},
\code{\link{gsw_Sstar_from_SP}()}
}
\concept{things related to salinity}
