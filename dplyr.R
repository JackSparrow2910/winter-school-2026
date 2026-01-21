rm(list=ls())

library(tidyverse)
library(here)
path <- here("data", "SAFI_clean.csv")
interviews <- read_csv(path, na = "NULL")

names(interviews)
view(interviews)

select(interviews, village, interview_date, no_membrs)
interviews[, c("village", "interview_date", "no_membrs")]

select(interviews, village:respodent_wall_type)

select(interviews, c(1:3))



select(filter(interviews, village == "Chirodzo", 
              no_membrs>4, 
              years_liv >30),village:respodent_wall_type)

#pipe
interviews |> 
  filter(village == "Chirodzo", 
         no_membrs>4, 
         years_liv >30) |>
  select(village:respondent_wall_type) |>
  arrange(desc(no_membrs))

#Exercise
interviews |> 
  filter(memb_assoc=="yes") |> 
  select(affect_conflicts, liv_count, no_meals)

interviews %>%
  group_by(village) %>%
  summarize(mean_no_membrs = mean(no_membrs))

interviews_total_meals <- interviews %>%
  mutate(total_meals = no_membrs * no_meals) %>%
  filter(total_meals > 20) %>%
  select(village, total_meals)

view(interviews_total_meals)
          
          