library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Please think of an integer among 25,50,75.Enter 1 to indicate the guess of the computer is too high. Enter -1 to indicate the guess of computer is too low. Enter 0 to indicate the guess of computer is correctly."),
  sidebarPanel(
    numericInput('x', 'please enter 1 , -1 or 0', 0, min = -1, max = 1, step = 100000),
    submitButton('Submit')
    ),
  mainPanel(
    h3('Results of prediction'),
    h4('You entered is'),
    verbatimTextOutput("inputletter"),
    h4('The computer says'),
    verbatimTextOutput("prediction")
    )
  )
)
 