library(shiny)

shinyUI(fluidPage(

    titlePanel("Prediction for iris Species"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sepL","Enter Sepal Length",min = 4,max = 8,value =4),
            sliderInput("SepW","Enter Sepal Width",min = 2,max = 4.5,value =2),
            sliderInput("petL","Enter petal length",min = 1,max = 7,value =1),
            sliderInput("petW","Enter Petal Width",min = 0,max = 3,value =0),
            checkboxInput("sm","Show graph and above values in Graph"),
            submitButton("Predict Species")
        ),

        mainPanel(
            p("Here you will input your findings on plants iris.This can be added in slider input beside you."),
            p("(Check the pitch for documentation)"),
            p("The Species no. for the input given :-"),
            br("1.setosa"),
            br( "2.versicolor"),
            br("3.virginica"),br(),
            textOutput("predict1"),
            p("Petal.Length vs Width"),
            plotOutput("plot1"),
            p("Sepal.Length vs Width"),
            plotOutput("plot2")
        )
    )
))
