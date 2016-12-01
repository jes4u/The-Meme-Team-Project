library(shiny)

# Define UI for application
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("The Meme Team - Compatibility Test"),
    hr(),
    # Show a plot of the generated distribution
    mainPanel(
      sidebarPanel(
        textInput("user1", label = h3("User 1 URL"), value = "www.facebook.com/URL"),
        textInput("user2", label = h3("User 2 URL"), value = "www.facebook.com/URL")
      )
    )
  )
)
