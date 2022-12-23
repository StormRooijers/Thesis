library(keras)
library(tensorflow)
library(tfruns)

#dependent variable
train.y <- training$BTC_pricech_t1
validation.y <- validation$BTC_pricech_t1

#independent variables
train.x <- as.matrix(training[,c(1,3:ncol(training))])
validation.x <- as.matrix(validation[,c(1,3:ncol(validation))])

# Scale the predictor variables
scaler <- preProcess(train.x, method = c("center", "scale"))
train.sx <- predict(scaler, train.x)
validation.sx <- predict(scaler, validation.x)

#Hyperparameter tuning
runs <- tuning_run("LSTM parameter tuning 2.R",
                   flags = list(batch_size = c(16,32,64),
                                activation = c('relu', 'softmax')))

#Best hyperparameter value
head(runs)
results <- runs[,c(2,3,4,5,6,7,8)]

