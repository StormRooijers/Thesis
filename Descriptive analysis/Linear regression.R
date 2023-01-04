#Linear regressions
library(MASS)
library(dplyr)
library(ggplot2)


Percentages_data <- Percentages %>% select(-Direction, -DATE)

fix(Percentages_data)
names(Percentages_data)

#Regression
whole_model <- lm(BTC_price_t1 ~. -DJIA, data = Percentages_data)

summary(whole_model)

#plotting variables 
ggplot(Percentages_data, aes(x = Google_interest, y = BTC_price_t1)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship between BTC_price_t1 and Google_interest") + 
  theme(plot.title = element_text(face = "bold", hjust = 0.5))

#VIF
vif(whole_model)

#Residual plot
plot_1 <- plot(predict (whole_model), residuals (whole_model))
plot_1 + title("Residual plot")
