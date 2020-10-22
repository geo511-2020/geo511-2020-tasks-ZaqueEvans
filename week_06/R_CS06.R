
getwd()
install.packages(ncdf4)
install.packages("devtools")
library(raster)
library(sp)
library(spData)
library(tidyverse)
library(devtools)
devtools::install_github("mdsumner/ncdf4")
library(sf)

library(ncdf4)
tmean <- raster("absolute.nc")
plot(tmean)

head(tmean)
str(tmean)

data(world)
head(world)
plot(world)
world_noAnt <- filter(world, continent !="Antarctica") 
world_noAnt

plot(world_noAnt)

world_sp <- as(world_noAnt, "Spatial")
world_sp

## temp unit already in degrees C 

tempC_maxCountry <- raster::extract(tmean, world_noAnt, fun = max, na.rm = 1,
                small = 1, sp = 1)
tempC_maxCountry


maxCountryTemp_sf <- st_as_sf(tempC_maxCountry)
head(maxCountryTemp_sf)
str(maxCountryTemp_sf)
colnames(maxCountryTemp_sf)
plot(maxCountryTemp_sf)

SurfaceTemp_df <- maxCountryTemp_sf %>%
  rename(Surface_Temp = CRU_Global_1961.1990_Mean_Monthly_Surface_Temperature_Climatology)


head(SurfaceTemp_df)

ggplot(data = SurfaceTemp_df) +
  geom_sf(aes(fill = Surface_Temp)) +
  scale_fill_viridis_c(name = "Annual\nMaximum\nTemperature (C)") +
  theme(legend.position = "bottom")

?filter
TempTable <- SurfaceTemp_df %>%
  group_by(continent) %>%
  top_n(1, Surface_Temp) %>%
  as.data.frame()

TempTableClean <- select(TempTable, "name_long", "continent", "Surface_Temp")
TempTableClean

TempTableOrdered <- arrange(TempTableClean, desc(Surface_Temp))
TempTableOrdered


