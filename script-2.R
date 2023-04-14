#activating repositories ----
setRepositories()

#importing/exporting data sets----
data()

rq<-mtcars

View(rq)

install.packages("writexl" , dependencies = TRUE)
library(writexl)

write_xlsx(rq, "cars.xlsx")     #exporting data set

mp <- read_xlsx("cars.xlsx")    #importing data set

View(mp)


# activating libraries ----
install.packages("WriteXLS")
library(WriteXLS)
install.packages("readxl")
library(readxl)

install.packages("ggplot2",dependencies = TRUE)
library(ggplot2)
install.packages("tidyverse" , dependencies = TRUE)
library(tidyverse)

# importing data set ----
Om<- read.csv("~/datasets-kaggle/Olympic-medals.csv")
View(Om)

#plotting ----
colnames(Om)
# bar plot----
ggplot(Om , mapping = aes(x = Year))+geom_bar()
ggplot(Om , mapping = aes(x = Sport , col = Sport ))+geom_bar()
ggplot(Om , mapping = aes(x = Medal , fill = Medal))+geom_bar()

#point plot ----
ggplot(Om , mapping = aes(x = City , y = Discipline ))+geom_point()
ggplot(Om , mapping = aes(x = Year , y = Medal , col= Gender ))+geom_point()
ggplot(Om , mapping = aes(x = Gender , y = Sport))+geom_point()
ggplot(Om , mapping = aes(x = City , y = Sport,shape = Gender ))+geom_point()

# box plot ----
ggplot(Om , mapping = aes(x = Sport, y = Year , fill = Sport))+geom_boxplot()
ggplot(Om , mapping = aes(x = Medal , y = Sport , fill = Gender))+geom_boxplot()

# using built in data set 1 ----
data()

sr <- stackloss

View(sr)
colnames(sr)
ggplot(sr, mapping = aes( x = Air.Flow , y = stack.loss , fill = stack.loss))+geom_count()
ggplot(sr, mapping = aes( x = Air.Flow , y = stack.loss))+geom_bin_2d()
ggplot(sr, mapping = aes( x = Air.Flow , y = stack.loss ,col = Water.Temp ))+geom_boxplot()

# data set 2 ----
data()
df <- airquality
view(df)
colnames(df)
ggplot(df , mapping = aes( x= Ozone ))+geom_bar(col="purple")
ggplot(df , mapping = aes( x= Day , y = Solar.R , fill= Day))+geom_area()
ggplot(df , mapping = aes( x= Month , y = Wind ,fill=Temp ))+geom_col()
ggplot(df , mapping = aes( x= Month , y = Temp ))+geom_hex( col = "yellow")
ggplot(df , mapping = aes( x= Day , y = Wind , col= Wind))+geom_line()
