# Code for classifying images

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

install.packages("patchwork")

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
# human 2006 = 55%

class = c("Forest", "Human")
y1992 = c(83, 17)
y2006 = c(45, 55)
tab = data.frame(class, y1992, y2006)
tab

# grafici con ggplot2
p1 = ggplot(tab, aes(x=class, y=y1992, color=class)) + # struttura del grafico
  geom_bar(stat="identity", fill="white") + # grafico bar
  ylim(c(0, 100)) # associare la stessa scala y

p2 = ggplot(tab, aes(x=class, y=y2006, color=class)) + # struttura del grafico
  geom_bar(stat="identity", fill="white") + # grafico bar
  ylim(c(0, 100)) # associare la stessa scala y

p1 + p2 

# l'uno sopra l'altro
p1 = ggplot(tab, aes(x=class, y=y1992, color=class)) + # struttura del grafico
  geom_bar(stat="identity", fill="white") + # grafico bar
  ylim(c(0, 100)) + # associare la stessa scala y
  coord_flip() # cambiare il senso

p2 = ggplot(tab, aes(x=class, y=y2006, color=class)) + # struttura del grafico
  geom_bar(stat="identity", fill="white") + # grafico bar
  ylim(c(0, 100)) + # associare la stessa scala y
  coord_flip() # cambiare il senso

p1 / p2 

# si può anche usare "fill=class"

#____ solar Orbiter
Solar = im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# exercise : classify the image in 3 classes
Solar_c = im.classify(Solar, num_clusters=3)
plot(Solar_c)

# plot the original image beside the classify image
Solar / Solar_c





