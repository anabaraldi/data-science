# Video Lectures

# hierarchical clustering
set.seed(1234)
x <- rnorm(12, mean=rep(1:3, each=4), sd=.2)
y <- rnorm(12, mean=rep(c(1, 2, 1), each=4), sd=.2)
plot(x, y, col="blue", pch=19, cex=2)
text(x + 0.05, y + 0.05, labels=as.character(1:12))

df <- data.frame(x=x, y=y)
distxy <- dist(df)
hClustering <- hclust(distxy)
plot(hClustering)

# heatmap
df <- data.frame(x=x, y=y)
set.seed(143)
dataMatrix <- as.matrix(df)[sample(1:12), ]
heatmap(dataMatrix)

#kmeans
set.seed(1234)
x <- rnorm(12, mean=rep(1:3, each=4), sd=.2)
y <- rnorm(12, mean=rep(c(1, 2, 1), each=4), sd=.2)
plot(x, y, col="blue", pch=19, cex=2)
text(x + 0.05, y + 0.05, labels=as.character(1:12))

df <- data.frame(x=x, y=y)
kMeansObj <- kmeans(df, centers=3)

par(mar=rep(0.2, 4))
plot(x, y, col=kMeansObj$cluster, pch=19, cex=2)
points(kMeansObj$centers, col=1:3, pch=3, cex=3, lwd=3)

#dimension reduction
set.seed(12345)
par(mar=rep(0.2, 4))
dataMatrix <- matrix(rnorm(400), nrow=40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
heatmap(dataMatrix)

set.seed(78910)
for(i in 1:40) {
    # flip a coin
    coinFlip <- rbinom(1, size=1, prob=0.5)
    # if coin is heads add a common pattern to the row
    if(coinFlip) {
        dataMatrix[i,] <- dataMatrix[i,] + rep(c(0,3), each=5)
    }
}
par(mar=rep(0.2, 4))
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
heatmap(dataMatrix)

hh <- hclust(dist(dataMatrix))
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c(3, 1))
image(t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "Row Mean", ylab = "Row", pch = 19)
plot(colMeans(dataMatrixOrdered), xlab = "Column", ylab = "Column Mean", pch = 19)

#colors

pal <- colorRamp(c("red", "blue"))# it returns a function like gray()
pal(0) #just numbers between 0 and 1, the col from the matrix represents red, blue and green

pal1 <- colorRampPalette(c("red", "yellow")) #also returns a function but slightly different
pal1(10) #integers arguments

library(RColorBrewer)
cols <- brewer.pal(3, "BuGn")
pal <- colorRampPalette(cols)
image(volcano, col=pal(20))



