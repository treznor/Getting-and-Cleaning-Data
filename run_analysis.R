# -------------------------------------------------
# Process the UCI HAR dataset
# Course: Getting and Cleaning Data
# Project: Course Project
# Author: Mike Felts
# -------------------------------------------------
# If required packages are not present then install them.
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr)

# If the dataset is not present in the current working directory then download it
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("data/UCI HAR Dataset")) {
  if (!file.exists("data")) {
    dir.create("data")
  }
  download.file(fileUrl, destfile="data/UCIHAR.zip")
  unzip("data/UCIHAR.zip", exdir="data")
}

# -------------------------------------------------
# Step 1: Merges the training and the test sets to create one data set.
# -------------------------------------------------

# Load the train data tables
train.subject=read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names="subject")
train.x=read.table("data/UCI HAR Dataset/train/x_train.txt")
train.y=read.table("data/UCI HAR Dataset/train/y_train.txt", col.names="activity")

# Make one large train matrix
train <- cbind(train.subject, train.y, train.x)

# Load the test data tables
test.subject=read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names="subject")
test.x=read.table("data/UCI HAR Dataset/test/x_test.txt")
test.y=read.table("data/UCI HAR Dataset/test/y_test.txt", col.names="activity")

# Make one large test matrix
test <- cbind(test.subject, test.y, test.x)

# Combine together thek train and test matrices
UCIdata <- rbind(test, train)

# -------------------------------------------------
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# -------------------------------------------------

# Load the names of features and create a filtered list of features
features.full = read.table("data/UCI HAR Dataset/features.txt", col.names=c("id","name"))
features.list <- c("subject","activity",as.vector(features.full$name))
features <- grepl("mean|std|subject|activity",features.list) & !grepl("meanFreq", features.list)

# Filter the data to only include columns for features that are either mean or std data
UCIdata.filtered <- UCIdata[,features]

# -------------------------------------------------
# Step 3: Uses descriptive activity names to name the activities in the data set
# -------------------------------------------------

# Load the names of activity labels
activity.labels = read.table("data/UCI HAR Dataset/activity_labels.txt", col.names=c("id","name"))

# Apply activity labels to the filtered data set using a replacement from the activity list using sapply
UCIdata.filtered$activity <- sapply(UCIdata.filtered$activity, function(x) activity.labels[x,2])

# -------------------------------------------------
# Step 4: Appropriately labels the data set with descriptive variable names.
# -------------------------------------------------
# Create the list of feature names to use
features.filtered_names <- features.list[features]

# Give the data set column names by applying the filtered feature list to the data set
names(UCIdata.filtered) <- features.filtered_names

# -------------------------------------------------
# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# -------------------------------------------------
# Transform the data frame into a table in order to use the data.table package. I think this could
#       probably be done using dplyr and summarise_each, but 
UCIdata.filtered.out <- tbl_df(UCIdata.filtered) %>%  group_by(subject, activity) %>%
  summarise_each(funs(mean))
  

# Output the data to a file
write.table(UCIdata.filtered.out, file="UCIoutput.txt", row.name=FALSE)