## Setup with working directory and file names 
  setwd("C:/Users/isaac/Documents/Universitetet/Parmryd et al/Statistik/220614_Pollenror")
  datafile = "E1_Copy_2022_05_18_GP_data_pollenror.csv"
  pollen_dataframe = read.table(datafile, header = TRUE, sep = ",")
  pollen_dataframe
  
  
##  A loop for going through the pollentubes
  i = 1
  for (i in 1:300) {
    if (
      (pollen_dataframe[i, "Avstand"] +  
       pollen_dataframe[(i + 1) , "Avstand"]) 
      == 3 ) {
      print(i)
      print("start") ##----------------------------------------------------extra
      utvald_data = pollen_dataframe [i:(i + 99), c("Avstand", "GP")]
      avstand_100 = pollen_dataframe [i:(i + 99), "Avstand"]
      GP = pollen_dataframe [i:(i + 99), "GP"]
      print(utvald_data)
      plot(utvald_data) ##------------------------------------------------extra
      
      # plot_GP_avstand(i, i + 199)
      GP_matrix = GP_peaks(GP)
      
      assign(
        paste0("GP_matrix_cell_",
               pollen_dataframe[i, "Cell"],
               "_sida_",
               pollen_dataframe[i, "Sida"]), 
        GP_matrix)
      
    }     else if (
                    (pollen_dataframe[i, "Avstand"] +  
                    pollen_dataframe[(i + 1) , "Avstand"]) 
                  == 1.5 ) {
        print(i) ##-----------------------------------------------extra
        utvald_data = pollen_dataframe [i:(i +199), c("Avstand", "GP")]
        avstand_100 = pollen_dataframe [i:(i +199), "Avstand"]
        GP = pollen_dataframe[i: (i + 199), "GP"]
        print(GP) ##---------------------------------------------extra
        plot(utvald_data)
       
      # plot_GP_avstand(i, i + 199)
      
      GP_matrix = GP_peaks(GP, halfpixel = TRUE)
      print(GP_matrix) ##-------------------------------------------------extra
      assign(
        paste0("GP_matrix_cell_",
               pollen_dataframe[i, "Cell"],
               "_sida_",
               pollen_dataframe[i, "Sida"],
               "_halfpixel"), 
        GP_matrix)
    }
  }
  
  GP_test = GP_peaks(GP_200, halfpixel = TRUE)
## Naming experiments
  # GP_test
  # GP_test ## is a matrix
  # assign(paste0("GP_test", 1), GP_test)
  # print(get(paste("GP_test", 1, sep = "")))
  # GP_test1
  assign(
    paste0("GP_matrix_cell_",
           pollen_dataframe[1, "Cell"],
           "_sida_",
           pollen_dataframe[1, "Sida"]), 
    GP_test)
  

## Selects "Avstand" and "GP-value" for one side of the pollentube
  utvald_data = pollen_dataframe [1:200, c("Avstand", "GP")]
  avstand_100 = pollen_dataframe [1:200, "Avstand"]
  GP_200 = pollen_dataframe [1:200, "GP"]

## Plotting the 200 / first GP values for 0.5 / 1px
  require(stats) 
  require(graphics) 
  plot(utvald_data)

## Try to find peaks, col 1 = value, col 2 = peak avstand, col 3/4 = start/end
  library(pracma)
  nups = 10
  findpeaks(GP_200, nups = 10, ndowns = nups, zero = "0", peakpat = NULL,
            minpeakheight = -Inf, minpeakdistance = 1,
            threshold = 0, npeaks = 0, sortstr = FALSE)
  
##  Creating a function for selecting and plotting GP x avstånd
  plot_GP_avstand = function(from, to) {
      utvald_data = pollen_dataframe [from:to, c("Avstand", "GP")]
      avstand_100 = pollen_dataframe [from:to, "Avstand"]
      GP = pollen_dataframe [from:to, "GP"]
      plot(utvald_data)
  }

##  Creating a function for finding peaks in whole or halfpixel datasets 
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
  
 GP_test = GP_peaks(GP_200, halfpixel = TRUE)
 GP_test

print("done")
  