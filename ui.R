library(shiny)
library(plotly)
library(knitr)

# Define UI for application

shinyUI(fluidPage(theme = "bootstrap.css", 
       (navbarPage('The Meme Team - Compatibility Test',
                   
                  hr(),
        
                    sidebarPanel(
                      
                      textInput("t_handle_1", 
                                label = h3("Input a Twitter Handle"), 
                                value = '@RealDonaldTrump')
                      
                      ,
                      
                      textInput("t_handle_2", 
                                label = h3("Input a Second Twitter Handle"), 
                                value = '@HillaryClinton')
                      
                    ),
                  
                  
                    # close tabpanel        
                    
                   
                    tabPanel('Big 5',
                            
                             titlePanel('Personality on a 5-point scale'),
                            
                            
                              
                              mainPanel(
                                
                                # Insert spider map
                                plotOutput("spider_chart")
                                ,
                                hr(),
                                textOutput("text1"),
                                tableOutput("spider_data_1"),
                                textOutput("text2"),
                                tableOutput("spider_data_2")
                                # ,


                                # ,
                                # Insert spider map, keep comma from above
                                
                              )
                              
                              # close sidebarlayout      
                            )
                            # close tabpanel        
                   ,
                               
                   
                   
                   tabPanel('Compatability',
                            
                            titlePanel('Test your compatability'),
                            
                            
                              
                              mainPanel(
                                
                                # Insert spider map
                                
                                # ,
                                # hr()
                                # ,
                                
                                
                               )
                              
                              # close sidebarlayout      

                            ),
                            # close tabpanel  
                  tabPanel('WordCloud',
                           
                           titlePanel('Frequently used words in tweets'),
                           
                           
                           
                           mainPanel(
                             plotOutput("word_cloud_1")
                             
                             ,
                             hr()
                             ,
                             
                             plotOutput("word_cloud_2")
                             
                             
                           )
                           
                           # close sidebarlayout      
                  )
                   )      
                               
                               
                              
)
))




