# R code for performing multitemporal analysis

library(terra)
library(imageRy)
library(ggridges) # for ridgeline plots
library(ggplot2) # for ridgeline plots
library(viridis) 

im.list()

# tasso di ossidi di azoto durante il lockdown

EN_01 = im.import("EN_01.png") # imagine gennaio pre-lockdown
EN_01 = flip(EN_01)
plot(EN_01)

EN_13 = im.import("EN_13.png") # imagine di marzo
EN_13 = flip(EN_13)
plot(EN_13)

# exercise : plot the 2 images one beside the other
im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

# fare la differenza tra le due immagine (sul primo livello verde)
EN_dif = EN_01[[1]] - EN_13[[1]]
plot(EN_dif)
plot(EN_dif, col=inferno(100))

# imagini greenland dal programma copernicus
# Greenland ice melt

gr = im.import("greenland")
im.multiframe(1,2)
plot(gr[[1]], col=rocket(100)) # 2000
plot(gr[[4]], col=rocket(100)) # 2015

dev.off()
gr_dif = gr[[1]] - gr[[4]]
plot(gr_dif)

# Exporting data
# per esempio senza la superposizione delle imagini, che dipende del computer usato
# attento, su windows convertire \ in /
setwd("C:/Users/maxime.joly/Desktop/Bologna/UNIVERSITA_BOLOGNA/TELERILEVAMENTO/Export_R")
getwd() # rida il path

plot(gr)

png("greenland_output.png") # per creare e aprire il file
plot(gr)
dev.off() # per chiudere il file

pdf("greenland_output.pdf") # per creare e aprire il file
plot(gr)
dev.off() # per chiudere il file

pdf("green_dif.pdf")
plot(gr_dif)
dev.off()

jpeg("green_dif.jpeg")
plot(gr_dif)
dev.off()

