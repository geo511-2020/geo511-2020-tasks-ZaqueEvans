## Case Study 03
## Zaque EVans

library(ggplot2)
library(tidyverse)
library(dplyr)
library(gapminder)

?filter

gapminder %>%
  summarize(max(year))

gapmindNoKuwait <- gapminder%>%
  dplyr::filter(!country == "Kuwait")

gapmindNoKuwait

ggplot(gapmindNoKuwait, aes(lifeExp, gdpPercap, color = continent, size = 
                              pop/100000)) +
  theme_bw() +
  geom_point() +
  scale_y_continuous(trans = "sqrt") +
  facet_wrap(~year, nrow=1) +
  labs(title = "Wealth and Life Expectancy through Time",
       x="Life expectancy in years", y="GDP per capita ($US)", color="Continent",
       size="Population (100k)")

gapminder_continent <- gapmindNoKuwait %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
  pop = sum(as.numeric(pop)))

gapminder_continent

## This gave me the biggest headache for far too long 
## Kyle in other group helped with this, and I think he, himself got help too and Adam posted help in slack at one point

ggplot(gapmindNoKuwait, aes(x = year, y = gdpPercap, color = continent, group = country, fill = continent, size = pop/100000)) + 
  geom_line(data = gapmindNoKuwait, size = 0.5) +
  geom_point() +
  geom_line(data = gapminder_continent, aes(x = year, y = gdpPercapweighted), color = "black", inherit.aes = FALSE) +
  geom_point(data = gapminder_continent, aes(x = year, y = gdpPercapweighted, size = pop/100000), color = "black", inherit.aes = FALSE) +
  facet_wrap(~continent,nrow=1) +
  theme_bw() +
  labs(x = "Year", y = "GDP per capita", size = "Population (100k)")

ggsave("CaseStudy03.png", width = 15, units = "in") 


  