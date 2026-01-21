rm(list=ls())

library(tidyverse)
library(here)
path <- here("data", "SAFI_clean.csv")
interviews <- read_csv(path, na = "NULL")
view(interviews)

class(interviews)

dim(interviews)
nrow(interviews)
ncol(interviews)

head(interviews, n=10)
tail(interviews)

names(interviews)
colnames()
rownames()

#Summary
str(interviews)
summary(interviews)
glimpse(interviews)

library(psych)
describe(interviews$rooms)

interviews[2,1] # 1 - row, 2 - col
interviews[[2]]

interviews["village"]

interviews$no_membrs
#Exercise
interviews_100 <- interviews[100, ]

interviews_last <- interviews[nrow(interviews)]

interviews_middle <- interviews[median(1:nrow(interviews))]

#FACTORS
respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))

levels(respondent_floor_type)

nlevels(respondent_floor_type)

as.numeric(respondent_floor_type)

respondent_floor_type <- fct_recode(respondent_floor_type, brick = "cement")
respondent_floor_type

respondent_floor_type_ordered <- factor(respondent_floor_type,
                                        ordered = TRUE)
respondent_floor_type_ordered

## create a vector from the data frame column "memb_assoc"
memb_assoc <- interviews$memb_assoc


## convert it into a factor
memb_assoc <- as.factor(memb_assoc)

## let's see what it looks like
memb_assoc

plot(memb_assoc)

##Dates

library(lubridate)

dates <- interviews$interview_date
class(dates)

dates

interviews$day <- day(dates)
interviews$month <- month(dates)
interviews$year <- year(dates)
interviews
view(interviews)

char_dates= c("7/31/2026", "8/8/2026", "4/30/2026")

as_date(char_dates, format = "%m/%d/%Y")

ymd(char_dates)
dmy(char_dates)
mdy(char_dates)

interviews$new_date <- ymd(interviews$interview_date)
view(interviews)
