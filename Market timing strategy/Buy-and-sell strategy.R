# Variables
balance <- 1000
MAE <- 0.025 #To be changed depending on results
transaction_costs <- 0.003
in_trade <- FALSE
balance_df <- data.frame(balance = numeric())

# Function expected return
calculate_expected_return <- function(predicted_price_change, MAE, transaction_costs, in_trade = FALSE) {
  if (in_trade) {
    expected_return <- (predicted_price_change - MAE)
  } else {
    expected_return <- (predicted_price_change - MAE) - transaction_costs
  }
  
  return(expected_return)
}

#Load the prediction database
predictions <- DATABASE_X

# Loop through the rows in the predictions database for next day predictions and true price changes
for (i in 1:nrow(Predicted_price_change_2017_2022)) {
  predicted_price_change <- Predicted_price_change_2017_2022[i, 2]
  true_price_change <- True_price_change_2017_2022[i, 2]
  
  # Calculate the expected return
  expected_return <- calculate_expected_return(predicted_price_change, MAE, transaction_costs, in_trade)
  
  # If the expected return is positive and the investor is not in a trade, enter a trade
  if (expected_return > 0 && !in_trade) {
    in_trade <- TRUE
    real_return <- true_price_change - transaction_costs
    balance <- balance * (1 + real_return)
    
  # If the expected return is positive and investor is in a trade
  } else if (expected_return > 0 && in_trade) {
    real_return <- true_price_change
    in_trade <- TRUE
    balance <- balance * (1 + real_return)
    
  #If the expected return is negative and investors is in a trade  
  } else if (expected_return < 0 && in_trade){
    in_trade <- FALSE
  }
  
  balance_df <- rbind(balance_df, data.frame(balance))
  
}
