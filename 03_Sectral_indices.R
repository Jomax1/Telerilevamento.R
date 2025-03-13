# Code to calculate spectral indices from satellite images
install.packages("terra")
install.packages("viridis") #colori per daltonici
install_github("ducciorocchini/imageRy")

im.list()

#imagine gratuita fornita della NASA, dal landsat 5

# 1 = NIR
# 2 = red
# 3 = green

# image of 1992
mato1992 = im.import("matogrosso_l5_1992219_lrg.jpg") #plot incluso
mato1992 = flip(mato1992) # Nord <-> Sud
plot(mato1992)
im.plotRGB(mato1992, r=1 , g=2, b=3)
im.plotRGB(mato1992, r=2 , g=1, b=3) #NIR nel green
im.plotRGB(mato1992, r=2 , g=3, b=1) #NIR nel blue

# image of 2006, dal satelite aster, per vedere la deforestazione
mato2006 = im.import("matogrosso_ast_2006209_lrg.jpg") #plot incluso
mato2006 = flip(mato2006) # Nord <-> Sud
plot(mato2006)

im.multiframe(1,2)
im.plotRGB(mato1992, r=2 , g=3, b=1) #NIR nel blue
im.plotRGB(mato2006, r=2 , g=3, b=1) #NIR nel blue

im.plotRGB #per vedere gli arogmenti possibili
im.plotRGB(mato1992, r=2 , g=3, b=1, title="1992") #NIR nel blue
im.plotRGB(mato2006, r=2 , g=3, b=1, title="2006") #NIR nel blue*
# anche l'acqua ha cambiato colore

# radiometric resolution
im.multiframe(1,2)
plot(mato1992[[1]], col=inferno(100))
plot(mato2006[[1]], col=inferno(100))

#abbiamo delle imagini a 8bit

# DVI : difference vegetation index
# E.coli
# Caribe

# valutare lo stato delle piante
# Tree:           NIR=255, red=0, DVI=NIR-red=255
# Stressed tree:  NIR=100, red=20, DVI=NIR-red=80

im.multiframe(1,2)
plot(mato1992)
plot(mato2006)

# 1 = NIR
# 2 = red
# 3 = green

dvi1992 = mato1992[[1]] - mato1992[[2]] # NIR - red
plot(dvi1992)

# range DVI
# maximum: NIR - red = 225 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

plot(dvi1992, col=inferno(100))

#calculate DVI for 2006
dvi2006 = mato2006[[1]] - mato2006[[2]] # NIR - red
plot(dvi2006)
plot(dvi2006, col=inferno(100))
 
im.multiframe(1,2)
plot(dvi1992, col=inferno(100))
plot(dvi2006, col=inferno(100))

# Different radiometric resolutions
# DVI 8 bit : range (valori possibili da 0 a 255)
# max: NIR - red = 255-0 = 255
# min: NIR - red = 0-255 = -255

# DVI 4 bit : range (valori da 0 a 15)
# max: NIR - red = 15-0 = 15
# min: NIR - red = 0-15 = -15


