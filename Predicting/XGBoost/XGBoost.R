install.packages("xgboost")
library(xgboost)


#dependent variable
train.y <- training$BTC_pricech_t1
validation.y <- validation$BTC_pricech_t1

#independent variables
train.x <- as.matrix(training[,c(1,3:ncol(training))])
validation.x <- as.matrix(validation[,c(1,3:ncol(validation))])

# Initialize variables to store the best model and its MAE
best_model <- NULL
best_mae <- Inf
best_mse <- Inf

# Create a list of variables
etas <- c(0.03, 0.04, 0.07, 0.08)
max_depths <- c(2,3,4,5,6)
nrounds <- c(100)
colsample_bytrees <- c(0.5, 0.7, 0.9)
min_child_weights <- c(1, 3, 5)
lambdas <- c(0.5, 0.8, 1,1.2, 1.5)
alphas <- c(0, 0.1,0.2,0.3)



# Loop over the values
for (eta in etas) {
  for (max_depth in max_depths) {
    for (nround in nrounds) {
      for (colsample_bytree in colsample_bytrees){
        for(min_child_weight in min_child_weights){
          for(lambda in lambdas){
            for(alpha in alphas){
    # Update the parameters list with the current values
              parameters <- list(eta = eta, max_depth = max_depth, min_child_weight = min_child_weight, lambda = lambda, alpha = alpha, colsample_bytree = colsample_bytree, eval_metric = "mae")
              
              # Train the model
              model <- xgboost(data = train.x,
                               label = train.y,
                               params = parameters,
                               nrounds = nround,
                               objective = "reg:squarederror",
                               verbose = 1)
              
              # Predict on the validation set
              predictions <- predict(model, newdata = validation.x)
              
              #mse <- mean((validation.y - predictions)^2) 
              # Calculate MAE
              mae <- mean(abs(validation.y - predictions))
              
              # If the current model has a lower MAE than the previous best model, update the best model and its MAE
              if (mae < best_mae) {
                best_model <- model
                best_mae <- mae
              }
            }
          }
        }
      }
    }
  }
}

# Print the best model and its MAE
print(best_model)
print(best_mae)

#Predicting on validation set
predictions <- predict(best_model, newdata = validation.x)

# Calculate MAE
mae <- mean(abs(validation.y - predictions))

variance <- var(validation.y)
# Calculate MSE
mse <- mean((validation.y - predictions)^2)

