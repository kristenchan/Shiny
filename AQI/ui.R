library(shiny)
library(RCurl)

inputPath <- getURL('https://raw.githubusercontent.com/kristenchan/Shiny/master/AQI/data_AQI_new.csv', ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)
Air_data <- read.csv(textConnection(inputPath), stringsAsFactors=FALSE)

site = unique(Air_data$SiteName)

shinyUI(fluidPage( 
  
  titlePanel("比較兩測站AQI趨勢") ,
  
  sidebarLayout(
    sidebarPanel(
      selectInput("site1", "選擇測站1 :", as.vector(site)),
      selectInput("site2", "選擇測站2 :", as.vector(site)),
      width=3) ,
    mainPanel = ( plotOutput("AQIPlot") ) 
  )
  
))


