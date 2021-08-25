# Stock and Crypto Tracker

# Portfolio

tab <- as.table(tab)
tab

tickers <- c("APPL", "SQ")
current_prices <- c(145, 120)
quantities <- c(10, 20)
average_prices <- c(120, 115)
profits <- (current_prices - average_prices) * quantities
df <- data.frame(ticker = tickers, current_price = current_prices, profit = profits)
df
