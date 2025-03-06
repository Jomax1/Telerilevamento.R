#27/02/2025
# Installing packages
# CRAN
install.packages("terra")
install.packages("devtools")
install.packages("viridis") #colori per daltonici
install_github("ducciorocchini/imageRy")


library(terra)
library(devtools)
library(viridis)
library(imageRy)

#04/03/2025
#cercare ImageRy colors su google
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
im.list()
#sentinel-2-band3
#https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/bands/
#band 2 blue
b2 = im.import("sentinel.dolomites.b2.tif")

#band 3 verde
b3 = im.import("sentinel.dolomites.b3.tif")

#band 4 red
b4 = im.import("sentinel.dolomites.b4.tif")

#band 8 infrarosso vicino
b8 = im.import("sentinel.dolomites.b8.tif")


par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

dev.off()

im.multiframe(1,4)
#multiframe include già il par
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#exercise: plot the bands using im.multiframe in colonna
im.multiframe(4,1)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#altro
im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

#modificando i colori
cl = colorRampPalette(c("black","light grey"))(100)
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

#mettendo il nome delle bandi
sent = c(b2, b3, b4, b8) #manca il pachetto stack?
plot(sent, col=cl)

names(sent) = c("b2_blue", "b3_green", "b4_red", "b8_NIR")
sent

dev.off()

plot(sent, col=cl)
plot(sent)

plot(sent$b8_NIR)
#il $ collega due cose (come una corda)

plot(sent[[4]])
     
#importare più dati insieme usando la catena di carateri in commune di tutte le bandi
sentdol = im.import("sentinel.dolomites")

#controllare la correlazione delle bandi
pairs(sentdol)

#viridis
#https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
plot(sentdol, col=viridis(100))
plot(sentdol, col=mako(100))
plot(sentdol, col=magma(100))
     





