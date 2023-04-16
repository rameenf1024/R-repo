#Activating Repositories ----
setRepositories()

#Libraries used in data transformation ----
install.packages("nycflights13" , dependencies = TRUE)
library(nycflights13)
install.packages("tidyverse" , dependencies = TRUE)
library(tidyverse)
install.packages("dplyr" , dependencies = TRUE)
library(dplyr)

#Importing data set ----
rq <- nycflights13::flights
View(rq)
colnames(rq)

#Using filter function ----
#using "="
sd <- filter(rq , month==2)
sd <- filter(rq , month==4, day==8)

or <- filter(rq , origin =="LGA")
View(or)

#using "<" and ">"
ar <- filter(rq ,arr_delay > 700 )
View(ar)
ar <- filter(rq ,hour < 5 )
View(ar) 

#using logical operators ----

#Or(|) operator works as intersection in sets :
z <- filter(rq, month==2 | month==8)
z <- filter (rq, day== 4 | day==12 | day==24)
View(z)

#And(&) operator works as union in sets:
p <- filter(rq , month==5 & month==10)
View(p)     # as there is nothing common in month 5 and 9 it will not show anything

# using "!"
k <- filter(rq , month==3 & !month==9)    #only those values from y will appear which are not common in x and y
View(k)

f <- filter(rq , month >3 | month< 9)
f <- filter(rq , month < 2 | month <7)
View(f)

#Using unique function ----
# it tells how many unique values exist in our variable
unique(rq$origin)
unique(rq$hour)


 #Using distinct function ----
# it removes duplicate values from variable
distinct(rq , rq$day)
distinct(rq , rq$arr_time)


#Using select function ----
m <- select(rq,"year" , "day" , "arr_time" , "hour")
m <- select(rq, "month" , "origin" , "carrier" , "air_time" , "distance")
View(m)

#Using summarise function ----
#use to summarise data

summarise(rq, avg=mean(rq$distance))
summarise(rq, avg=mode(rq$distance))
summarise(rq, avg=median(rq$distance))

#Using count function ----
count(rq, u="origin")
count(rq, l="hour" ,n="arr_delay" , a="day" )

#Using pipe function ----        
#ctrl+shift+m
group_by(rq,origin)
rq %>% group_by(carrier)
rq %>% group_by(carrier) %>% summarise(avg= mean(arr_time))
rq %>% group_by(flight) %>% summarise(avg = mean(arr_delay)) %>% arrange(avg)
rq %>% group_by(origin) %>% summarise(v = sum(hour)) %>% arrange(v)





  
  