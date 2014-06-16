training0 <- read.csv('pml-training.csv')
testing0 <- read.csv('pml-testing.csv')
library(caret)
set.seed(1)
trainingIndex <- createDataPartition(training0$classe, p=.6, list=FALSE )
training = training0[trainingIndex,]
cv = training0[-trainingIndex,]
library(RANN)
idx = which(lapply(training0,class) %in% c('numeric'))
assign <- preProcess(training0[,idx], method=c('knnImpute'))
training<-cbind(training$classe, predict(assign, training[,idx]))
cv<-cbind(cv$classe, predict(assign, cv[,idx]))
testing0<-predict(assign, testing0[, idx])
names(training)[1] <- "classe"
names(cv)[1] <- "classe"
library(randomForest)
model  <- randomForest(classe ~ ., training)
t_pre <- predict(model, training) 
library(e1071)
print(confusionMatrix(t_pre, training$classe))
c_pre <- predict(model, cv) 
print(confusionMatrix(c_pre, cv$classe))
predict(model, testing0) 
