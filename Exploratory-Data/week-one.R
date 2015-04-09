## Video Lectures

# Base plot
library(datasets)
data(cars)
with(cars, plot(speed, dist))

# Lattice plot
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))

# Ggplot2 plot
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)

# Base Plot Part 1
library(datasets)
hist(airquality$Ozone) ## Draw a new plot

# Base Plot with Annotation
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n")) #type = n plots a graph without any points
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col= c("blue", "red"), legend = c("May", "Other Months"))

# Base Plot With Regression Line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

# Creating a Plot in a File Device
pdf(file = "myplot.pdf") # Open PDF Device; create "myplot.pdf" in my working directory
## Create the plot IT WONT APPEAR ON THE SCREEN
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data") #annotate plot. Still nothing on the screen
dev.off() # close the PDF file device
# now its possible to view the file