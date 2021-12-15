# User interface

shinyUI(
  # type de l'interface
  dashboardPage(
    skin = "purple",
    dashboardHeader(title = HTML(paste0("Cars CO",tags$sub("2")," emissions")),
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
                         h3("Contexte"),
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
                         fluidRow( # fluidRow1 (selections + graph poids variables)
                           column(width = 8, #colone graph
                                  box(width = 12,
                                      title = "Poids des variables dans le modèle",
                                      status = "info",
                                      plotlyOutput("coef"),
                                      chooseSliderSkin("Shiny", color = "#00c0ef"
                                      ),
                                      sliderInput(inputId = "Nbvar", # Nb var dans le modele
                                                  label = "Nombre de variables à 
                                                              inclure dans le modèle", 
                                                  min = 1,
                                                  max = 6,
                                                  value = 6)
                                  )
                           ),
                           column(width = 4, # colone selection des criteres
                                  box(width = 12,
                                      title = "Sélection exhaustive des variables", 
                                      status = "info",
                                      tabBox(width= 12,id = "Selection",
                                             tabPanel("RSS",
                                                      fluidRow(
                                                        column(width = 12,
                                                               plotOutput("Plrss"))
                                                      )
                                             ),
                                             tabPanel("BIC",
                                                      fluidRow(
                                                        column(width=12,
                                                               plotOutput("Plbic")
                                                        )
                                                      )
                                             ),
                                             tabPanel("AIC",
                                                      fluidRow(
                                                        column(width = 12,
                                                               plotOutput("Plaic")
                                                        )
                                                      )
                                             )
                                      )
                                  )
                           )
                         ),
                         fluidRow( # fluidrow 2 (summary du modele + estimation de la perf)
                           column(width = 6, # colonne summary
                                  box(width = 12,
                                      title = "Summary",
                                      status = "info",
                                      h3("Coefficients du modèle selectionné :"),
                                      verbatimTextOutput("suM")
                                  )
                           ),
                           column(width = 6, # colonne estimation de la performance
                                  box(width = 12,
                                      title = "Estimation de la performance",
                                      status = "info",
                                      textOutput("rmse"),
                                      br(),
                                      plotlyOutput("scatter")
                                  )
                           )
                         )
                         
                  )
                )
        ),
        tabItem(tabName="data",
                fluidRow(
                  column(width = 12,
                         tabBox(width = 12,
                                id="tableaux",
                                tabPanel("Summary",
                                         verbatimTextOutput("summary")
                                ),
                                tabPanel("Datas",
                                         dataTableOutput("tab")
                                )
                         )
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

