#Stationary tests

#Installing the Required Packages
install.packages("tidyverse")
install.packages("urca")
install.packages("forecast")
install.packages("tseries")
install.packages("TSstudio")
help(TSstudio)


#Calling the Required Packages
library(tidyverse)
library(forecast)
library(tseries)
library(urca)
library(TSstudio)



inf <- ts(Percentages$`Price_change to the next day`, start = c(2013,1,1, frequency = 365))

autoplot(inf) + ggtitle("Bitcoin price change January 2013 to August 2022") + labs(x = "Time", y = "Bitcoin Price change (t+1")

linf <- log(inf)

dinf <- diff(inf)

ldinf <- diff(log(inf), lag = 1)

#Decomposition
ts_decompose(inf, type = "additive", showline = TRUE)


#Dickey FUller <0.01 = Stationary
adf.test(inf, k=1)
adf.test(linf, k =1)
adf.test(ldinf, k = 1)

#Using the Phillips Perron Test <0.01 = Stationary
pp.test(inf)
pp.test(linf)
pp.test(ldinf)


