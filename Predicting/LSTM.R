library(keras)
library(tensorflow)
library(magrittr)
install_tensorflow()
library(caret)

#dependent variable
train.y <- training$BTC_pricech_t1
validation.y <- validation$BTC_pricech_t1

#independent variable
train.x <- as.matrix(training[,c(1,3:ncol(training))])
validation.x <- as.matrix(validation[,c(1,3:ncol(validation))])

# Scale the variables
scaler <- preProcess(train.x, method = c("center", "scale"))
train.sx <- predict(scaler, train.x)
validation.sx <- predict(scaler, validation.x)


# Convert data to array with 3 dimensions
train.sx <- array_reshape(train.sx, c(dim(train.sx)[1], dim(train.sx)[2], 1))
validation.sx <- array_reshape(validation.sx, c(dim(validation.sx)[1], dim(validation.sx)[2], 1))


# Define the model architecture LSTM
model <- keras_model_sequential() %>%
  layer_lstm(units = 32, input_shape = c(dim(train.sx)[2], 1)) %>%
  layer_dense(units = 1)

# Compile the model
model %>% compile(
  optimizer = "adam",
  loss = "mean_squared_error",
  metrics = c("mean_absolute_error")
)

# Fit the model to the training data
model %>% fit(
  train.sx, train.y,
  epochs = 10,
  batch_size = 32,
  validation_data = list(validation.sx, validation.y) #or should I take a percentage? So validation_data = 0.2 and then later evaluate it based on my validation set?
)

# Evaluate the model on the validation data
scores <- model %>% evaluate(validation.sx, validation.y, verbose = 1)
print(paste("Loss:", scores[[1]]))
print(paste("MAE:", scores[[2]]))

# Predicting on the validation data
predictions <- model %>% predict(validation.x)

#To do: Rescale data?