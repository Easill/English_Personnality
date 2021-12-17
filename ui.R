# User interface

shinyUI(
  # type de l'interface
  dashboardPage(
    skin = "purple",
    dashboardHeader(title = HTML(paste0("Personnality prediction")),
                    titleWidth = 250
    ),
    # Contenu de la sidebar
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home", tabName = "home", icon = icon("home", lib = "font-awesome")),
        menuItem("Prediction", tabName = "prediction", icon = icon("wave-square")),
        menuItem("Secret Tab",tabName = "secret", icon=icon("th")),
        menuItem("About", tabName = "about", icon=icon("info-circle"))
      )
    ),
    # contenu du corps de la page
    dashboardBody(
      tags$style(HTML(
        '.nav-tabs-custom .nav-tabs li.active {border-top-color: #00c0ef;}'
      )), #pour la couleur des onglets
      tabItems(
        #First tab content 
        tabItem(tabName = "home",
                fluidRow(
                  column(width = 7,
                         h3("Context"),
                         p(
                           "This is an example of what we can do in statistical specialization, it is a shiny R application. 
                                       This one is about personality prediction. You can also try this application by yourself and play with it 
                                       to see what results you can get!",
                           br(),
                           style = "background-color:#e1d2b8;padding:15px;border-radius:10px;text-align:justify;font-size:18px"),
                         
                         tags$img(src="personnality.png",width="886px",height="841px") # ajout de l'image
                  )
                )
        ),
        #Second tab content
        tabItem(tabName = "prediction",
                fluidRow(
                  column(width = 12,
                         tabBox(id = "Scores", width = 12,
                                tabPanel("Scores",
                                         fluidRow(
                                           column(width = 6, (h4("Indicate a score from 1 to 8 (1 being", tags$b("'very high'"),"and 8 being", tags$b("'very low'."))),
                                                  br(),
                                                  prettyRadioButtons(inputId = "Gender", label = "Gender", choices = c("Female" = 0,"Male" = 1,"Other" = 2),selected = 0),
                                                  br(),
                                                  numericInput(inputId = "Age", label = "Age", value = 23, min = 1, max = 60),
                                                  br(),
                                                  numericInput(inputId = "Openness", label = "Openness", value = 5, min = 1, max = 8),
                                                  br(),
                                                  numericInput(inputId = "Neuroticism", label = "Neuroticism", value = 5, min = 1, max = 8),
                                                  br(),
                                                  numericInput(inputId = "Conscientiousness", label = "Conscientiousness", value = 5, min = 1, max = 8),
                                                  br(),
                                                  numericInput(inputId = "Agreeableness", label = "Agreeableness", value = 5, min = 1, max = 8),
                                                  br(),
                                                  numericInput(inputId = "Extraversion", label = "Extraversion", value = 5, min = 1, max = 8),
                                                  br(),
                                           ),
                                           column(width = 6, h4("Results :"),
                                                  br(),
                                                  h2("You are ....", textOutput("predict")),
                                                  br(),
                                                  h4("The results are probably wrong, due to lack of time we couldn't build a model strong enough to predict exactly which personnality you have among the five possibles. Moreover, the datas are based on people who answered 50 questions to have their predicted personnality. We didn't have the time to make you pass all these questions, but feel free to do them if you want to. (Type Big 5 personnality test on google).")
                                                  )
                                         )
                                ),
                         )
                  )
                )
        ),
        tabItem(tabName="secret",
                fluidRow(
                  column(width = 9,
                         h3("You shouldn't be here"),
                         p(
                           "You are currently in an english classroom, you should listen to us instead of trying to find some bugs in the app.",
                           br(),
                           "I hope getting rickrolled will be enough to teach you a lesson : LISTEN TO US WHILE WE SPEAK (even if you don't find interesting what we are saying).",
                           br(),
                           style = "background-color:#e1d2b8;padding:15px;border-radius:10px;text-align:justify;font-size:18px"),
                         
                         tags$img(src="rickroll.gif",width="420px",height="498px", align = "center") # ajout de l'image
                  )
                )
                
        ),
        tabItem(tabName="about",
                fluidRow(
                  column(width=9,
                         h3("Cadre du Projet"),
                         p("This app ",tags$b("Rshiny")," is part of a project for the english course."),
                         br(),
                         "For this project we have used datas",tags$b("personality.csv")," downloaded on ",tags$b("Kaggle,"),"acessible from",a("here.",href="https://www.kaggle.com/pavlorymarchuk/test3434"),
                         style = "background-color:#e1d2b8;padding:15px;border-radius:10px;text-align:justify;font-size:18px",
                         br(),
                         h3("About us"),
                         p("We are currently Master's students in ",tags$b("data science "),"at Agrocampus.",
                           "This project is available on ",tags$b("github"),".",
                           style = "background-color:#e1d2b8;padding:15px;border-radius:10px;text-align:justify;font-size:18px"),
                         br(),
                         h3("Packages used :"),
                         br(),
                         p("-shiny",
                           br(),
                           "-shinyWidgets",
                           br(),
                           "-nnet",
                           br(),
                           "-leaps",
                           br(),
                           "-pls",
                           br(),
                           "-groupdata2",
                           br(),
                           "-boot",
                           br(),
                           "-FactoMineR",
                           br(),
                           "-lme4",
                           br(),
                           "-shiny",
                           br(),
                           "-shinydashboard",
                           br(),
                           "-ggplot2",
                           br(),
                           "-forcats",
                           br(),
                           "-plotly"
                         ),
                         br(),
                         tags$b("Contact"),
                         br(),
                         a(icon("linkedin"),"@virginie-guisneuf-897615171/",href="https://www.linkedin.com/in/virginie-guisneuf-897615171/"),
                         br(),
                         a(icon("linkedin"),"@elias-hermance-datascience/",href="https://www.linkedin.com/in/elias-hermance-datascience/"),
                         br(),
                         a(icon("github"),"Easill",href="https://github.com/Easill"),
                         br(),
                         a(icon("github"),"Virginieguis",href="https://github.com/Virginieguis"),
                         br(),
                         a(tags$img(src="images.jpg",width="485px",height="104px"),href="https://www.agrocampus-ouest.fr/"), # ajout de l'image
                         br(),
                         br(),
                         a(tags$img(src="Kaggle_logo.png",width="485px",height="154px"),href="https://www.kaggle.com/") # ajout de l'image
                  )
                )
        )
      )
    )
  )
)