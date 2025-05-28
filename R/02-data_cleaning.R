library(tidyverse)

# Import data from data/raw folder
clothing_data <- read_csv("data/raw/cloting_data.csv")

# Change column names
colnames(clothing_data) <- c("date", "age", "gender", "eth_status",
                             "continent", "income", "env_conscious",
                             "new_clothes", "new_items", "brand_sust",
                             "second_hand", "motivation", "disposal",
                             "disposal_reason", "repair", "email", 
                             "disposal_thrift", "disposal_flea_market",
                             "disposal_fam_friends", "disposal_sell_online", "disposal_recycling_bins",
                             "get_thrift", "get_hand_me_down", "get_swaps",
                             "get_gifts", "get_make_clothes", "disposal_trash",
                             "disposal_textile_center", "study_field")

# Change relevant categories to single number and numeric data type
clothing_data_cleaned <- clothing_data |> 
  mutate(income = case_when(
    income == "less than 999" ~ "500",
    income == "1000 - 1999" ~ "1500",
    income == "2000 - 3000" ~ "2500",
    income == "3000 or greater" ~ "3500")) |> 
  mutate(second_hand = case_when(
    second_hand == "Zero" ~ "0",
    second_hand == "1-25" ~ "12.5",
    second_hand == "26-50" ~ "37.5",
    second_hand == "51-75" ~ "62.5",
    second_hand == "76-100" ~ "87.5"))

# Relocate columns for better organization
clothing_data_cleaned <- clothing_data_cleaned |> 
  relocate(study_field, .after = eth_status) |> 
  relocate(disposal_trash, .after = disposal_recycling_bins) |> 
  relocate(disposal_textile_center, .after = disposal_trash) |> 
  relocate(email, .after = get_make_clothes)

# Ensure relevant columns are numeric
clothing_data_cleaned <- clothing_data_cleaned |> 
  mutate(across(c(new_items, env_conscious, second_hand), as.numeric))

# Export processed data in correct folder
write_csv(clothing_data_cleaned, "data/processed/clothing_data_cleaned.csv")


