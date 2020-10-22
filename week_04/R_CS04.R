## Zaque Evans - CS04 - GEO 511
## due Oct_1_2020
## load packages
library(tidyverse)
library(ggplot2)
library(nycflights13)
library(dplyr)
library(dbplyr)

?nycflights13

nycflights13_sqlite

str(nycflights13::airlines) 

## Examine data
nycflights13::airports
nycflights13::flights
nycflights13::planes
nycflights13::weather

str(airports)
str(flights)

view(airports)
view(flights)

## Join airport data to flight data
airports_flights_joined <- left_join(flights, airports, by = c("dest" = "faa"))

airports_flights_joined

view(airports_flights_joined)

##arrange joined data by distance, in descending order
farthestAirport_NYC <- airports_flights_joined %>%
  arrange(desc(distance)) %>%
  slice(1)
## Erik helped by showing us the slice func

view(farthestAirport_NYC)

## Honolulu International is farthest from NYC area 
  ## airports. 4983 mi. 
