# Chargement du jeu de donnees
perso <- read.table("data/train.csv", sep = ",", header = TRUE)
perso <- perso[-450,]

perso$Gender <- as.factor(perso$Gender)
perso$Personality <- as.factor(perso$Personality)

# Chargement des packages
library(shiny)
library(shinyWidgets)
require(nnet)            # Multinomial logistic regression
require(leaps)           # For regsubsets
require(pls)             # For segments
require(groupdata2)      # For fold
require(boot)            # For cv.glm
require(FactoMineR)      # For PCA,MCA,...
require(lme4)            # For lmer,glmer
library(shiny)
require(shinydashboard)
require(ggplot2)  # plots
require(plotly)
require(nnet)

mod <- multinom(perso$Personality ~ perso$Age + perso$openness + perso$neuroticism + perso$conscientiousness +
                  perso$agreeableness + perso$extraversion )

multinom_model <- multinom(Personality ~ ., data = perso)

# Predicting the values for train dataset

Gender <- 'Male'
Age <- 23
openness <- 3
neuroticism <- 7
conscientiousness <- 8
agreeableness <- 3
extraversion <- 1

df <- data.frame(Gender,Age,openness,neuroticism,conscientiousness,agreeableness,extraversion)
df$ClassPredicted <- predict(multinom_model, newdata = df, "class")


