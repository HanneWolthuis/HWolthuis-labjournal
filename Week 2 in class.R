rm(list = ls())


df <- c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

(AM_empty <- matrix(df, nrow = 4, ncol = 4))

Mymatrix <- matrix(0, nrow = 100, ncol = 100)
Mymatrix 

df <- c(0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0)

(AM_1 <- matrix(df, nrow = 4, ncol = 4))


allzeromatrix <- matrix(1, nrow = 5, ncol = 5)

allzeromatrix

Mymatrix <- matrix(0, nrow = 100, ncol = 100)
Mymatrix 


Mymatrix3 <- matrix(1:0, nrow = 4, ncol = 4) # 1 and 0 
Mymatrix3


Mymatrix4 <- matrix(sample(c(0: 1), size = 16, replace = TRUE), nrow = 4, ncol = 4)
Mymatrix4

set.seed(123)

# grootte van de matrix
n <- 4  

# random waarden (0 of 1 met gelijke kans)
Mymatrix5 <- matrix(sample(c(0,1), size = n*n, replace = TRUE), nrow = n, ncol = n)

# diagonaal op 0 zetten
diag(Mymatrix5) <- 0  

Mymatrix5

TransposeMymatrix5 <- t(Mymatrix5)
TransposeMymatrix5


Mymatrix5[upper.tri(Mymatrix5)] <- TransposeMymatrix5[upper.tri(TransposeMymatrix5)]
Mymatrix5

install.packages("igraph")
require("igraph")

# install.packages('igraph')
library(igraph)


set.seed(123643)
Mymatrix4 <- matrix(sample(c(0: 1), size = 16, replace = TRUE), nrow = 4, ncol = 4)
Mymatrix4

diag(Mymatrix4) <- 0  

net_un <- Mymatrix4 + t(Mymatrix4)
net_un [net_un ==2] <- 1
diag(net_un) <- 0
net_un
netG <- graph_from_adjacency_matrix(net_un)
class(netG)
plot(netG)
igraph::transitivity(netG, type = "undirected")


netG2 <- graph_from_adjacency_matrix(Mymatrix4)
class(netG2)
plot(netG2)


# dyad census
dyad_census(netG2)

# tryad census 
triad_census(netG2)

?igraph

Mymatrix6 <- matrix(sample(c(0: 1), size = 100, replace = TRUE), nrow = 10, ncol = 10)
Mymatrix6

net_un6 <- Mymatrix6 + t(Mymatrix6)
net_un6 [net_un6 ==2] <- 1
diag(net_un6) <- 0
net_un6
netG <- graph_from_adjacency_matrix(net_un6)
class(netG)
plot(netG)
igraph::transitivity(netG, type = "undirected")

dyad_census(netG)
