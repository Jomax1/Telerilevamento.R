# Code for calculating spatial variability

library(terra)
library(imageRy)
library(viridis)

# Standard deviation
# 23, 22, 23, 49

m = (23 + 22 + 23 + 49) / 4
# m = 29.25

somma_scarto_quadratino =  (23 - m)^2 + (22-m)^2 + (23-m)^2 + (49-m)^2
# somma_scarto_quadratino = 520.75

variance = somma_scarto_quadratino / 4

stand_dev = sqrt(variance)
# stand_dev = 11.41

# formula più facile
sd(c(23, 22, 23, 49))
# sd = 13.16 donc différent ... ça ne marche pas

#---
im.list()
sent = im.import("sentinel.png")
sent = flip(sent)

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
sd3 = focal(sent_nir, w=c(3,3), fun=sd)

im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3)
plot(sd3)

