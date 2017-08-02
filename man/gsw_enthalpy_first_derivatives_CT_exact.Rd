% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_enthalpy_first_derivatives_CT_exact}
\alias{gsw_enthalpy_first_derivatives_CT_exact}
\title{First Derivatives of Enthalpy wrt CT}
\usage{
gsw_enthalpy_first_derivatives_CT_exact(SA, CT, p)
}
\arguments{
\item{SA}{Absolute Salinity [ g/kg ]}

\item{CT}{Conservative Temperature [ degC ]}

\item{p}{sea pressure [dbar], i.e. absolute pressure [dbar] minus 10.1325 dbar}
}
\value{
a list containing \code{h_SA} [ (J/kg)/(g/kg) ], the derivative
of enthalpy wrt Absolute Salinity, and \code{h_CT} [ (J/kg)/degC ],
the derivative of enthalpy wrt Conservative Temperature.
}
\description{
First Derivatives of Enthalpy wrt CT
}
\details{
The present R function works with a wrapper to a C function contained
within the GSW-C system (Version 3.05 dated 2017-07-27, available at
\url{https://github.com/TEOS-10/GSW-C},
as git commit '13ab33cea0e9059d3b3f3dfef78e9591c94af9f8'), which
stems from the GSW-Fortran system (\url{https://github.com/TEOS-10/GSW-Fortran})
which in turn stems from the GSW-Matlab system
(\url{https://github.com/TEOS-10/GSW-Matlab}).
Consult \url{http://www.teos-10.org} to learn more about
these software systems, their authorships, and the science behind
it all.
}
\section{Bugs}{

The HTML documentation suggests that this function returns 3 values, but
there are only 2 returned values in the C code used here (and the matlab code
on which that is based). Also, the d/dSA check values given the HTML are not
reproduced by the present function. This was reported on Mar 18, 2017
as https://github.com/TEOS-10/GSW-Matlab/issues/7.
See https://github.com/TEOS-10/GSW-R/issues/34
}

\examples{
SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
d <- gsw_enthalpy_first_derivatives_CT_exact(SA, CT, p)
expect_equal(d$h_SA, c(-0.070224183838619, -0.351159869043798, -0.887036550157504,
                     -1.829626251448858, -4.423522691827955, -7.405211691293971))
expect_equal(d$h_CT/1e3, c(3.991899712269790, 3.992025674159605, 3.992210402650973,
                         3.992283991748418, 3.992685275917238, 3.993014370250710))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_enthalpy_first_derivatives_CT_exact.html}
}
\seealso{
Other things related to enthalpy: \code{\link{gsw_CT_from_enthalpy}},
  \code{\link{gsw_dynamic_enthalpy}},
  \code{\link{gsw_enthalpy_CT_exact}},
  \code{\link{gsw_enthalpy_diff}},
  \code{\link{gsw_enthalpy_first_derivatives}},
  \code{\link{gsw_enthalpy_ice}},
  \code{\link{gsw_enthalpy_t_exact}},
  \code{\link{gsw_enthalpy}},
  \code{\link{gsw_frazil_properties_potential_poly}},
  \code{\link{gsw_frazil_properties_potential}},
  \code{\link{gsw_pot_enthalpy_from_pt_ice_poly}},
  \code{\link{gsw_pot_enthalpy_from_pt_ice}},
  \code{\link{gsw_pot_enthalpy_ice_freezing_poly}},
  \code{\link{gsw_pot_enthalpy_ice_freezing}},
  \code{\link{gsw_pt_from_pot_enthalpy_ice_poly}},
  \code{\link{gsw_pt_from_pot_enthalpy_ice}},
  \code{\link{gsw_specvol_first_derivatives_wrt_enthalpy}},
  \code{\link{gsw_specvol_first_derivatives}}
}