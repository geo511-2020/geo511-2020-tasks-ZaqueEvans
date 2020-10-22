

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

ggplot(gapmindNoKuwait, aes(year,gdpPercap, color = continent, size = pop/100000)) +
  geom_line(data = gapmindNoKuwait) +
  geom_point() +
  geom_line(data = gapminder_continent, mapping = aes(year, gdpPercapweighted,
                                           color = "black", size = pop)) +
  geom_point(data = gapminder_continent, mapping = aes(year, gdpPercapweighted,
                                     color = "black", size = pop)) +
  facet_wrap(~continent, nrow=1) +
  theme_bw()
  
  labs(...)

  