## Video Lectures

# Estimate population mean
library(manipulate)
library(ggplot2)

myHist <- function(mu) {
    mse <- round(mean((Galton$child - mu) ^ 2), 3)
    
    g <- ggplot(Galton, aes(x = child)) + 
        geom_histogram(fill="salmon", binwidth=1, aes(y=..density..), colour="black") +
        geom_density(size=2) +
        geom_vline(xintercept=mu, size=2) +
        labs(title = paste("mu = ", mu, "MSE = ", mse))
    g
}

manipulate(myHist(mu), mu = slider(62, 74, step=0.5))