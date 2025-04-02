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

#classificare
mato1992c = im.classify(mato1992, num_clusters=2) #colore al contrario del prof, a secondo di quale pixel parte per prima
# class 1 = human
# class 2 = forest

mato2006c = im.classify(mato2006, num_clusters=2)
# class 1 = forest
# class 2 = human

f1992 = freq(mato1992c)
f1992 
tot1992 = ncell(mato1992c)
perc1992 = f1992 / tot * 100
perc1992

# human 1992 = 17%
# forest 1992 = 83%

perc2006 = freq(mato2006c) / ncell(mato2006c) * 100
perc2006

# forest 2006 = 45%
# human 2006 = 54%









