Prediction of Weight Lifting Style
========================================================

## Abstract

Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this paper we examine whether we can determine the weight lifting form using the accelerometer data collected.

## Loading data and packages


```r
training0 <- read.csv('pml-training.csv')
testing0 <- read.csv('pml-testing.csv')
library(caret)
```

```
## Loading required package: lattice
## Loading required package: ggplot2
```
## Separate training data 

Separate training data provided into two groups. One for training and the other for cross validation.


```r
set.seed(1)
trainingIndex <- createDataPartition(training0$classe, p=.6, list=FALSE )
training = training0[trainingIndex,]
cv = training0[-trainingIndex,]
```

## Select the numeric columns from the data assign the missing value and 


```r
library(RANN)
idx = which(lapply(training0,class) %in% c('numeric'))
assign <- preProcess(training0[,idx], method=c('knnImpute'))
training<-cbind(training$classe, predict(assign, training[,idx]))
cv<-cbind(cv$classe, predict(assign, cv[,idx]))
testing0<-predict(assign, testing0[, idx])
colnames(training)[1] <- "classe"
colnames(cv)[1] <- "classe"
```

## Model of random forest


```r
library(randomForest)
```

```
## randomForest 4.6-7
## Type rfNews() to see new features/changes/bug fixes.
```

```r
model  <- randomForest(classe ~ ., training)
```

### In-sample accuracy

```r
t_pre <- predict(model, training) 
library(e1071)
print(confusionMatrix(t_pre, training$classe))
```

```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction    A    B    C    D    E
##          A 3348    0    0    0    0
##          B    0 2279    0    0    0
##          C    0    0 2054    0    0
##          D    0    0    0 1930    0
##          E    0    0    0    0 2165
## 
## Overall Statistics
##                                 
##                Accuracy : 1     
##                  95% CI : (1, 1)
##     No Information Rate : 0.284 
##     P-Value [Acc > NIR] : <2e-16
##                                 
##                   Kappa : 1     
##  Mcnemar's Test P-Value : NA    
## 
## Statistics by Class:
## 
##                      Class: A Class: B Class: C Class: D Class: E
## Sensitivity             1.000    1.000    1.000    1.000    1.000
## Specificity             1.000    1.000    1.000    1.000    1.000
## Pos Pred Value          1.000    1.000    1.000    1.000    1.000
## Neg Pred Value          1.000    1.000    1.000    1.000    1.000
## Prevalence              0.284    0.194    0.174    0.164    0.184
## Detection Rate          0.284    0.194    0.174    0.164    0.184
## Detection Prevalence    0.284    0.194    0.174    0.164    0.184
## Balanced Accuracy       1.000    1.000    1.000    1.000    1.000
```
The sample accuracy is almost 100%.

## Cross Validation

### Out-of-sample accuracy

```r
c_pre <- predict(model, cv) 
print(confusionMatrix(c_pre, cv$classe))
```

```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction    A    B    C    D    E
##          A 2209   22    3    6    2
##          B   14 1467   20    0    3
##          C    2   21 1325   18   10
##          D    0    1   18 1253   15
##          E    7    7    2    9 1412
## 
## Overall Statistics
##                                        
##                Accuracy : 0.977        
##                  95% CI : (0.973, 0.98)
##     No Information Rate : 0.284        
##     P-Value [Acc > NIR] : <2e-16       
##                                        
##                   Kappa : 0.971        
##  Mcnemar's Test P-Value : 0.0273       
## 
## Statistics by Class:
## 
##                      Class: A Class: B Class: C Class: D Class: E
## Sensitivity             0.990    0.966    0.969    0.974    0.979
## Specificity             0.994    0.994    0.992    0.995    0.996
## Pos Pred Value          0.985    0.975    0.963    0.974    0.983
## Neg Pred Value          0.996    0.992    0.993    0.995    0.995
## Prevalence              0.284    0.193    0.174    0.164    0.184
## Detection Rate          0.282    0.187    0.169    0.160    0.180
## Detection Prevalence    0.286    0.192    0.175    0.164    0.183
## Balanced Accuracy       0.992    0.980    0.980    0.985    0.988
```
The out-of-sample accuracy is over 97.7%.

## Prediction results of the testing data

Applying the model of random forest to the test data we can get the predict value.

```r
predict(model, testing0) 
```

```
##  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 
##  B  A  B  A  A  E  D  B  A  A  B  C  B  A  E  E  A  B  B  B 
## Levels: A B C D E
```
We can conclude that the random forest model predict the weight lifting very well.

