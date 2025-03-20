# This code helps exporting graphs to imaages
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
