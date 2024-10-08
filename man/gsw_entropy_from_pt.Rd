% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gsw.R
\name{gsw_entropy_from_pt}
\alias{gsw_entropy_from_pt}
\title{Specific Entropy ito Absolute Salinity and Potential Temperature}
\usage{
gsw_entropy_from_pt(SA, pt)
}
\arguments{
\item{SA}{Absolute Salinity [ g/kg ].  The valid range for most `gsw`
functions is 0 to 42 g/kg.}

\item{pt}{potential temperature (ITS-90) [ degC ]}
}
\value{
specific entropy [ J/(kg*degC) ]
}
\description{
Calculates specific entropy in terms of Absolute Salinity and
Potential Temperature.
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
pt <- c(28.7832, 28.4210, 22.7850, 10.2305,  6.8292,  4.3245)
e <- gsw_entropy_from_pt(SA, pt)
stopifnot(all.equal(e/1e2, c(4.003894674443156, 3.954383994925507, 3.198674385897981,
                             1.467905482842553, 0.986469100565646, 0.627913567234252)))
}
\references{
\url{http://www.teos-10.org/pubs/gsw/html/gsw_entropy_from_pt.html}
}
\seealso{
Other things related to entropy: 
\code{\link{gsw_CT_from_entropy}()},
\code{\link{gsw_entropy_first_derivatives}()},
\code{\link{gsw_entropy_from_t}()},
\code{\link{gsw_entropy_ice}()},
\code{\link{gsw_pt_from_entropy}()}
}
\concept{things related to entropy}
