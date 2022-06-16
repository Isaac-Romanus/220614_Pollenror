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

## Try to find peaks, col 1 = value, col 2 = peak avstånd, col 3/4 = start/end
  library(pracma)
  nups = 10
  findpeaks(GP_200, nups = 10, ndowns = nups, zero = "0", peakpat = NULL,
            minpeakheight = -Inf, minpeakdistance = 1,
            threshold = 0, npeaks = 0, sortstr = FALSE)
  
  plot_GP_avstånd = function(from, to) {
      utvald_data = pollen_dataframe [from:to, c("Avstand", "GP")]
      avstand_100 = pollen_dataframe [from:to, "Avstand"]
      GP = pollen_dataframe [from:to, "GP"]
      plot(utvald_data)
  }
  
  GP_peaks = function(GP_vector, nups = 10, halfpixel = FALSE) {
            library(pracma)
            peaks_matrix =  findpeaks(GP_vector, nups = nups, ndowns = nups, 
                            zero = "0", peakpat = NULL,minpeakheight = -Inf, 
                            minpeakdistance = 1, threshold = 0, npeaks = 0, 
                            sortstr = FALSE)
            
                     if (halfpixel == TRUE) {
                      half_peaks_mat = peaks_matrix[, 2:4] / 2
                      peaks_matrix = cbind(peaks_matrix[, 1], half_peaks_mat)
                     }
            
            peaks_matrix
  }
 GP_peaks(GP_200, halfpixel = TRUE)

print("done")
  