## Setup with working directory and filenames 
  setwd("C:/Users/isaac/Documents/Universitetet/Parmryd et al/Statistik/220614_Pollenror")
  datafile = "E1_Copy_2022_05_18_GP_data_pollenror.csv"
  pollen_dataframe = read.table(datafile, header = TRUE, sep = ",")
  pollen_dataframe

##valjer ut Avstand och GP for en hel sida
  utvald_data = pollen_dataframe [1:200, c("Avstand", "GP")]
  utvald_data
  avstand_100 = pollen_dataframe [1:200, "Avstand"]
  GP_100 = pollen_dataframe [1:200, "GP"]

## Forsok till att plotta lite
  require(stats) # for lowess, rpois, rnorm
  require(graphics) # for plot methods
  plot(utvald_data)

## Try to find peaks
  library(pracma)
  nups = 6
  findpeaks(GP_100, nups = 6, ndowns = nups, zero = "0", peakpat = NULL,
            minpeakheight = -Inf, minpeakdistance = 1,
            threshold = 0, npeaks = 0, sortstr = FALSE)
  # 
  