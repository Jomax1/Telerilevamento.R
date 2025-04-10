# Code for calculating spatial variability
install.packages("RStoolbox")

library(terra)
library(imageRy)
library(viridis)
library(ggplot2)
library(patchwork)
library(RStoolbox)

# Standard deviation
# 23, 22, 23, 49

m = (23 + 22 + 23 + 49) / 4
# m = 29.25

somma_scarto_quadratino =  (23 - m)^2 + (22-m)^2 + (23-m)^2 + (49-m)^2
# somma_scarto_quadratino = 520.75

variance_2 = somma_scarto_quadratino / 4

stand_dev_2 = sqrt(variance_2)
# stand_dev = 11.41

# problema, abbiamo solo un campione limitato
# applichiamo la divisione con (n-1) invece di N per correggere la media sottostimata

variance_2 = somma_scarto_quadratino / (4-1)
stand_dev_2 = sqrt(variance_2)
# stand_dev_2 = 13.17

# formula più facile
sd(c(23, 22, 23, 49))
# sd = 13.16 quindi diverso di stand_dev_1 / più vicino di stand_dev_2

#---
im.list()
sent = im.import("sentinel.png")
sent = flip(sent)
plot(sent)

# band 1 = NOR 
# band 2 = red
# band 3 = green

# Plot the image in RGB with the NIR ontop of the red component
im.plotRGB(sent, r=1, g=2, b=3)

# make 3 plots with NIR ontop of each component: r, g, b
im.multiframe(1, 3)
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)
im.plotRGB(sent, r=3, g=2, b=1)

sent_nir = sent[[1]]

# Plot the NIR band with the inferno color ramp palette
plot(sent_nir, col=inferno(100))

# focal function
# Calculate focal ("moving window") values for each cell.
stand_dev_3 = focal(sent_nir, w=c(3,3), fun=sd)

im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3)
plot(stand_dev_3)

# Calculate standard deviation with the nir band with moving window of 5 pixels
stand_dev_5 = focal(sent_nir, w=c(5,5), fun=sd)
im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3)
plot(stand_dev_5)

# use ggplot to plot the standard deviation
im.ggplot(stand_dev_3)

# plot the 2 stand dev maps (3 and 5) one beside another with ggplot
p1 = im.ggplot(stand_dev_3)
p2 = im.ggplot(stand_dev_5)
p1 + p2

# with ggplot, plot the original sent in RGB (ggRGB) together with the stand dev 3 and 5 pixels
# serve RStoolbox
p3 = ggRGB(sent, r=1, g=2, b=3)
p3 + p1 + p2
#con ggplot le imagini vengono tutte uguali anche con la legenda

# What to do in case of huge images
ncell(sent) # da il numero du pixell 633612 per ogni livello
ncell(sent) * nlyr(sent) # si deve multiplicare dal numero di layers x 4 = 2534448

sent_a2 = aggregate(sent, fact=2) # divide la resoluzione, numero di pixel di 4 volte (per 2 delle x, 2 delle y)
ncell(sent_a2) # 158403
ncell(sent_a2) * nlyr(sent_a2) # 633612

sent_a5 = aggregate(sent, fact=5) # divide la resoluzione, numero di pixel di 25 volte (per 5 delle x, 5 delle y)
ncell(sent_a5) # 25440
ncell(sent_a5) * nlyr(sent_a5) # 101760

# make a multiframe and plot in RGB the 3 images (originale, 2, 5)
im.multiframe(1,3)
im.plotRGB(sent, 1, 2, 3)
im.plotRGB(sent_a2, 1, 2, 3)
im.plotRGB(sent_a5, 1, 2, 3)

# Calculating standard deviation
nir_a2 = sent_a2[[1]]
sd3_a2 = focal(nir_a2, w=c(3,3), fun="sd")

# calculate the standard deviation for teh factor 5 image
nir_a5 = sent_a5[[1]]
sd3_a5 = focal(nir_a5, w=c(3,3), fun="sd")

im.multiframe(1,2)
plot(sd3_a2)
plot(sd3_a5)

sd5_a5 = focal(nir_a5, w=c(5,5), fun="sd")
im.multiframe(1,2)
plot(sd3_a5)
plot(sd5_a5)

im.multiframe(2,2)
plot(stand_dev_3)
plot(sd3_a2)
plot(sd3_a5)
plot(sd5_a5)

# with ggplot / patchwork
p1 = im.ggplot(stand_dev_3)
p2 = im.ggplot(sd3_a2)
p3 = im.ggplot(sd3_a5)
p4 = im.ggplot(sd5_a5)
p1 + p2 + p3 + p4

# Variance
# nir
var_3 = stand_dev_3^2

im.multiframe(1, 2)
plot(stand_dev_3)
plot(var_3)
# con la varianza si perde una parte delle informazioni più basse

var_5 = sd5_a5^2
im.multiframe(1, 2)
plot(sd5_a5)
plot(var_5)
