# Activating Repositories ----
setRepositories()

# Activating libraries ----
install.packages("car" , dependencies = TRUE)
library(car)
install.packages("corrplot" , dependencies = TRUE)
library(corrplot)
install.packages("palmerpenguins" , dependencies = TRUE)
library(palmerpenguins)
library(ggplot2)
library(tidyverse)

# Normality distribution ----
# Importing data

rq <- penguins
rq
view(rq)
rq <- drop_na(rq)

# Through visualization
hist(rq$body_mass_g)   # always check distribution of numeric variable
hist(rq$flipper_length_mm)
hist(rq$bill_length_mm)
 
# example of normal data ----
g <- filter(rq, island=="Biscoe" | island=="Dream")
unique(g$island)
hist(g$body_mass_g)
qqnorm(g$body_mass_g)

# example of abnormal data ----
 j <- filter(rq, species=="Adelie" | species=="Gentoo")
unique(j$species)
hist(j$flipper_length_mm)
qqnorm(j$flipper_length_mm)
qqnorm(j$bill_length_mm)
qqnorm(rq$bill_length_mm)

# Through test (shapirowilk test) ---- 
shapiro.test(rq$body_mass_g)
shapiro.test(rq$flipper_length_mm)
shapiro.test(rq$bill_length_mm)

# Homogeneity---- 
#homogeneity = same variance     # variance = data above and below mean
# Through visualization 

# dependent ~ independent
boxplot(rq$bill_length_mm ~ rq$island)
boxplot(rq$flipper_length_mm ~ rq$island)
boxplot(rq$flipper_length_mm ~ rq$species)

#using ggplot 
ggplot(rq, mapping = aes(x=island , y=flipper_length_mm , fill=island))+geom_boxplot()
ggplot(rq, mapping = aes(x=island , y=bill_length_mm , fill=island))+geom_boxplot()
ggplot(rq, mapping = aes(x=species , y=flipper_length_mm , fill=species))+geom_boxplot()
ggplot(rq, mapping = aes(x=species , y=bill_length_mm , fill=species))+geom_boxplot()

# Through test(levene test)
leveneTest(rq$bill_length_mm ~ rq$island)
leveneTest(rq$flipper_length_mm ~ rq$species)
leveneTest(rq$bill_length_mm ~ rq$species)

# Student t-test ----
# 1 sample 
t.test(rq$bill_length_mm , mu = 16.3)
t.test(rq$bill_depth_mm , mu =35.6)
t.test(rq$flipper_length_mm , mu= 14.3)

# 2 sample
t.test(rq$bill_length_mm , rq$bill_depth_mm)
t.test(rq$flipper_length_mm , rq$bill_depth_mm)
t.test(rq$bill_length_mm , rq$flipper_length_mm)

# Anova ----
ra <- aov(data=rq, formula = bill_length_mm ~ species)
ra
summary(ra)

df <- aov(data = rq , formula = flipper_length_mm ~ island)
summary(df)

#one-way anova

av = oneway.test(data = rq , formula = flipper_length_mm ~ island)
summary(av)
view(av)

# Correlation ----
 cor(x = rq$bill_depth_mm , y= rq$flipper_length_mm , method = "pearson")

 cor(x=rq$bill_length_mm , y= rq$flipper_length_mm , method = "pearson")

 # removing categorical data 
 rq<-subset(rq , select = c(-species , -sex , -island))
head(rq)
cr <- cor(rq, method = "pearson")
cr

# for visualization
corrplot(cr, method = "pie" , type = "full")
corrplot(cr , method = "shade" , type = "lower" , order = "alphabet")
corrplot(cr, method= "circle" , type  = "full" , order = "hclust")
corrplot(cr, method= "number" , type = "full" , order = "hclust")

