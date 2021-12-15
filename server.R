# Serveur

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  # Deuxième onget
  # poids des variables
  
  # modele
  Bestmod <- reactive({
    glm(CO2~.,data=newdata[,select$which[input$Nbvar,]])
  })
  
  # on reccupere les coeffs
  coeff<-reactive({
    as.data.frame(summary(Bestmod())$coefficients)
  })
  
  
  # plot du poids des variables (coefficients)
  output$coef <- renderPlotly({
    p<-ggplot(coeff()[-1,], aes(x= (rownames(coeff()[-1,])), y=coeff()[-1,1]))+
      geom_bar(stat="identity", fill="#00c0ef", alpha = 0.6)+
      ggtitle("Poids des variables dans le modèle") +
      xlab("Variables")+
      ylab("Scores")+
      theme(plot.title = element_text(hjust = 0.5, size = 10),
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(size = 15)
      )
    ggplotly(p)
  })
  
  # optimisation du critère par cross validation
  cvmod <- reactive({
    cv.glm(newdata,Bestmod(),K=10)
  })
  
  # on sort le RMSE
  output$rmse <- renderText({
    c("RMSE Ajusté :",round(cvmod()$delta[2],2))
  })
  
  # plots optimisation des critères AIC, BIC et RSS en fonction du nb
  # de variables prises en compte dans le modèle
  output$Plbic <- renderPlot({
    plot(1:6,bic,pch=16,bty="l",type="b",xlab="Number of explanatory variables",
         ylab="Information criterion",ylim=range(bic),col="darkgray",
         main="Exhaustive model selection",cex.lab=1.25,cex.axis=1.25,cex.main=1.25,lwd=2)
    legend("topleft",lwd=2,lty=1,pch=c(16,17),col=c("darkgray"),bty="n",cex=1.25,legend="BIC")
    grid()
  })
  output$Plrss <- renderPlot({
    plot(1:6,rss,pch=16,bty="l",type="b",xlab="Number of explanatory variables",
         ylab="RSS",ylim=range(rss),col="coral1",
         main="Exhaustive model selection",cex.lab=1.25,cex.axis=1.25,cex.main=1.25,lwd=2)
    legend("topleft",lwd=2,lty=1,pch=c(16,17),col=c("coral1"),bty="n",cex=1.25,legend="RSS")
    grid()
  })
  output$Plaic <- renderPlot({
    plot(1:6,aic,pch=16,bty="l",type="b",xlab="Number of explanatory variables",
         ylab="Information criterion",ylim=range(aic),col="red",
         main="Exhaustive model selection",cex.lab=1.25,cex.axis=1.25,cex.main=1.25,lwd=2)
    legend("topleft",lwd=2,lty=1,pch=c(16,17),col=c("red"),bty="n",cex=1.25,legend="AIC")
    grid()
  })
  
  output$suM <- renderPrint({
    summary(Bestmod())$coef
  }) #Résulats du modèle
  
  
  # préparation des données pour le scatterplot
  fitted.co2_2 <- reactive({
    fitted(Bestmod())
  }) # Fitted LMP values
  
  observed.co2_2 <- reactive({
    newdata$CO2
  }) # Observed LMP values
  
  # concaténation
  dataplot <- reactive({
    data.frame(observed.co2_2(),fitted.co2_2())
  }) 
  
  # scatter plot données fittées et observées
  output$scatter <- renderPlotly({
    p3 <- ggplot(dataplot(),aes(x=observed.co2_2(),y=fitted.co2_2())) +
      geom_point(colour="black",alpha=0.5)+
      ggtitle(HTML(paste0("Fitted versus observed CO2 values avec ",input$Nbvar," variables")))+
      xlab("Observed CO2") + ylab("Fitted CO2")+
      theme(plot.title=element_text((hjust=0.5)))+
      geom_abline(slope = 1,intercept = 0,col="red")
    ggplotly(p3)
  })
  
  
  # Onglet data 
  
  output$tab<-renderDataTable({
    cars
  })
  output$summary<-renderPrint({
    summary(cars)
  })
  
  
})



