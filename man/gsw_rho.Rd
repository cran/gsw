% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_rho}
\alias{gsw_rho}
\title{In-situ density}
\usage{
gsw_rho(SA, CT, p)
}
\arguments{
\item{SA}{Absolute Salinity [ g/kg ].  The valid range for most `gsw`
functions is 0 to 42 g/kg.}

\item{CT}{Conservative Temperature [ degC ].}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}
}
\value{
in-situ density [ kg/m^3 ]
}
\description{
In-situ density, using the 75-term equation for specific volume.
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
p <-  c(     10,      50,     125,     250,     600,    1000)
rho <- gsw_rho(SA,CT,p)
stopifnot(all.equal(rho/1e3, c(1.021839935738108, 1.022262457966867, 1.024427195413316,
                               1.027790152759127, 1.029837779000189, 1.032002453224572)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_rho.html}
}
\seealso{
Other things related to density: 
\code{\link{gsw_CT_from_rho}()},
\code{\link{gsw_CT_maxdensity}()},
\code{\link{gsw_SA_from_rho}()},
\code{\link{gsw_alpha}()},
\code{\link{gsw_alpha_on_beta}()},
\code{\link{gsw_alpha_wrt_t_exact}()},
\code{\link{gsw_alpha_wrt_t_ice}()},
\code{\link{gsw_beta}()},
\code{\link{gsw_beta_const_t_exact}()},
\code{\link{gsw_infunnel}()},
\code{\link{gsw_pot_rho_t_exact}()},
\code{\link{gsw_rho_alpha_beta}()},
\code{\link{gsw_rho_first_derivatives}()},
\code{\link{gsw_rho_first_derivatives_wrt_enthalpy}()},
\code{\link{gsw_rho_ice}()},
\code{\link{gsw_rho_t_exact}()},
\code{\link{gsw_sigma0}()},
\code{\link{gsw_sigma1}()},
\code{\link{gsw_sigma2}()},
\code{\link{gsw_sigma3}()},
\code{\link{gsw_sigma4}()},
\code{\link{gsw_specvol}()},
\code{\link{gsw_specvol_alpha_beta}()},
\code{\link{gsw_specvol_anom_standard}()},
\code{\link{gsw_specvol_ice}()},
\code{\link{gsw_specvol_t_exact}()}
}
\concept{things related to density}
