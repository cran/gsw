% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_cp_ice}
\alias{gsw_cp_ice}
\title{Specific heat to ice}
\usage{
gsw_cp_ice(t, p)
}
\arguments{
\item{t}{in-situ temperature (ITS-90) [ degC ]}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}
}
\value{
specific heat [ J/(K*kg) ]
}
\description{
Specific heat of ice
}
\section{Implementation Note}{

This R function uses a wrapper to a C function
contained within the GSW-C system as updated 2021-03-27
at \url{https://github.com/TEOS-10/GSW-C}
with git commit `f7bfebf44f686034636facb09852f1d5760c27f5`.
In turn, that C function uses data from the
\code{library/gsw_data_v3_0.mat}
file provided in the GSW-Matlab source code, version 3.06-11.
Unfortunately, this version is no longer displayed on the
TEOS-10.org website. Therefore, in the interests of making
GSW-R be self-contained, a copy was downloaded from
\url{http://www.teos-10.org/software/gsw_matlab_v3_06_11.zip}
on 2021-0706, the .mat file was stored in
the developer/create_data directory of
\url{https://github.com/TEOS-10/GSW-R}, and then the dataset
used in GSW-R was created based on that .mat file.
Please consult \url{http://www.teos-10.org} to learn more about
the various TEOS-10 software systems.
}

\examples{
t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
cp <- gsw_cp_ice(t, p)
stopifnot(all.equal(cp, c(2017.314262094657, 1997.830122682709, 2002.281331375396,
                          2006.127319545421, 2015.676303959609, 2033.308170371559)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_cp_ice.html}
}
