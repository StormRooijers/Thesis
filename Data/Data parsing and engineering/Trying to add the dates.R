Database2 <- Start_database_without_volatility[,c(1,2)]


col_indices <- 2:26


#loop to go over each pair of date and value columns
for (i in seq(from = 1, to = length(col_indices), by = 2)) {
  
  date_col_index <- col_indices[i]
  value_col_index <- col_indices[i+1]
  
  dates <- Start_database_without_volatility[, date_col_index]
  values <- Start_database_without_volatility[, value_col_index]
  
  #column in Database2 with the name of the value column and fill it with NA values
  col_name <- colnames(Start_database_without_volatility)[value_col_index]
  Database2[col_name] <- NA
  
  #loop to add the values to the corresponding dates in Database2
  for (j in 1:length(dates)) {
    date <- dates[j]
    value <- values[j]
    Database2[, col_name] <- ifelse(Database2$DATE == dates, value, Database2[, col_name])
  }
}