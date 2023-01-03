Database <- Adjusted_Database_after_first_parsing_and_engineering

#Creating list with BTC_price on t1
BTC_price_t1 <- list()

#Loop through the database and add the next day's Bitcoin price to the list
for(i in 1:nrow(Database)){
  BTC_price_t1[i] <- Database$`BTC_price(t)`[i+1]
}

BTC_price_t1 <- as.numeric(BTC_price_t1)

#Add the list to the Database as column
Database$BTC_price_t1 <- BTC_price_t1

#Since this is not possible for the last value because the next day value of the 31st of August 2022 is not in the database it is manually added
#Value of Bitcoin price on the 1st of September is 20126.1 (https://www.investing.com/crypto/bitcoin/historical-data)
Database$BTC_price_t1[3530] <- 20126.1


#Creating list with BTC price change on t1
BTC_pricech_t1 <- list()

#loop through the database and calculate the percentage change
for(i in 1:nrow(Database)){
  BTC_pricech_t1[i] <- (((Database$BTC_price_t1[i] - Database$`BTC_price(t)`[i])/ Database$`BTC_price(t)`[i]))
}

BTC_pricech_t1 <- as.numeric(BTC_pricech_t1)

#Add the list to the Database as column
Database$BTC_pricech_t1 <- BTC_pricech_t1
