## setwd("D:/2021 Isaac/220614 Pollenrör")
datafile = "CSV_Copy_2022_05_18_GP_data_pollenror.csv"
pollen_dataframe = read.table(datafile, header = TRUE, sep = ";")

##väljer ut Avstånd och GP för en hel sida
utvald_data = pollen_dataframe [1:294, c("Avstand", "GP")]
utvald_data

## Försök till att plotta lite
library(tidyverse)
plot(utvald_data)

p <- ggplot(utvald_data, aes(avstand, GP))
p
p + geom_point()
