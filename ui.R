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
                                textOutput("text1_big5"),
                                tableOutput("spider_data_1"),
                                textOutput("text2_big5"),
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
                            
                            titlePanel('Test your compatability Using Jungian Personality'),
                            
                            
                              
                              mainPanel( 
                                
                                textOutput("text1_jung"),
                                
                                br(),
                                
                                textOutput("abrev_1"),
                                tableOutput('jungian_1'),
                                
                                hr(),
                                
                                textOutput("text2_jung"),
                                br(),
                                textOutput("abrev_2"),
                                tableOutput('jungian_2'),
                                
                                br(),
                                
                                textOutput("isCompatable"),
                                
                                "Here is the table we used to determine their compatability:",
                                
                                tableOutput("displayJungianTable"),
                                
                                br(),
                                
                                "Source: https://www.pinterest.com/pin/50172983322221151/"
                                
                               ) 
                              
                              # close sidebarlayout      

                            ),
                            # close tabpanel  
                  tabPanel('WordCloud',
                           
                           titlePanel('Frequently used words in tweets'),
                           
                           
                           
                           mainPanel(
                             
                             textOutput("text1_cloud"),
                             plotOutput("word_cloud_1")
                             
                             ,
                             hr()
                             ,
                             
                             textOutput("text2_cloud"),
                             plotOutput("word_cloud_2")
                             
                             
                           )
                           
                           # close sidebarlayout      
                  )
                   )      
                               
                               
                              
)
))




