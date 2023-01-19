install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")
install.packages("gridExtra")

#library(dplyr)
library(tidyverse)
library(cluster)
library(gridExtra)
library(factoextra)

data('USArrests') 
d_frame <- USArrests
d_frame <- na.omit(d_frame)  #Removing the missing values
d_frame <- scale(d_frame)
head(d_frame)

kmeans2 <- kmeans(d_frame, centers = 2, nstart = 25)
str(kmeans2)

fviz_cluster(kmeans2, data = d_frame)

kmeans3 <- kmeans(d_frame, centers = 3, nstart = 25)  #DataFlair
kmeans4 <- kmeans(d_frame, centers = 4, nstart = 25)  
kmeans5 <- kmeans(d_frame, centers = 5, nstart = 25)  
#Comparing the Plots
plot1 <- fviz_cluster(kmeans2, geom = "point", data = d_frame) + ggtitle("k = 2")
plot2 <- fviz_cluster(kmeans3, geom = "point", data = d_frame) + ggtitle("k = 3")
plot3 <- fviz_cluster(kmeans4, geom = "point", data = d_frame) + ggtitle("k = 4")
plot4 <- fviz_cluster(kmeans5, geom = "point", data = d_frame) + ggtitle("k = 5")
grid.arrange(plot1, plot2, plot3, plot4, nrow = 2)

fviz_nbclust(d_frame, kmeans, method = "wss") + geom_vline(xintercept = 3, linetype = 2)

finalplot <- fviz_cluster(kmeans3, geom = "point", data = d_frame) + ggtitle("k = 3")
finalplot

