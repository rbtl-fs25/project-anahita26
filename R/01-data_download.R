library(tidyverse)
library(googlesheets4)

# Import data from google sheets
survey_responses <- read_sheet("https://docs.google.com/spreadsheets/d/1cjFci12yRxlCgHr1N_c6NOE5upVzh_8CKqLv03BZyt4/edit?gid=722433670#gid=722433670")

# Export raw data in correct folder
write_csv(survey_responses, "data/raw/cloting_data.csv")

#rm(list = ls())