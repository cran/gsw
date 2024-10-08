% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_frazil_properties_potential_poly}
\alias{gsw_frazil_properties_potential_poly}
\title{Properties of Frazil ice i.t.o. potential enthalpy (polynomial version)}
\usage{
gsw_frazil_properties_potential_poly(SA_bulk, h_pot_bulk, p)
}
\arguments{
\item{SA_bulk}{Absolute Salinity of a combination of seawater and ice [ g/kg ]}

\item{h_pot_bulk}{potential enthalpy of a mixture of seawater and ice [ J/kg ]}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}
}
\value{
a list containing \code{SA_final}, \code{h_final} and \code{w_Ih_final}.
}
\description{
Calculation of Absolute Salinity, Conservative Temperature, and ice mass fraction
based on bulk Absolute Salinity, bulk potential enthalpy, and pressure
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
SA_bulk <- c(     34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
h_pot_bulk <- c(-4.5544e4, -4.6033e4, -4.5830e4, -4.5589e4, -4.4948e4, -4.4027e4)
p <- c(                10,        50,       125,       250,       600,      1000)
r <- gsw_frazil_properties_potential_poly(SA_bulk, h_pot_bulk, p)
stopifnot(all.equal(r$SA_final, c(39.098264696022831, 39.343217436835218, 39.434244243586633,
                                  39.159511498029801, 38.820458704205542, 38.542256756176229)))
stopifnot(all.equal(r$CT_final, c(-2.155537691991377, -2.200841508940901, -2.264094318382661,
                                  -2.344613208230164, -2.598663953454472, -2.900948531145453)))
stopifnot(all.equal(r$w_Ih_final, c(0.112190777010854, 0.113150823111566, 0.111797356032850,
                                    0.110121687760246, 0.105198620534670, 0.098848824039493)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_frazil_properties_potential_poly.html}
}
\seealso{
Other things related to enthalpy: 
\code{\link{gsw_CT_from_enthalpy}()},
\code{\link{gsw_dynamic_enthalpy}()},
\code{\link{gsw_enthalpy}()},
\code{\link{gsw_enthalpy_CT_exact}()},
\code{\link{gsw_enthalpy_diff}()},
\code{\link{gsw_enthalpy_first_derivatives}()},
\code{\link{gsw_enthalpy_first_derivatives_CT_exact}()},
\code{\link{gsw_enthalpy_ice}()},
\code{\link{gsw_enthalpy_t_exact}()},
\code{\link{gsw_frazil_properties_potential}()},
\code{\link{gsw_pot_enthalpy_from_pt_ice}()},
\code{\link{gsw_pot_enthalpy_from_pt_ice_poly}()},
\code{\link{gsw_pot_enthalpy_ice_freezing}()},
\code{\link{gsw_pot_enthalpy_ice_freezing_poly}()},
\code{\link{gsw_pt_from_pot_enthalpy_ice}()},
\code{\link{gsw_pt_from_pot_enthalpy_ice_poly}()},
\code{\link{gsw_specvol_first_derivatives}()},
\code{\link{gsw_specvol_first_derivatives_wrt_enthalpy}()}
}
\concept{things related to enthalpy}
