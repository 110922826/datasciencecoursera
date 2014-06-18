---
title       : guessing number.
subtitle    : Coursera Developing Data Products
author      : A student 
job         : graduate student
framework   : html5slides   # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}

---

## Project Idea
You think of an integer among 25,50,75. 
The computer will guess which one is the integer.
You can tell the coumputer if the integer is lager, lower or equeal to the integer that the computer guesses.

---

## Server processing
The default value is 50.

Enter 1 to indicate the guess of the computer is too high, and then the computer will guess the integer is 25.


Enter -1 to indicate the guess of computer is too low,and then the computer will guess the integer is 75.

If you enter other number other than -1, 0 and 1, the computer will says:"Sorry, I did not understand your input."

---

## Sample of the out put.


```r
print('Sorry, I did not understand your input.')
```

```
## [1] "Sorry, I did not understand your input."
```

---

## Sample of the server R code

```r
high=100
low=0
ans=as.integer((low+high)/2) 
computersays<-function(x) 
{  while(x!=0)
    {if (x!=0 & x!=1 & x!=(-1) )
    {return('Sorry, I did not understand your input.')}
  if (x==(-1))
    {low<-ans
  ans=as.integer((low+high)/2)}
  if (x==1)
    {high<-ans
  ans=as.integer((low+high)/2)}
  return(paste('Your secret number was:',as.character(ans)))}
return(paste('Your secret number was:',as.character(ans)))}
shinyServer(
  function(input, output){
    output$inputletter<-renderPrint({input$x})
    output$prediction<-renderPrint({computersays(input$x)})
    }
  )
```


---
## User Interface code

```r
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
```
