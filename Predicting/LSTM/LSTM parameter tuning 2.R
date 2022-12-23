FLAGS <- flags(flag_integer('batch_size', 32),
               flag_string('activation', "softmax")) 

#model
model <- keras_model_sequential() %>%
  layer_lstm(units = FLAGS$batch_size, input_shape = c(dim(train.sx)[2], 1)) %>%
  layer_dense(units = 1, activation = FLAGS$activation)

model %>% compile(
  optimizer = "adam",
  loss = "mean_squared_error",
  metrics = c("mean_absolute_error")
)


history <- model %>% fit(
            train.sx, train.y,
            epochs = 10,
            batch_size = FLAGS$batch_size,
            validation_data = list(validation.sx, validation.y)
          )