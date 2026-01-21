3+6

4/7

3^2 #comment

#variables

area_hectares <- 2 #Alt+ minus
x <- 10
x1 <- 20
x2 <- 23
x_2 <- 23
x.6 <- 55
are_acres <- area_hectares * 2.47

are_acres <- 60

#Exercise
r_length <- 10
r_width <- 30
r_area <- r_length*r_width

#Functions
b <- sqrt(5)

round(3.145678,2)

?round

abs(-4)

hh_members <- c(3,8,12,5)
hh_members

class(hh_members)

wall_type <- c("muddaub","burntbricks","sunbricks")
wall_type

class(wall_type)
length(hh_members)

str(hh_members)

possessions <- c("bicycle", "radio", "television")
possessions <- c(possessions, "mobile_phone")
possessions <- c("car", possessions)
possessions

x <- c(3, 3:7, -1, 5)
x
x <- c(x,1:2,x)
x

num_char <- c(1,2,3,"a")
class(num_char)

num_logical <- c(1,2,3, TRUE)
class(num_logical)

char_logical <- c("a","b","c", TRUE)
class(char_logical)

wall_type
wall_type[3]
wall_type[c(2,3,1,1,1,1,2,2,3,1)]
hh_members
hh_members[-c(1,3)]

hh_members[c(T,F,T,T)]

hh_members > 5
hh_members[hh_members > 5]
hh_members[hh_members < 4 | hh_members > 7]
hh_members[hh_members >= 4 & hh_members <= 7 & hh_members!=6]

# > < >= <= != == - comparison operators

# & - and, | - or

possessions[possessions == "car" | possessions == "bicycle"]

possessions %in% c("car","bicycle")

#missing data

rooms <- c(1,5,3,NA, 5, 3)
rooms

mean(rooms)
mean(rooms, na.rm = T)
max(rooms, na.rm = T)
min(rooms, na.rm = T)
sum(rooms, na.rm = T)

anyNA(rooms)

is.na(rooms)

rooms[!is.na(rooms)]
sum(is.na(rooms))

rooms[complete.cases(rooms)]

#Exercise
rooms <- c(1, 2, 1, 1, NA, 3, 1, 3, 2, 1, 1, 8, 3, 1, NA, 1)
median(rooms,na.rm = T)
rooms <- rooms[complete.cases(rooms)]
rooms[rooms>=2]
