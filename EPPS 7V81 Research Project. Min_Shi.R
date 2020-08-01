## EPPS 7V81 Research Project.R
## Min Shi
## July 22th, 2020


# clear environment, set working directory and read the data
rm(list=ls())
setwd("/Users/min/OneDrive - The University of Texas at Dallas/UTD/Courses/EPPS 7V81 Advanced Data Programming/Research Project")

mydata <- read.csv("/Users/min/OneDrive - The University of Texas at Dallas/UTD/Courses/EPPS 7V81 Advanced Data Programming/Research Project/Code and Data/Dataset1.csv")

# load the libraries
library(aod)
library(ggplot2)
library(lubridate)  #work with dates
library(stargazer) #creates LATEX code, HTML code and ASCII text for well-formatted regression tables
library(car) #work with vif values
library(MASS) #work with Ridge regression

# Rename the columns
names(mydata) <- c("Date", "ChinaTariff", "USTariff", "USBalance", "USExports", "USImports", "USExChina", "USImChina", "USBaChina", 
                   "USGDP",  "USUnemp", "USCPI")
colnames(mydata)

# Change the time variable from character type into Date type
mydata$Date <- as.Date(mydata$Date)

class(mydata$Date)


############################################################
# Check whether there is multicollinearity among the two IVs
############################################################

fit <- lm(USExports ~ ChinaTariff + USTariff, data = mydata)
summary(fit)

stargazer(vif(fit), type = "text")

#### The VIF values of two IVs are 11.841 which shows that there is multicollinearity relationship between them.
#### Thus, I will build linear regression models separately for these two independent variables to further test hypotheses.
#########################
# Table 1, 2, 3, 4, 5, 6
#########################
fit1 <- lm(USExports ~ ChinaTariff, data = mydata)
summary(fit1)
fit2 <- lm(USImports ~ ChinaTariff, data = mydata)
summary(fit2)
fit3 <- lm(USBalance ~ ChinaTariff, data = mydata)
summary(fit3)
fit4 <- lm(USExChina ~ ChinaTariff, data = mydata)
summary(fit4)
fit5 <- lm(USImChina ~ ChinaTariff, data = mydata)
summary(fit5)
fit6 <- lm(USBaChina ~ ChinaTariff, data = mydata)
summary(fit6)
fit7 <- lm(USGDP ~ ChinaTariff, data = mydata)
summary(fit7)
fit8 <- lm(USUnemp ~ ChinaTariff, data = mydata)
summary(fit8)
fit9 <- lm(USCPI ~ ChinaTariff, data = mydata)
summary(fit9)

fit10 <- lm(USExports ~ USTariff, data = mydata)
summary(fit10)
fit11 <- lm(USImports ~ USTariff, data = mydata)
summary(fit11)
fit12 <- lm(USBalance ~ USTariff, data = mydata)
summary(fit12)
fit13 <- lm(USExChina ~ USTariff, data = mydata)
summary(fit13)
fit14 <- lm(USImChina ~ USTariff, data = mydata)
summary(fit14)
fit15 <- lm(USBaChina ~ USTariff, data = mydata)
summary(fit15)
fit16 <- lm(USGDP ~ USTariff, data = mydata)
summary(fit16)
fit17 <- lm(USUnemp ~ USTariff, data = mydata)
summary(fit17)
fit18 <- lm(USCPI ~ USTariff, data = mydata)
summary(fit18)

