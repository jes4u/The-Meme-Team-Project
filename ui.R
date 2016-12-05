library(shiny)

# Define UI for application
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("The Meme Team - Compatibility Test"),
    hr(),
    # Show a plot of the generated distribution
    mainPanel(
      sidebarPanel(
        textInput("user1", label = h3("User 1 Twitter Handle"), value = "@"),
        textInput("user2", label = h3("User 2 Twitter Handle"), value = "@")
      )
    )
  )
)
