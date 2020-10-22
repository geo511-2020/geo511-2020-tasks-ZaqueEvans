
## Zaque Evans - CS01 - GEO 511
## due Sep_10_2020

##intstall and load gglpot2
library(ggplot2)

## load dataset
data(iris)

?mean
## inspect vars
iris$Sepal.Length
iris$Petal.Length
summary(iris$Petal.Length)

## Mean of Petal.Length var
mean(iris$Petal.Length) 

## Create new var for mean of petal length
petal_length_mean <- mean(iris$Petal.Length)

petal_length_mean

## Plot Histogram of Petal.Length

?hist

## histogram using [hist] func
## unsure of petal length units (mm, cm, in?); omitted in label
hist(iris$Petal.Length)
hist(iris$Petal.Length, main="Iris Petal Lengths", xlab="Length of petal", 
     border="black", col="green", ylim=c(0, 50))

## histogram using [ggplot2] 
?aes
?seq

ggplot(data=iris, aes(x=Petal.Length)) + 
  geom_histogram(breaks=seq(0,7, by=0.5),
col="black", fill="green") + labs(title="Iris Petal Length Histogram", x="Petal Length", y="Frequency") + 
  scale_y_continuous(breaks = seq(0, 40, by = 5))
## found scale_ command via Googling 

#Done
