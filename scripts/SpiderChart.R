library(fmsb)
  
spiderChart <- function(data, user1, user2) {
    
  colors_border <- c(rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9), rgb(0.7,0.5,0.1,0.9))
  colors_in <- c(rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4), rgb(0.7,0.5,0.1,0.4))
  spider <- radarchart(data, 
                       axistype=1, 
                       pcol=colors_border, 
                       pfcol=colors_in,
                       
                       cglcol="grey", 
                       axislabcol="grey", 
                       caxislabels=seq(0,1.2,0.25))
  person <- c(user1, user2)
  bar <- legend(x=0.9, 
                y=1, 
                legend=person, 
                bty="n", 
                pch=20, 
                col=colors_in, 
                text.col = "grey",
                cex=1.2, 
                pt.cex=3)
  return(spider)
}
