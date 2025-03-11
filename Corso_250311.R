sentdol = im.import("sentinel.dolomites")
print(sentdol) #da num di pixel, tra altro
nlyr(sentdol) #num layer
ncell(sentdol) #da num di pixel
ncell(sentdol)*nlyr(sentdol)

pairs(sentdol[[4]]) # ?
plot(sentdol[[4]])

# layers
# 1 = blue (b1)
# 2 = green (b2)
# 3 = red (b3)
# 4 = NIR (b8)

pairs(sentdol)
# le bandi non cambiano tanto, tranne il NIR

# colori naturali (come l'occhio umano)
im.plotRGB(sentdol, r=3, g=2, b=1)
# molto gregio perché vediamo solo una piccola parte dello spetro 

#Con falsi colori, con gli ultrarossi vicini, scartiamo il blu
im.plotRGB(sentdol, r=4, g=3, b=2)
# le piante riflettano molto nel NIR
# invece l'aqua assorbe molto il IR, sono molto visibili sul'imagine

# esercizio
# plot the image using the NIR on top of the green component of the RGB scheme
im.plotRGB(sentdol, r=3, g=4, b=1)
#il NIR apparisce sul verde, le piante appariscono verdi, quello sembra "più naturale" per l'occhio umano
im.plotRGB(sentdol, r=2, g=4, b=3)
# non cambio tanto perché solo il NIR è davvero diverso

im.multiframe(1,2)
im.plotRGB(sentdol, r=3, g=4, b=1)
im.plotRGB(sentdol, r=2, g=4, b=3)
dev.off()

im.plotRGB(sentdol, r=3, g=2, b=4)



