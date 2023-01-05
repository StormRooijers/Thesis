Percentages_2017_2022 <- Percentages_2017_2022 %>%
  mutate_all(as.numeric)

#Determining sizes train,validation and test sets
training_size <- floor(0.75*nrow(Percentages_2017_2022))
validation_size <- floor(0.125*nrow(Percentages_2017_2022))
test_size <- nrow(Percentages_2017_2022) - training_size - validation_size

#Create the different sets
training <- Percentages_2017_2022[1:training_size,]
validation <- Percentages_2017_2022[(training_size+1):(training_size+validation_size),]
test <- Percentages_2017_2022[(training_size+validation_size+1):(training_size+validation_size+test_size),]

