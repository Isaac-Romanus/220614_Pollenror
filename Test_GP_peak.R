## Setup with working directory and file names 
  setwd("C:/Users/isaac/Documents/Universitetet/Parmryd et al/Statistik/220614_Pollenror")
  datafile = "E1_Copy_2022_05_18_GP_data_pollenror.csv"
  pollen_dataframe = read.table(datafile, header = TRUE, sep = ",")

## Selects "Avstand" and "GP-value" for one side of the pollentube
  utvald_data = pollen_dataframe [1:200, c("Avstand", "GP")]
  avstand_100 = pollen_dataframe [1:200, "Avstand"]
  GP_200 = pollen_dataframe [1:200, "GP"]

## Plotting the 200 / first GP values for 0.5 / 1px
  require(stats) 
  require(graphics) 
  plot(utvald_data)

## Try to find peaks
  library(pracma)
  nups = 6 #How many steps needed to count as a peak
  findpeaks(GP_200, nups = 6, ndowns = nups, zero = "0", peakpat = NULL,
            minpeakheight = -Inf, minpeakdistance = 1,
            threshold = 0, npeaks = 0, sortstr = FALSE)

print("done")
  