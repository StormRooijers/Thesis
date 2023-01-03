Database <- Adjusted_Database_after_first_parsing_and_engineering
library(dplyr)

# Replace 0.0 with NA in the Trade_vol column
Database <- Database %>%
  mutate(Trade_vol = as.numeric(Trade_vol))
Database <- Database %>%
  mutate(Trade_vol = ifelse(Trade_vol == 0.0, NA, Trade_vol))

#Removing the NA values  in the trade_vol column by linear interpolation
pre_value <- 0
next_value <- 0

for (i in 1:nrow(Database)) {
  if (is.na(Database$Trade_vol[i])) {
    pre_value <- i - 1
    next_value <- i + 1
    Database$Trade_vol[i] <- (Database$Trade_vol[pre_value] + Database$Trade_vol[next_value]) / 2
    }
  }
}


