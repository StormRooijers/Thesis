library(caret)

#Train control with rolling window
t.control = train_control <- trainControl(method = "timeslice",
                                          initialWindow = 680,
                                          horizon = 171) 
#Hyperparameter grid search
param_grid <- expand.grid(
  eta = c(0.1, 0.3, 0.5),
  max_depth = c(6, 8, 10),
  nrounds = c(50, 100, 150),
  gamma = c(0, 1, 10),
  colsample_bytree = c(0.5, 0.7, 0.9),
  min_child_weight = c(1, 3, 5),
  subsample = c(0.5, 0.7, 0.9)
)

#Training XGBoost based on the different hyperparameters
model2 <- train(x = train.x,
                   y = train.y,
                   method = "xgbTree",
                   objective = "reg:linear", #probeer ook de sqaured error
                   trControl = t.control,
                   tuneGrid = param_grid,
                metric = "mae")

#Best tune
best_tune = model2$bestTune
