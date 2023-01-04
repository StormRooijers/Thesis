#Plotting the graphs

par(mfcol = c (3,3))

plot(Database_thesisV2$DATE, Database_thesisV2$`BTC_price(t)` , type = "l", main = "Bitcoin price", xlab ="Date", ylab = "Bitcoin price", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Miner_rewards , type = "l", main = "Miner rewards", xlab ="Date", ylab = "Miner rewards", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Trans_vol , type = "l", main = "Transaction volume", xlab ="Date", ylab = "Transaction volume", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Hash_rate , type = "l", main = "Hash rate", xlab ="Date", ylab = "Hash rate", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Trans_fees , type = "l", main = "Transaction fees", xlab ="Date", ylab = "Transaction fees", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$BTC_addresses , type = "l", main = "Bitcoin addresses", xlab ="Date", ylab = "Bitcoin addresses", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$BTC_supply , type = "l", main = "Bitcoin supply", xlab ="Date", ylab = "Bitcoin supply", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Price_volatility , type = "l", main = "Price volatility", xlab ="Date", ylab = "Price volatility", col = "blue")
plot(Database_thesisV2$DATE, Database_thesisV2$Google_interest , type = "l", main = "Google interest", xlab ="Date", ylab = "Google interest", col = "blue")


plot(Database_thesisV2$DATE, Database_thesisV2$Wiki_search , type = "l", main = "Wikipedia searches", xlab ="Date", ylab = "Wikipedia searches", col = "blue")


#Plotting the class distribution of the Bitcoin price direction (t+1)
par(mfcol = c (2,2))
ggplot(X2013_2027, aes(x= Direction, fill = Direction)) + geom_bar() + theme_classic() 
ggplot(X2017_2022, aes(x= Direction, fill = Direction)) + geom_bar() + theme_classic()
