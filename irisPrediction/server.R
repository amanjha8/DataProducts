library(shiny)
library(ggplot2)
library(caret)
data("iris")

shinyServer(function(input, output) {
    set.seed(344345)
    fit1<- train(Species~.,data=iris,metho="rf",
                 trControl= trainControl(method="repeatedcv",number =10,repeats = 3))
    
    pred1<- reactive({
        newdata<- data.frame(Sepal.Length=input$sepL,
                             Sepal.Width=input$SepW,
                             Petal.Length=input$petL,
                             Petal.Width=input$petW)
        predict(fit1,newdata = newdata)
    })
    output$predict1<- renderText({
        paste("Species for the entered input is  :- ",pred1())
    })
    
    output$plot1<- renderPlot({
        g <- ggplot(iris,aes(Petal.Length,Petal.Width,color=Species))+geom_point()
        g
        if(input$sm){
            g+geom_point(aes(x=input$petL,y=input$petW,color="black",size=5))
        }
        
    })
    
    output$plot2<-renderPlot({
        g1<-ggplot(iris,aes(Sepal.Length,Sepal.Width,color=Species))+geom_point()
        g1
        if(input$sm){
            g1+geom_point(aes(x=input$sepL,y=input$SepW,color="black",size=5))
        }
    })
})
