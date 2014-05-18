# CodeBook.md


The run_analysis.R performs the following steps to clean up the data:

1. Merges the training and test sets to create one data set, namely
train/X_train.txt and test/X_test.txt -- the result is a 10299 x 561 data frame.


2. Reads file features.txt and extracts only the measurements on the mean and standard deviation for each measurement.
The result is a 10299 x 66 data frame, 

3. Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:


4. The script also appropriately labels the data set with descriptive names.

The result is saved as tidy_data1.txt, a 10299x68 data frame such that the first column contains activity names, the second column contains subject IDs, and the last 66 columns are measurements. 
The activity names are:
walking

walkingupstairs

walkingdownstairs

sitting

standing

laying

Subject IDs are integers between 1 and 30 inclusive. 

All the measurements are:

 [1] "activity"                  "subject"                  
 [3] "tBodyAcc-mean-X"           "tBodyAcc-mean-Y"          
 [5] "tBodyAcc-mean-Z"           "tBodyAcc-std-X"           
 [7] "tBodyAcc-std-Y"            "tBodyAcc-std-Z"           
 [9] "tGravityAcc-mean-X"        "tGravityAcc-mean-Y"       
[11] "tGravityAcc-mean-Z"        "tGravityAcc-std-X"        
[13] "tGravityAcc-std-Y"         "tGravityAcc-std-Z"        
[15] "tBodyAccJerk-mean-X"       "tBodyAccJerk-mean-Y"      
[17] "tBodyAccJerk-mean-Z"       "tBodyAccJerk-std-X"       
[19] "tBodyAccJerk-std-Y"        "tBodyAccJerk-std-Z"       
[21] "tBodyGyro-mean-X"          "tBodyGyro-mean-Y"         
[23] "tBodyGyro-mean-Z"          "tBodyGyro-std-X"          
[25] "tBodyGyro-std-Y"           "tBodyGyro-std-Z"          
[27] "tBodyGyroJerk-mean-X"      "tBodyGyroJerk-mean-Y"     
[29] "tBodyGyroJerk-mean-Z"      "tBodyGyroJerk-std-X"      
[31] "tBodyGyroJerk-std-Y"       "tBodyGyroJerk-std-Z"      
[33] "tBodyAccMag-mean"          "tBodyAccMag-std"          
[35] "tGravityAccMag-mean"       "tGravityAccMag-std"       
[37] "tBodyAccJerkMag-mean"      "tBodyAccJerkMag-std"      
[39] "tBodyGyroMag-mean"         "tBodyGyroMag-std"         
[41] "tBodyGyroJerkMag-mean"     "tBodyGyroJerkMag-std"     
[43] "fBodyAcc-mean-X"           "fBodyAcc-mean-Y"          
[45] "fBodyAcc-mean-Z"           "fBodyAcc-std-X"           
[47] "fBodyAcc-std-Y"            "fBodyAcc-std-Z"           
[49] "fBodyAccJerk-mean-X"       "fBodyAccJerk-mean-Y"      
[51] "fBodyAccJerk-mean-Z"       "fBodyAccJerk-std-X"       
[53] "fBodyAccJerk-std-Y"        "fBodyAccJerk-std-Z"       
[55] "fBodyGyro-mean-X"          "fBodyGyro-mean-Y"         
[57] "fBodyGyro-mean-Z"          "fBodyGyro-std-X"          
[59] "fBodyGyro-std-Y"           "fBodyGyro-std-Z"          
[61] "fBodyAccMag-mean"          "fBodyAccMag-std"          
[63] "fBodyBodyAccJerkMag-mean"  "fBodyBodyAccJerkMag-std"  
[65] "fBodyBodyGyroMag-mean"     "fBodyBodyGyroMag-std"     
[67] "fBodyBodyGyroJerkMag-mean" "fBodyBodyGyroJerkMag-std" 

5.Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.
The result is saved as tidy_data2.txt, a 180x68 data frame, where as before, the first column contains activity names, the second column contains subject IDs,and then the averages for each of the 66 attributes are in columns 3...68. There are 180 rows in this data set with averages.
