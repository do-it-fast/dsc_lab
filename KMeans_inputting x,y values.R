data = data.frame(x=c(11,4,3,9,7,6,11,8), y=c(1,8,1,8,8,9,3,12))
data
install.packages("cluster")
library(cluster)
summary(data)
set.seed(240)

kmeans.re <- kmeans(data, centers = 2, nstart = 20)
kmeans.re
kmeans.re$cluster
plot(data[c("x", "y")],
     col = kmeans.re$cluster,
     main = "K-means with 2 clusters")

kmeans.re$centers
kmeans.re$centers[, c("x", "y")]
points(kmeans.re$centers[, c("x", "y")],
       col = 1:3, pch = 8, cex = 3)
y_kmeans <- kmeans.re$cluster

clusplot(data[, c("x", "y")],
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Book1"),
         xlab = 'X',
         ylab = 'Y')

install.packages("ggplot2")
library(ggplot2)

KM = kmeans(data,2)
autoplot(KM,data,frame=TRUE)

