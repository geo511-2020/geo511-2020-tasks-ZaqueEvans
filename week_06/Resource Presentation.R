## Zaque Evans
## GEO 511: Resource presentation
## Actually gave presentation on Week 8
## Plotly

install.packages("plotly")
install.packages("plyr")

library(tidyverse)
library(plotly)
library(plyr)

## basic histograms with diamond data

diamonds %>%
  plot_ly(x = ~cut) %>%
  layout(title = "Diamonds by cut histogram")

plot_ly(diamonds, x = ~cut, y = ~clarity)

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Pastel2")

##Colors used from ColorBrewer


## Different animals at San Francisco / LA Zoo
data <- data.frame(Animals, SF_Zoo, LA_Zoo)
Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)

zoos <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
zoos <- zoos %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
zoos <- zoos %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

zoos

## Summary stats of Midwest states' college educated pop

MidwestCollegeBox <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
MidwestCollegeBox


## Plotting with ggplot2

cdat <- ddply(dat, "cond", summarize, rating.mean=mean(rating))

## Interactive density plots with means

p <- ggplot(dat, aes(x=rating, colour=cond)) +
  geom_density() +
  geom_vline(data=cdat, aes(xintercept=rating.mean),
             linetype="dashed", size=1) +
            theme(plot.title = "Red and Blue data with means")

RedBluePlots <- ggplotly(p)

RedBluePlots
