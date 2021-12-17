# Serveur

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  # Deuxième onget
  # poids des variables
  
  # modele

  Gender <- reactive({
    input$Gender
  })

  
  Age <- reactive({
    input$Age
  })
  
  openness <- reactive({
    input$Openness
  })
  
  neuroticism <- reactive({
    input$Neuroticism
  })
  
  conscientiousness <- reactive({
    input$Conscientiousness
  })
  
  agreeableness <- reactive({
    input$Agreeableness
  })
  
  extraversion <- reactive({
    input$Extraversion
  })
  
  df <- reactive({
    new_df <- data.frame(Gender(),Age(),openness(),neuroticism(),conscientiousness(),agreeableness(),extraversion())
    colnames(new_df) <- c("Gender","Age","openness","neuroticism","conscientiousness","agreeableness","extraversion")
    new_df
  })
  

    
  output$predict <- renderText({
    as.character(predict(multinom_model, newdata = df(), "class"))
  })
  
  
})



