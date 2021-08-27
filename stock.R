# Stock and Crypto Tracker

# Import libraries
library(tidyquant)
# Asset class
setClass(
  "Asset", 
  representation(
    ticker = "character", 
    quantity = "numeric",
    average_price = "numeric",
    current_price = "numeric")
  )

appl <- new(
  "Asset", 
  ticker = "AAPL", 
  quantity = 150, 
  average_price = 100,
  current_price <- tq_get("AAPL", to = Sys.Date(), get = "stock.prices")
  )

df <- data.frame(
  ticker = appl@ticker,
  quantity = appl@quantity,
  average_price = appl@average_price,
  current_price = appl@current_price
)

