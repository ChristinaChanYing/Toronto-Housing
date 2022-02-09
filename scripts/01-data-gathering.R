#### Preamble ###
# Purpose: Clean the Neighbourhood Crime Rates data downloaded from Toronto Open Data
# Author: Christina Chan-Ying
# Date: February 1 2022
# Contact: christina.chanying@mail.utoronto.ca
# Pre-req: None

#### Workspace Set-Up ###
# install.packages("opendatatoronto")
# install.packages("tidyverse")
library(tidyverse)
library(opendatatoronto)


#### Get data ###
# Based on: https://open.toronto.ca/dataset/toronto-shelter-system-flow/ 
# Each dataset is part of a package of data. These packages have unique ids. We can find the unique ID by going to the webpage for the dataset e.g. see above.
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")


# Within each package there are a bunch of different resources, e.g. datasets. We use the unique ID to get them.
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")

# We want a specific dataset that has information about the people entering and leaving the shelter system each month.
datastore_resources <- filter(resources, tolower(format) %in% c('csv'))


# Get the dataset
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data


#### Save ####
write_csv(data, "inputs/data/shelter_flow_data.csv")
