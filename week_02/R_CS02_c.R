## Zaque Evans - CS02 - GEO 511
## due Sep_17_2020

## install if needed (do this exactly once):
install.packages("usethis")

library(usethis)
use_git_config(user.name = "Zaque Evans", user.email = "Zacharye@buffalo.edu")

getwd()
?setwd
setwd("E:\\2020_2021\\FALL_2020\\Fall_2020_SpatialDataScienceGEO511")

library(tidyverse)
library(ggplot2)

dataurl="https://raw.githubusercontent.com/AdamWilsonLab/GEO511/master/CS_02.csv"
temp=read_csv(dataurl,
              skip=1, #skip the first line which has column names
              na="999.90", # tell R that 999.90 means missing in this dataset
              col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))

Buffalo_Temp_Data <- temp

Buffalo_Temp_Data

str(Buffalo_Temp_Data)
summary(Buffalo_Temp_Data)
view(Buffalo_Temp_Data)

DF_Temp <- data.frame(Buffalo_Temp_Data)

DF_Temp

view(DF_Temp)
##mean of June July August

ggplot(DF_Temp, aes(YEAR, JJA)) + 
  geom_line() +
  geom_smooth() + 
  ggtitle('Avg. Tempertaure for Jun/Jul/Aug, Buffalo NY, 1881-2020') +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Year") +
  ylab("Temperature (C)")
ggsave("Buff_Summer_Temps.png")
 
