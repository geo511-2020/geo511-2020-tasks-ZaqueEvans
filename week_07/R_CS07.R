

library(tidyverse)
library(reprex)
library(sf)

library(spData)
data(world)

ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)
reprex()

reprex_save <- reprex({ggplot(world,aes(x=gdpPercap, y=continent, color=continent))+
  geom_density(alpha=0.5,color=F)}, venue = "html")

reprex_save
