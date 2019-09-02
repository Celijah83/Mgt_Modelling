
dataset <- read.csv("Davis2.csv", TRUE)
summary(dataset)
#plot(dataset)

plot(dataset, type="o", col="blue")

# Create a title with a red, bold/italic font
title(main="Weight-Height Chart", col.main="red", font.main=4)