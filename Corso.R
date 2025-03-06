#27/02/2025
# Installing packages
# CRAN
install.packages("terra")
library(terra)

install.packages("devtools")
library(devtools)

install_github("ducciorocchini/imageRy")
library(imageRy)

#04/03/2025
b2=im.import("sentinel.dolomites.b2.tif")
cl = colorRampPalette(c("black","darkgrey","lightgrey"))(100)
plot(b2, col=cl)

cl = colorRampPalette(c("greenyellow","cyan4","deeppink"))(100)
plot(b2, col=cl)

cl = colorRampPalette(c("greenyellow","cyan4","deeppink"))(3)
plot(b2, col=cl)

cl = colorRampPalette(c("cornflowerblue","firebrick","indianred1"))(100)
plot(b2, col=cl)

cl = colorRampPalette(c("cornflowerblue","firebrick","khaki"))(100)
plot(b2, col=cl)

#06/03/2025

