# Code for calculating spatial variability

# Standard deviation
# 23, 22, 23, 49

m = (23 + 22 + 23 + 49) / 4
# m = 29.25

somma_scarto_quadratino =  (23 - m)^2 + (22-m)^2 + (23-m)^2 + (49-m)^2
# somma_scarto_quadratino = 520.75

variance = somma_scarto_quadratino / 4

stand_dev = sqrt(variance)
# stand_dev = 11.41

# formula più facile
sd(c(23, 22, 23, 49))
# sd = 13.16 donc différent ... ça ne marche pas




