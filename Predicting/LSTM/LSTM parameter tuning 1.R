library(keras)
library(tensorflow)
library(tfruns)
install_tensorflow()

#dependent variable
train.y <- training$BTC_pricech_t1
validation.y <- validation$BTC_pricech_t1

#independent variables
train.x <- as.matrix(training[,c(3:ncol(training))])
validation.x <- as.matrix(validation[,c(3:ncol(validation))])


#Hyperparameter tuning
runs <- tuning_run("LSTM parameter tuning 2.R",
                   flags = list(batch_size1 = c(128,64,32),
                                batch_size2 = c(64,32,16),
                                batch_size3 = c(16,8,4),
                                dropout = c(0.1,0.2,0.3,0.4)))

#Check best hyperparameter value
runs
