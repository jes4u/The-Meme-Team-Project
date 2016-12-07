library(shiny)
library(plotly)
library(knitr)

# Define UI for application
shinyUI(fluidPage(theme = "bootstrap.css", 
########################################### new stuff  
       (navbarPage('The Meme Team - Compatibility Test',
                   
                   hr(),
        
                    tabPanel('Big 5',
                    
                             titlePanel('Mapping of Your Big 5 Personailities'),
                             
                             sidebarLayout(
                            
                               sidebarPanel(
                                 
                                 textInput("t_handle_1", 
                                           label = h3("Input a Twitter Handle"), 
                                           value = '@realDonaldTrump')
                                 
                                 ,
                                 
                                 textInput("t_handle_2", 
                                           label = h3("Input a Second Twitter Handle"), 
                                           value = '@HillaryClinton')
                                 
                               ),
                               
                               ## Not sure if two things work for main panel
                               mainPanel(
                                 plotOutput("word_cloud_1")
                                 
                                 # ,
                                 # Insert spider map, keep comma from above
                                 
                                 ,
                                 hr()
                                 ,
                                 ########################## Doesn't show two charts in the mainpanel?

                                 plotOutput("word_cloud_2")
                                 
                                 # ,
                                 # Insert spider map, keep comma from above
                                 
                               )
                            
                            # close sidebarlayout      
                             )
                    # close tabpanel        
                    )
                               
                               
                               
                               
                              
))
                  
                  
########################################### newstuff                 
  )
)


########################## old stuff
  # # Application title
  # titlePanel("The Meme Team - Compatibility Test"),
  #   hr(),
  #   # Show a plot of the generated distribution
  #   mainPanel("Enter twitter usernames separated by commas.",
  #     tags$textarea(id="users", rows=3, cols=40, 
  #                   "samsturtevant, zuzr"),
  #     textOutput("users")
  #   )
