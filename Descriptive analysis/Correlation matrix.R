library(Hmisc)
require(Hmisc)

library(sjPlot)
library(dplyr)

Percentages_data <- Percentages %>% select(-Direction, -DATE)

fix(Percentages_data)
names(Percentages_data)


#Correlation matrix
tab_corr(Percentages_data,
         na.deletion ="pairwise",
         corr.method = "pearson",
         triangle = "lower",
         fade.ns = FALSE,
         file = "corr_matrix_V2.doc"
)
