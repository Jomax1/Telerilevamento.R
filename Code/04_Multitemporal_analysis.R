# R code for performing multitemporal analysis

library(terra)
library(imageRy)
library(ggridges) # for ridgeline plots
library(ggplot2) # for ridgeline plots
library(viridis) 

# Listing the data
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


# Ridgeline plots
gr = im.import("greenland")
im.ridgeline(gr, scale=1)
# prende tutti i pixels di un anno e ne calcola la frequenza
# Il dataset rimane più o meno stabile
# cambiamo la scala
im.ridgeline(gr, scale=2)
?im.ridgeline #apre il manuale della funzione ("option" è stato modificato in "palette")
im.ridgeline(gr, scale=2, palette="inferno")
im.ridgeline(gr, scale=3, palette="inferno")

# exercise : import the NDVI data from sentinel
sent_NDVI = im.import("Sentinel2_NDVI")
im.ridgeline(sent_NDVI, scale=2)

# changing names
# sources :  Sentinel2_NDVI_2020-02-21.tif                   
#            Sentinel2_NDVI_2020-05-21.tif                     
#            Sentinel2_NDVI_2020-08-01.tif                     
#            Sentinel2_NDVI_2020-11-27.tif 

names(sent_NDVI) = c("02_Feb", "05_May", "08_Aug", "11_Nov")
im.ridgeline(sent_NDVI, scale=2)
im.ridgeline(sent_NDVI, scale=2, palette="mako")

# Feb: NDVI più bassi perchè inverno
# Maggio, Agosto: valori più alti
# Nov: ritorno ai valori d'inverno

pairs(sent_NDVI)
plot(sent_NDVI[[1]], sent_NDVI[[2]])
# aggiungiamo una linea
# y = x, may = y, feb = s
# y = a + bx
# a=0, b=1
# abline(a, b
abline(0,1, col="red")
# sistemiamo i range di feb e maggio

plot(sent_NDVI[[1]], sent_NDVI[[2]], xlim=c(-0.3, 0.9), ylim=c(-0.3, 0.9))
abline(0,1, col="red")


im.multiframe(1,3)
plot(sent_NDVI[[1]])
plot(sent_NDVI[[2]])
plot(sent_NDVI[[1]], sent_NDVI[[2]], xlim=c(-0.3, 0.9), ylim=c(-0.3, 0.9))
abline(0,1, col="red")
