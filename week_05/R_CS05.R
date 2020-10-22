library(spData)
library(sf)
library(tidyverse)
library(units)
# library(units) #this one is optional, but can help with unit conversions.

#load 'world' data from spData package
data(world)  
# load 'states' boundaries from spData package
data(us_states)
# plot(world[1])  #plot if desired
# plot(us_states[1]) #plot if desired
albers="+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

world_sf <- st_as_sf(world)
world_sf

us_states_sf <- st_as_sf(us_states)
us_states_sf

head(world_sf)
head(us_states_sf)
world_reproj <- st_transform(world_sf, albers) 
world_reproj

us_states_reproj <- st_transform(us_states_sf, albers)
us_states_reproj
head(us_states_reproj)

plot(world_reproj[1])
plot(us_states_reproj[1])

canada_filter <- filter(world_reproj, name_long == "Canada")
canada_filter

plot(canada_filter)
canada_10kBuff <- st_buffer(canada_filter, 10000)
canada_10kBuff
head(canada_10kBuff)
plot(canada_10kBuff, max.plot = 10)

ny_state <-  filter(us_states_reproj, NAME == "New York")
ny_state
plot(ny_state)

border_object <- st_intersection(canada_10kBuff, ny_state) 
border_object

plot(border_object)

ggplot() +
  geom_sf(data = ny_state) + 
  geom_sf(data = border_object, aes(fill = "red"), show.legend = FALSE) +
  ggtitle("New York State land area within 10km of Canada")

border_area <- st_area(border_object) %>%
  set_units(km^2)
border_area

