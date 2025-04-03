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
im.multiframe(2,1)
plot(Solar)
plot(Solar_c)

# 3 = scuro = low energy
# 1 = medio = medium energy
# 2 = chiaro = high energy

Solar_cs = subst(Solar_c, c(3, 1, 2), c("c1_low", "c2_medium", "c3_high")) # pachetto terra (mette in ordine alfabetico)
dev.of()
plot(Solar_cs)

# Calculate the % of the Sun energy with a unique line of code
Solar_p = freq(Solar_cs)$count * 100 / ncell(Solar_cs) # x100 solo sulla terza colonna
Solar_p
# 37.33349 41.44658 21.21993
# 37 41 21

# create dataframe
class = c("c1_low", "c2_medium", "c3_high") #si potrebbe andare a ricuperare direttamente i dati di Solar_cs ?
perc = c(37,41,21)
tabsol = data.frame(class, perc)

# final ggplot
ggplot(tabsol, aes(x=class, y=perc, fill=class, color=class)) +
  geom_bar(stat="identity")
  # ylim(c(0, 100)) +
  coord_flip() + 
  scale_y_reverse()








