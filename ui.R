library(shiny)
library(plotly)
library(knitr)

# Define UI for application

shinyUI(
  fluidPage(theme = "bootstrap.css", 
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
                  tabPanel('WordCloud',
                           titlePanel('Frequently used words in recent tweets'),
                           mainPanel(textOutput("word_cloud_text_1"),
                                     plotOutput("word_cloud_1"),
                                     hr(),
                                     textOutput("word_cloud_text_2"),
                                     plotOutput("word_cloud_2"),
                                     hr(),
                                     textOutput("word_cloud_text_3"),
                                     plotOutput("word_cloud_3")
                           )
                  ),
                   
                    tabPanel('Big 5',
                            
                             titlePanel('Personality on a 5-point scale'),
                            
                            
                              
                              mainPanel(
                                
                                # Insert spider map
                                plotOutput("spider_chart"),
                                hr(),
                                textOutput("text1_big5"),
                                tableOutput("spider_data_1"),
                                textOutput("text2_big5"),
                                tableOutput("spider_data_2")
                                # ,


                                # ,
                                # Insert spider map, keep comma from above
                              
                              #close mainpanel 
                              )
                    # close tabpanel 
                    ),
                   
                   
                   tabPanel('Compatability',
                            
                            titlePanel('Test your compatability'),
                            
                            
                              
                              mainPanel( 
                                
                                textOutput("text1_jung"),
                                
                                tableOutput('jungian_1'),
                                
                                hr(),
                                
                                textOutput("text2_jung"),
                                
                                tableOutput('jungian_2')
                                
                               )
                              
                              # close sidebarlayout      

                            )
                            # close tabpanel        
                   )      
)
)
)




