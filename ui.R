library(shiny)
library(plotly)
library(knitr)

# Define UI for application
shinyUI(fluidPage(theme = "bootstrap.css", 
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
                               
                               mainPanel(
                                 plotOutput("word_cloud_1")
                                 
                                 ,
                                 hr()
                                 ,

                                 plotOutput("word_cloud_2")
                                 
                                 
                               )
                            
                            # close sidebarlayout      
                             )
                    # close tabpanel        
                    ),
                   
                   tabPanel('Big 5',
                            
                            titlePanel('Personality on a 5-point scale'),
                            
                            sidebarLayout(
                              
                              sidebarPanel(
                                
                                textInput("t_handle_3", 
                                          label = h3("Input a Twitter Handle"), 
                                          value = '@realDonaldTrump')
                                
                                ,
                                
                                textInput("t_handle_4", 
                                          label = h3("Input a Second Twitter Handle"), 
                                          value = '@HillaryClinton')
                                
                              ),
                              
                              mainPanel(
                                
                                # Insert spider map

                                # ,
                                # hr()
                                # ,


                                # ,
                                # Insert spider map, keep comma from above
                                
                              )
                              
                              # close sidebarlayout      
                            )
                            # close tabpanel        
                   )
                               
                   ,
                   
                   tabPanel('Compatability',
                            
                            titlePanel('Test your compatability'),
                            
                            sidebarLayout(
                              
                              sidebarPanel(
                                
                                textInput("t_handle_5", 
                                          label = h3("Input a Twitter Handle"), 
                                          value = '@realDonaldTrump')
                                
                                ,
                                
                                textInput("t_handle_6", 
                                          label = h3("Input a Second Twitter Handle"), 
                                          value = '@HillaryClinton')
                                
                              ),
                              
                              mainPanel(
                                
                                # Insert spider map
                                
                                # ,
                                # hr()
                                # ,
                                
                                
                                # ,
                                # Insert spider map, keep comma from above
                                
                              )
                              
                              # close sidebarlayout      
                            )
                            # close tabpanel        
                   )      
                               
                               
                              
))          
  )
)



