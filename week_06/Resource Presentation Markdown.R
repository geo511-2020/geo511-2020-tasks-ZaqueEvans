install.packages("plotly")

install.packages('knitr', dependencies = TRUE)

library(ggplot2)
library(plotly)


library(plotly)
fig <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
fig

library(plotly)

data <- data.frame(Animals, SF_Zoo, LA_Zoo)
Animals <- c("giraffes", "orangutans", "monkeys")
SF_Zoo <- c(20, 14, 23)
LA_Zoo <- c(12, 18, 29)

fig <- plot_ly(data, x = ~Animals, y = ~SF_Zoo, type = 'bar', name = 'SF Zoo')
fig <- fig %>% add_trace(y = ~LA_Zoo, name = 'LA Zoo')
fig <- fig %>% layout(yaxis = list(title = 'Count'), barmode = 'group')

fig

plot_ly(diamonds, x = ~cut)

plot_ly(diamonds, x = ~cut, y = ~clarity)

plot_ly(diamonds, x = ~cut, color = ~clarity, colors = "Accent")

?add_trace
?plotly
