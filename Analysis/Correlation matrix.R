library(Hmisc)
require(Hmisc)

library(sjPlot)
library(dplyr)



cor_1 <- round(cor(Numeric_2013_2022_met_TradeV_aangepast),2)
               
cor_2 <- rcorr(as.matrix(Numeric_2013_2022_met_TradeV_aangepast), type="pearson")


cor_2 <-Hmisc::rcorr(as.matrix(Correlation_matrixV2), type="pearson" )

cor_5 <- tab_corr(Correlation_matrix,
                  na.deletion ="pairwise",
                  corr.method = "pearson",
                  triangle = "lower",
                  fade.ns = FALSE,
                  file = "Correlation_Matrix.doc")

#Dropping date and Direction

Correlation_matrixV1<- Percentages_2017_2022[ -c(1,2)  ] 

#Dropping volatility and wiki search --> ONLY 2 which are not significant *** for BTC price

Correlation_matrixV2 <- Correlation_matrixV1[-c(12,17)]


#There is no difference in correlation between BTC(t1) and BTC(t) --> dus daarom ook alleen BTC gebruikt!! 
tab_corr(Percentages_data,
         na.deletion ="pairwise",
         corr.method = "pearson",
         triangle = "lower",
         fade.ns = FALSE,
         file = "corr_matrix_V2.doc"
         )

#Where to save?
getwd()

corr_matrix_V2







