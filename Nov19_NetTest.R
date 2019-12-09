
library("igraph")
 
# -------~~ DATASET 2: matrix  --------
 
# Read in the data:
nodes2 <- read.csv("C:/Users/mfriesen/Desktop/Nov19_NetTest/DatasetMF-Media-User-Example-NODES.csv", header=T, as.is=T)
links2 <- read.csv("C:/Users/mfriesen/Desktop/Nov19_NetTest/DatasetMF-Media-User-Example-EDGES.csv", header=T, row.names=1)


# links2 is a matrix for a two-mode network:
links2 <- as.matrix(links2)

# Create an igraph network object from the two-mode matrix: 
net2 <- graph_from_incidence_matrix(links2)

# A built-in vertex attribute 'type' shows which mode vertices belong to.
table(V(net2)$type)

plot(net2,vertex.label=NA)

# Modify nodes
V(net2)$color <- c("white", "orange")[V(net2)$type+1]
V(net2)$shape <- c("square", "circle")[V(net2)$type+1]
plot(net2, vertex.label=NA)

# Media outlets will have name labels, audience members will not:
V(net2)$label <- ""
V(net2)$label[V(net2)$type==F] <- nodes2$media[V(net2)$type==F] 
V(net2)$label.cex=.6
V(net2)$label.font=2

plot(net2, vertex.label.color="white") 
plot(net2, vertex.label.color="black", vertex.frame.color=NA, vertex.size=(1.5-V(net2)$type)*8)
