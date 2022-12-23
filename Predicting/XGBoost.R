install.packages("xgboost")
library(xgboost)

#dependent variable
train.y <- training$BTC_pricech_t1
validation.y <- validation$BTC_pricech_t1

#independent variables
train.x <- as.matrix(training[,c(1,3:ncol(training))])
validation.x <- as.matrix(validation[,c(1,3:ncol(validation))])

#Parameters
parameters <- list(eta = 0.1,
                   eval_metric = "mae")
                  
# Train the model
model <- xgboost(data = train.x,
                 label = train.y,
                 params = parameters,
                 nrounds = 100, 
                 objective = "reg:linear",
                 verbose = 1)


#Predicting on validation set
predictions <- predict(model, newdata = validation.x)

#Evaluating model
mean(validation.y)

mae <- mean(abs(validation.y - predictions))
mse <- mean((validation.y - predictions)^2)
rmse <- sqrt(mean((validation.y - predictions)^2))
r2 <- 1 - sum((validation.y - predictions)^2) / sum((validation.y - mean(validation.y))^2)

#Plot of the predicted and true values
plot(validation.y, predictions, xlab = "True values", ylab = "Predicted values")
abline(a = 0, b = 1)

