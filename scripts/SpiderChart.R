# this is the raw spider chart
radarchart(data)

# pass in data frame as data. This code returns a spider chart of one person.

radarchart( data  , axistype=1 , 

    #custom polygon
    pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 

    #custom the grid
    cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,1,0.2), cglwd=0.8,

    #custom labels
    vlcex=0.8 
    )


# pass in data frame to data. This code returns a spider chart that compares two people.

colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9) , rgb(0.7,0.5,0.1,0.9) )
colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4) , rgb(0.7,0.5,0.1,0.4) )
radarchart( data  , axistype=1 , 
            #custom polygon
            pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,1,0.2), cglwd=0.8,
            #custom labels
            vlcex=0.8 
)
person <- c("person1", "person2")
legend(x=1, y=1, legend = person, bty = "n",
       pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
