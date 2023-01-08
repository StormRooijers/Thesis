FLAGS <- flags(flag_integer('batch_size1', 32),
               flag_integer('batch_size2', 32),
               flag_integer('batch_size3',4),
               flag_numeric('dropout', 0.3)) 


#model
model <- keras_model_sequential() %>%
  layer_lstm(units = FLAGS$batch_size1, input_shape = c(dim(train.x)[2],1), return_sequences = TRUE, activation = 'relu') %>%
  layer_dropout(FLAGS$dropout) %>%
  layer_lstm(units = FLAGS$batch_size2, input_shape = c(dim(train.x)[2],1), return_sequences = TRUE) %>%
  layer_dropout(FLAGS$dropout) %>%
  layer_lstm(units = FLAGS$batch_size3, input_shape = c(dim(train.x)[2],1)) %>%
  layer_dropout(FLAGS$dropout) %>%
  layer_dense(units = 1)

model %>% compile(
  optimizer = "adam",
  loss = "MSE",
  metrics = c("MAE")
)


history <- model %>% fit(
            train.x, train.y,
            epochs = 10,
            batch_size = 32,
           validation_data = list(validation.x, validation.y)
          )

# Evaluate the model on the validation data
predictions <- model %>% predict(validation.x)

# Calculate MAE
mae <- mean(abs(validation.y - predictions))

# Calculate MSE
mse <- mean((validation.y - predictions)^2)

write.csv(predictions, "predictionsV1.csv", row.names = FALSE)

