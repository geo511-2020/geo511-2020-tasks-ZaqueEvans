## Zaque Evans
## GEO 511: Resource presentation
## Plotly

install.packages("plotly")

library(tidyverse)
library(plotly)

## basic histograms with diamond data

plot_ly(diamonds, x = ~cut)

layout(
  plot_ly(diamonds, x = ~cut),
  title = "Diamonds by cut histogram 1")

diamonds %>%
  plot_ly(x = ~cut) %>%
  layout(title = "Diamonds by cut histogram 2")

## Summary stats of Midwest states' college educated pop

MidwestCollegeBox <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
MidwestCollegeBox


## Different animals at San Francisco / LA Zoo
data <- data.frame(Animals, SF_Zoo, LA_Zoo)
Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)

zoos <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
zoos <- zoos %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
zoos <- zoos %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

zoos


## Diamond histograms by cut, clarity

plot_ly(diamonds, x = ~cut)

plot_ly(diamonds, x = ~cut, y = ~clarity)

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Dark2")


?RColorBrewer
