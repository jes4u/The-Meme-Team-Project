library(shiny)

# Define UI for application
shinyUI(fluidPage(theme = "bootstrap.css",
  
  # Application title
  titlePanel("The Meme Team - Compatibility Test"),
    hr(),
    # Show a plot of the generated distribution
    mainPanel("Enter twitter usernames separated by commas.",
      tags$textarea(id="users", rows=3, cols=40, 
                    "samsturtevant, zuzr"),
      textOutput("users")
    )
  )
)
