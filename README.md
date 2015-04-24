### Getting-and-Cleaning-Data Course Project
## run_analysis.r
A file is taken in from a given URL (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) (if not previously present).

This file is unzipped and consists of sets of files for a 'test' dataset and a 'train' dataset along with labels for those datasets.

This data is combined and means are calculated for each 'feature' (a data measurement type) present.

The output can be read back into R:
```
outputdata <- read.table("UCIoutput.txt", header=TRUE)
```

#Code Book

Steps taken to clean the data:
- Data from the 'train' data set was combined so that the subject (subject_train), activity (y_train), and features (x_train) were together
- Data from the 'test' data set was combined so that the subject (subject_test), activity (y_test), and features (x_test) were together
- Data from these two resulting data sets were combined into one data set
- Using the feature list (features.txt) only features containing 'mean' or 'std' (but not 'meanFreq') were kept in the dataset
- The dataset was labelled using the filtered feature list
- Activity numbers were replaced by using the activity file (activity_labels.txt)
- For each subject (1 of 30 people performing the activities), activity pair the mean was calculated for each remaining feature

Activity labels:
- 1 - Walking
- 2 - Walking Upstairs
- 3 - Walking Downstairs
- 4- Sitting
- 5- Standing
- 6- Laying

Features remaining in the dataset, in order:
- tBodyAcc- mean()- X
- tBodyAcc- mean()- Y
- tBodyAcc- mean()- Z
- tBodyAcc- std()- X
- tBodyAcc- std()- Y
- tBodyAcc- std()- Z
- tGravityAcc- mean()- X
- tGravityAcc- mean()- Y
- tGravityAcc- mean()- Z
- tGravityAcc- std()- X
- tGravityAcc- std()- Y
- tGravityAcc- std()- Z
- tBodyAccJerk- mean()- X
- tBodyAccJerk- mean()- Y- 
- tBodyAccJerk- mean()- Z
- tBodyAccJerk- std()- X
- tBodyAccJerk- std()- Y
- tBodyAccJerk- std()- Z
- tBodyGyro- mean()- X
- tBodyGyro- mean()- Y
- tBodyGyro- mean()- Z
- tBodyGyro- std()- X
- tBodyGyro- std()- Y
- tBodyGyro- std()- Z
- tBodyGyroJerk- mean()- X
- tBodyGyroJerk- mean()- Y
- tBodyGyroJerk- mean()- Z
- tBodyGyroJerk- std()- X
- tBodyGyroJerk- std()- Y
- tBodyGyroJerk- std()- Z
- tBodyAccMag- mean()
- tBodyAccMag- std()
- tGravityAccMag- mean()
- tGravityAccMag- std()
- tBodyAccJerkMag- mean()
- tBodyAccJerkMag- std()
- tBodyGyroMag- mean()
- tBodyGyroMag- std()
- tBodyGyroJerkMag- mean()
- tBodyGyroJerkMag- std()
- fBodyAcc- mean()- X
- fBodyAcc- mean()- Y
- fBodyAcc- mean()- Z
- fBodyAcc- std()- X
- fBodyAcc- std()- Y
- fBodyAcc- std()- Z
- fBodyAccJerk- mean()- X
- fBodyAccJerk- mean()- Y
- fBodyAccJerk- mean()- Z
- fBodyAccJerk- std()- X
- fBodyAccJerk- std()- Y
- fBodyAccJerk- std()- Z
- fBodyGyro- mean()- X
- fBodyGyro- mean()- Y
- fBodyGyro- mean()- Z
- fBodyGyro- std()- X
- fBodyGyro- std()- Y
- fBodyGyro- std()- Z
- fBodyAccMag- mean()
- fBodyAccMag- std()
- fBodyBodyAccJerkMag- mean()
- fBodyBodyAccJerkMag- std()
- fBodyBodyGyroMag- mean()
- fBodyBodyGyroMag- std()
- fBodyBodyGyroJerkMag- mean()
- fBodyBodyGyroJerkMag- std()

Descriptions of these variables are in the original data code book.
