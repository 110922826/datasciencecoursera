#Getting and Cleaning Data peer assignment 1

1.Merges the training and the test sets to create one data set.


```r
# load data
test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", header = FALSE)
train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", header = FALSE)
# merge data
a <- rbind(train, test)
```


2.Extracts only the measurements on the mean and standard deviation for each measurement. 


```r
# load data
features <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE)
b <- features[, 2]
# extract data
c <- grep("mean\\(\\)|std\\(\\)", b)
a <- a[, c]
colnames(a) <- gsub("mean\\()", "mean", b[c])
colnames(a) <- gsub("std\\()", "std", colnames(a))
```


3.Uses descriptive activity names to name the activities in the data set


```r
# load activity names
activity1 <- read.table(file = "UCI HAR Dataset/activity_labels.txt", head = FALSE)
ytest <- read.table(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE)
ytrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE)
y <- rbind(ytrain, ytest)
# use activity names to name the activities in the data set
activity <- activity1[y[, 1], 2]
```


4.Appropriately labels the data set with descriptive activity names 


```r
subjectte <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjecttr <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject = rbind(subjecttr, subjectte)
colnames(subject) <- "subject"
a <- cbind(activity, subject, a)
write.table(a, "tidy_data1.txt")  #output the tidy data set
```


5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


```r
# contruct a new dataframe
tidy <- matrix(NA, length(unique(a[, 1])) * length(unique(a[, 2])), dim(a)[2])
tidy <- as.data.frame(tidy)
k = 1
for (i in 1:length(unique(a[, 1]))) {
    d <- a[a[, 1] == unique(a[, 1])[i], 2:dim(a)[2]]
    for (j in 1:length(unique(a[, 2]))) {
        e <- d[d[, 1] == unique(a[, 2])[j], 2:dim(d)[2]]
        tidy[k, 1] <- as.character(unique(a[, 1])[i])
        tidy[k, 2] <- unique(a[, 2])[j]
        tidy[k, 3:dim(a)[2]] <- apply(e, 2, mean)  #mean of every column
        k <- k + 1
    }
}
colnames(tidy) <- colnames(a)
write.table(tidy, "tidy_data2.txt")  #output the tidy data set
```

