# Jennifer Rink - R Code for Statistical Graphs using Data set "Airquality"

data("airquality")

# str() displays the internal structure of an R object and also gives a quick overview of the rows and columns of the dataset.
str(airquality)

# head(data, n) outputs the top n elements in the dataset and tail(data, n) outputs the bottom n elements in the dataset.
head(airquality, 3)
tail(airquality, 3)

# summary() displays descriptive statistics for every variable in the dataset.
summary(airquality)


# plot() is a generic function for plotting R objects
plot(airquality$Ozone)

plot(airquality$Ozone, airquality$Wind)
# This plot shows that Wind and Ozone have a somewhat negative correlation.

plot(airquality$Ozone, xlab= 'Ozone Concentration', ylab='Number of Instances', main='Ozone levels in NY city', col= 'blue')

# Horizontal Bar Plot
barplot(airquality$Ozone, main='Ozone Concentration in Air', xlab='Ozone Levels', col='green', horiz=TRUE)

# Vertical Bar Plot
barplot(airquality$Ozone, main='Ozone Concentration in Air', xlab='Ozone Levels', col='green', horiz=FALSE)

# Histogram
hist(airquality$Solar.R)

hist(airquality$Solar.R, main= 'Solar Radiation values in air', xlab='Solar Rad.', col= 'red')

# Boxplot
boxplot(airquality$Solar.R)

# Multiple Boxplots
boxplot(airquality[,0:4], main='Multiple Boxplots')


# ggplot2 : enables users to create sophisticated visualisations with little code.
install.packages("ggplot2")
library(ggplot2)

# Loading the dataset
attach(mtcars)




