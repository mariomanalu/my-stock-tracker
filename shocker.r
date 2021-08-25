# Installing neccessary packages
install.packages("shinydashboard")
install.packages("quantmod")
install.packages("tidyquant")
install.packages("ggplot2")

# Loading the packages into the project
library(shiny)
library(shinydashboard)
library(quantmod)
library(tidyquant)
library(ggplot2)

# ui.R
ui <- dashboardPage(
  dashboardHeader(title = "My Stock Tracker"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
        box(
          title = "Stock Price Chart",
          plotOutput ("plot", height = 250)
          ),
        
        box(
          title = "Stocks",
          selectInput("Tickers", 
                      "Tickers",
                      choices = c("AAPL", "SQ", "TGT", "SPY", "PLTR", "BTC", "DOGE", "ETH", "ETC"),
                      selected = "AAPL"
                      )
        )
    ),
    fluidRow(
        box(
          tableOutput("table"),
          width = 8
        )
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    stock <- tq_get(input$Tickers,
                   from = "2021-01-01",
                   to = "2021-08-24",
                   get = "stock.prices")
    stock %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line() +
    theme_classic() +
    labs(x = 'Date',
         y = "Adjusted Price") +
    scale_y_continuous(breaks = seq(0,300,10))
  })
  
  output$table <- renderTable(iris)
}

shinyApp(ui, server)
