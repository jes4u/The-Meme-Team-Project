library(shiny)
library(plotly)
library(knitr)

# Define UI for application
shinyUI(fluidPage(
  
       theme = "bootstrap.css", 
       
       (navbarPage('The Meme Team - Compatibility Test',
                   
                  hr(),
        
                  tabPanel('WordCloud',
                    
                           titlePanel('Frequently used words in tweets'),
                             
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
                    ),
                   
                    tabPanel('Combined Word Cloud',
                            
                             titlePanel('Double the trouble'),
                            
                             sidebarLayout(
                               
                               sidebarPanel(
                                 
                                 textInput("t_handle_3", 
                                           label = h3("Input a Twitter Handle"), 
                                           value = '@RealDonaldTrump'),
                                
                                           textInput("t_handle_4", 
                                                     label = h3("Input a Second Twitter Handle"), 
                                                     value = '@HillaryClinton')
                                
                               ),
                              
                               mainPanel(
                                 plotOutput("word_cloud_both")
                                
                               )
                              
                              # close sidebarlayout      
                             )
                   # close tabpanel        
                   )
                ))
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
