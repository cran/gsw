## ----echo=FALSE, results="hide"---------------------------
options(keep.source=TRUE, width=60, prompt=' ', continue=' ', oceEOS="unesco")

## ---------------------------------------------------------
library(gsw)
SA <- gsw_SA_from_SP(SP=35, p=100, longitude=188, latitude=4)

## ---------------------------------------------------------
CT <- gsw_CT_from_t(SA=SA, t=10, p=100)

## ----eval=FALSE-------------------------------------------
#  library(oce)
#  data(section)
#  ctd <- section[["station", 100]]
#  Slim <- c(34.8, 37.0)
#  Tlim <- c(0, 25)
#  par(mfcol=c(2,2))
#  plotTS(ctd, Slim=Slim, Tlim=Tlim, eos="unesco")
#  plotTS(ctd, Slim=Slim, Tlim=Tlim, eos="gsw")
#  plot(ctd[["SA"]] - ctd[["salinity"]], ctd[["z"]],
#       xlab="Practical Salinity - Absolute Salinity", ylab="Depth [m]")
#  plot(ctd[["CT"]] - ctd[["theta"]], ctd[["z"]],
#       xlab="Conservative Temp. - Potential Temp.", ylab="Depth [m]")

## ----eval=FALSE-------------------------------------------
#  f <- section[["CT"]] - section[["theta"]]
#  hist(f, main="", breaks=100, xlab="CT-theta")

## ----eval=FALSE-------------------------------------------
#  f <- section[["SA"]] - section[["salinity"]]
#  hist(f, main="", breaks=100, xlab="Absolute Salinity - Practical Salinity")

## ----eval=FALSE-------------------------------------------
#  library(oce)
#  data("levitus", package="ocedata")
#  SSS <- levitus$SSS
#  dim <- dim(SSS)
#  ll <- expand.grid(lon=levitus$longitude, lat=levitus$latitude)
#  SA <- gsw_SA_from_SP(levitus$SSS, 0, ll$lon, ll$lat)
#  per <- 100 * (1 - levitus$SSS / SA)
#  imagep(levitus$longitude, levitus$latitude, per, col=oceColorsJet,
#         zlim=quantile(per, c(0.001, 0.999), na.rm=TRUE))
#  title(expression("Percent difference between " * S[A] * " and " * S[P]))

## ----results="hide", echo=FALSE---------------------------
options(prompt='> ', continue='+ ', oceEOS="unesco")

