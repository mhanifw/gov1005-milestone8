# Load library

library(fs)
library(janitor)
library(tidyverse)

# Create directories

dir.create("data")

# Download data and copy it into shiny folder and write as objects
  
  # Cambridge building energy use
  
  download.file(url = "https://data.cambridgema.gov/api/views/72g6-j7aq/rows.csv?accessType=DOWNLOAD",
                destfile = "data/cambridge_energy_use.csv")
  
  file.copy(from = "data/cambridge_energy_use.csv",
            to = "milestone8/cambridge_energy_use.csv")