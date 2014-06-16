
high=100
low=0
ans=as.integer((low+high)/2) 
computersays<-function(x) 
{ 
  
  while(x!=0)
    {if (x!=0 & x!=1 & x!=(-1) )
    {return('Sorry, I did not understand your input.')}
  if (x==(-1))
    {low<-ans
  ans=as.integer((low+high)/2)}
  if (x==1)
    {high<-ans
  ans=as.integer((low+high)/2)}
  return(paste('Your secret number was:',as.character(ans)))
}
return(paste('Your secret number was:',as.character(ans)))
}

shinyServer(
  function(input, output){
    output$inputletter<-renderPrint({input$x})
    output$prediction<-renderPrint({computersays(input$x)})
    }
  )