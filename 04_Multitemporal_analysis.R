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
multiframe(1,2)
plot(EN_01)
plot(EN_13)