#### Show every three models in one table
stargazer(fit1, fit2, fit3, type="text", title="Linear Regression Results -- Model 1~3",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table1.txt")

stargazer(fit4, fit5, fit6, type="text", title="Linear Regression Results -- Model 4~6",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table2.txt")

stargazer(fit7, fit8, fit9, type="text", title="Linear Regression Results -- Model 7~9",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table3.txt")

stargazer(fit10, fit11, fit12, type="text", title="Linear Regression Results -- Model 10~12",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table4.txt")

stargazer(fit13, fit14, fit15, type="text", title="Linear Regression Results -- Model 13~15",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table5.txt")

stargazer(fit16, fit17, fit18, type="text", title="Linear Regression Results -- Model 16~18",
          ci=TRUE, ci.level=0.90, single.row=TRUE, digits=1, out="table6.txt")

#### Thus, I will try to use Ridge regression models.

####################################################################
# Use Ridge Regression to show the relationships between IVs and DVs
####################################################################
## Ridge regression model for USBalance
ridge1 <- lm.ridge(USBalance ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE)
matplot(x=ridge1$lambda, y=t(ridge1$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USBalance ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge1$lambda[which.min(ridge1$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.0340
ridge1 <- lm.ridge(USBalance ~ ChinaTariff + USTariff,lambda = 0.0340, model = TRUE, data = mydata)
ridge1


## Ridge regression model for USExports
ridge2 <- lm.ridge(USExports ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge2$lambda, y=t(ridge2$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USExports ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge2$lambda[which.min(ridge2$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 1
ridge2 <- lm.ridge(USExports ~ ChinaTariff + USTariff,lambda = 1, model = TRUE, data = mydata)
ridge2

## Ridge regression model for USImports
ridge3 <- lm.ridge(USImports ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge3$lambda, y=t(ridge3$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USImports ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge3$lambda[which.min(ridge3$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.0245
ridge3 <- lm.ridge(USImports ~ ChinaTariff + USTariff,lambda = 0.0245, model = TRUE, data = mydata)
ridge3

## Ridge regression model for USExChina
ridge4 <- lm.ridge(USExChina ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge4$lambda, y=t(ridge4$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USExChina ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge4$lambda[which.min(ridge4$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 1
ridge4 <- lm.ridge(USExChina ~ ChinaTariff + USTariff,lambda = 1, model = TRUE, data = mydata)
ridge4

## Ridge regression model for USImChina
ridge5 <- lm.ridge(USImChina ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge5$lambda, y=t(ridge5$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USImChina ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge5$lambda[which.min(ridge5$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.1066
ridge5 <- lm.ridge(USImChina ~ ChinaTariff + USTariff,lambda = 0.1066, model = TRUE, data = mydata)
ridge5

## Ridge regression model for USBaChina
ridge6 <- lm.ridge(USBaChina ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge6$lambda, y=t(ridge6$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USBaChina ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge6$lambda[which.min(ridge6$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.0930
ridge6 <- lm.ridge(USBaChina ~ ChinaTariff + USTariff,lambda = 0.0930, model = TRUE, data = mydata)
ridge6

## Ridge regression model for USGDP
ridge7 <- lm.ridge(USGDP ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge7$lambda, y=t(ridge7$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USGDP ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge7$lambda[which.min(ridge7$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.0610
ridge7 <- lm.ridge(USGDP ~ ChinaTariff + USTariff,lambda = 0.0610, model = TRUE, data = mydata)
ridge7

## Ridge regression model for USUnemp
ridge8 <- lm.ridge(USUnemp ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge8$lambda, y=t(ridge8$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USUnemp ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge8$lambda[which.min(ridge8$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.5908
ridge8 <- lm.ridge(USUnemp ~ ChinaTariff + USTariff,lambda = 0.5908, model = TRUE, data = mydata)
ridge8

## Ridge regression model for USCPI
ridge9 <- lm.ridge(USCPI ~ ChinaTariff + USTariff, lambda = seq(0,1, length = 2000), data = mydata, model = TRUE) 
matplot(x=ridge9$lambda, y=t(ridge9$coef), xlab = expression(lamdba), ylab= "Cofficients", type = "l", lty = 1:20) 
legend('topright',c("ChinaTariff", "USTariff"), col = 1:2, lty = 1:2)
select(lm.ridge(USCPI ~ ChinaTariff + USTariff, lambda = seq(0, 1, length = 2000), data = mydata))
abline(v = ridge9$lambda[which.min(ridge9$GCV)]) # From the figure, the coefficient of IVs tend to be stabile when lambad = 0.1231
ridge9 <- lm.ridge(USCPI ~ ChinaTariff + USTariff,lambda = 0.1231, model = TRUE, data = mydata)
ridge9

print(ridge1)
print(ridge2)
print(ridge3)
print(ridge4)
print(ridge5)
print(ridge6)
print(ridge7)
print(ridge8)
print(ridge9)
