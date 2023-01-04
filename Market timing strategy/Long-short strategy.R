#Variables
balance <- 1000
MAE <- 0.025 #To be changed depending on results
transaction_costs <- 0.0018
balance_df <- data.frame(balance = numeric())
in_long <- FALSE
in_short <- FALSE


# Function expected return
calculate_expected_return <- function(predicted_price_change, MAE, transaction_costs, in_long = FALSE, in_short = FALSE) {
  if(predicted_price_change > 0 && !in_long ){
    expected_return <- (predicted_price_change - MAE) - transaction_costs
  
  } else if (predicted_price_change < 0 && !in_short){
    expected_return <- (-predicted_price_change - MAE) - transaction_costs 
  
  } else if (predicted_price_change > 0 && in_long ){
    expected_return <- (predicted_price_change - MAE)
    
  } else if (predicted_price_change < 0 && in_short){
      expected_return <- (-predicted_price_change - MAE)
  }
  
  return(expected_return)
}

#Load the prediction database
predictions <- DATABASE_X

# Loop through the rows in the predictions database
for (i in 1:nrow(Predicted_price_change_2017_2022)) {
  predicted_price_change <- Predicted_price_change_2017_2022[i, 2]
  true_price_change <- True_price_change_2017_2022[i, 2]
  
  # Calculate the expected return based on the predicted price change
  expected_return <- calculate_expected_return(predicted_price_change, MAE, transaction_costs, in_long, in_short)
  
  if (predicted_price_change > 0 && expected_return> 0 && !in_long) {
    in_long <- TRUE
    in_short <- FALSE
    real_return <- true_price_change - transaction_costs
    balance <- balance * (1 + real_return)
    
  } else if (predicted_price_change > 0 && expected_return > 0 && in_long){  
    in_long <- TRUE
    real_return <- true_price_change
    balance <- balance * (1 + real_return)
      
  } else if (predicted_price_change <0 && expected_return > 0 && !in_short) {
    in_short <- TRUE
    in_long <- FALSE
    real_return <- -true_price_change - transaction_costs
    balance <- balance * (1 + real_return)
    
  } else if (predicted_price_change <0 && expected_return >0 && in_short){
    in_short <- TRUE
    real_return <- -true_price_change
    balance <- balance * (1 + real_return)
    
  } else if (expected_return < 0 && in_long) {
    in_long <- FALSE
  } else if (expected_return < 0 && in_short) {
    in_short <- FALSE
  }
  balance <- as.numeric(balance)
  balance_df <- rbind(balance_df, data.frame(balance = balance))
}
  
  
  
  
  