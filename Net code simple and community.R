library(igraph)

nodes2 <- read.csv("C:/Users/mfriesen/Desktop/Nov23_NetTest/NodeListFinal.csv", header=T, as.is=T)
edges2 <- read.csv("C:/Users/mfriesen/Desktop/Nov23_NetTest/EdgesFinal.csv", header=T, row.names = 1)
links2 <- as.matrix(edges2)

net2 <- graph_from_incidence_matrix(links2)

# Modify nodes - I added this back in to get node distinction
V(net2)$color <- c("NA", "orange")[V(net2)$type+1]
V(net2)$shape <- c("none", "circle")[V(net2)$type+1]

#basic net
V(net2)$label <- ""
V(net2)$label[V(net2)$type==F] <- nodes2$media[V(net2)$type==F]
V(net2)$label.cex=.85
V(net2)$label.font=2   

plot(net2, edge.width=1.5, edge.color="dimgray",vertex.label.color="black", 
     vertex.frame.color=NA, vertex.size=2.5)

# groups
clu <- components(net2)
groups(clu)

plot(net2, vertex.color=clusters(net2)$membership+1)

fc <- fastgreedy.community(net2)
colors <- rainbow(max(membership(fc)))
plot(net2,vertex.color=colors[membership(fc)], 
     layout=layout.fruchterman.reingold)

