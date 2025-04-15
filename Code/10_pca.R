# R code for Principal Component ANalysis

library(terra)
library(imageRy)

sent = im.import("sentinel.png")
sent = flip(sent)
plot(sent)

sent = c(sent[[1]], sent[[2]], sent[[3]])
plot(sent)
     
# NIR = band 1
# red = band 2
# green = band 3

sentpca = im.pca(sent, n_samples = 100000)

tot = 78 + 54 + 6 # 138

# 78 : 138 = x : 100
78 * 100 / tot

sdpc1 = focal(sentpca[[1]], w = c(3,3), fun="sd")
plot(sdpc1)




