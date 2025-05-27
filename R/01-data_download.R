library(tidyverse)
library(googlesheets4)

# Import data from google sheets
survey_responses <- read_sheet("https://docs.google.com/spreadsheets/d/1FUQ9N3gHNwbgX98BTXbpDgU4MWLPs3uGeCJAsf0OLGQ/edit?resourcekey=&gid=722433670#gid=722433670")

# Export raw data in correct folder
write_csv(survey_responses, "data/raw/cloting_data.csv")

#rm(list = ls())