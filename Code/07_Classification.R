# Code for classifying images

library(terra)
library(imageRy)

im.list()
mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg")
mato1992 = flip(mato1992)
plot(mato1992)


mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg")
mato2006 = flip(mato2006)
plot(mato2006)


