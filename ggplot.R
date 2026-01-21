rm(list=ls())

library(tidyverse)
library(here)

interviews_plotting <- read_csv("data_output/interviews_plotting.csv")
view(interviews_plotting)

plot(x=interviews_plotting$no_membrs, y=interviews_plotting$years_liv,
     main="Members vs Years Live",
     xlab="Members",
     ylab="Years Live")

library(lattice)

xyplot(liv_count ~ no_membrs | village, 
       data=interviews_plotting,
       main="Members vs Years Live",
       xlab="Members",
       ylab="Years Live")

interviews_plotting |>
  ggplot(aes(x=no_membrs, y = number_items)) +
  geom_point(alpha=0.5)

interviews_plotting |>
  ggplot(aes(x=no_membrs, y = number_items)) +
  geom_jitter(aes(color = village),
              alpha = 0.9, 
              width = 0.2,
              size = 5,
              height = 0.2)

interviews_plotting |>
  ggplot(aes(x=no_membrs, y = number_items)) +
  geom_count()

#Exercise
interviews_plotting |>
  ggplot(aes(x=village, y=rooms)) +
  geom_point(aes(color=respondent_wall_type),
              alpha=0.8,
              width=0.2,
              size=5,
              height=0.2)

interviews_plotting |>
  ggplot(aes(x=respondent_wall_type, y=rooms)) +
  geom_violin() +
  geom_jitter(alpha = 0.8, 
              width = 0.2,
              size = 3,
              height = 0.2)

interviews_plotting |>
  ggplot(aes(x=respondent_wall_type)) +
  geom_bar(aes(fill=village),position="dodge") +
  labs(title = "Respodent Wall Type by Village",
       x = "Respodent Wall Type",
       y = "Count of obs.") + 
  facet_wrap(~village)

percent_wall_type <- interviews_plotting %>%
  filter(respondent_wall_type != "cement") %>%
  count(village, respondent_wall_type) %>%
  group_by(village) %>%
  mutate(percent = (n / sum(n)) * 100) %>%
  ungroup()

percent_wall_type %>%
  ggplot(aes(x = respondent_wall_type, y = percent)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Proportion of wall type by village",
       x="Village",
       y="Percentage,%") +
  facet_wrap(~village) +
  theme_bw()

percent_items <- interviews_plotting %>%
  group_by(village) %>%
  summarize(across(bicycle:no_listed_items, ~ sum(.x) / n() * 100)) %>%
  pivot_longer(bicycle:no_listed_items, names_to = "items", values_to = "percent")
percent_items

my_plot <- percent_items %>%
  ggplot(aes(x = village, y = percent, fill = village)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ items) +
  labs(title = "Percent of respondents in each village who owned each item",
       x = "Village",
       y = "Percent of Respondents") +
  theme_excel_new() +
  scale_fill_excel_new()

ggsave("fig_output/ggplot-demo.png", my_plot)
