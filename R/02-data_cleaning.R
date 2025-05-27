library(tidyverse)

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

# Delete the first 9 rows (in-class responses)
filtered_data <- clothing_data |> 
  filter(!is.na(study_field))

# Change relevant categories to single number and numeric data type
cleaned_data <- filtered_data |> 
  mutate(income = case_when(
    income == "less than 999" ~ "500",
    income == "1000 - 1999" ~ "1500",
    income == "2000 - 3000" ~ "2500",
    income == "3000 or greater" ~ "3500")) |> 
  mutate(second_hand = case_when(
    second_hand == "0" ~ "0",
    second_hand == "1-25" ~ "12.5",
    second_hand == "26-50" ~ "37.5",
    second_hand == "51-75" ~ "62.5",
    second_hand == "76-100" ~ "87.5"))


class(cleaned_data)


