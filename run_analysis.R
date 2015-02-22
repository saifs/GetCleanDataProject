## Getting and Cleaning Data
## Course Project
##
## This program begins with the assumption that the Samsung data is 
## available in the working directory in an unzipped 'UCI HAR Dataset' folder.
##
## This program collects a dataset and cleans it with certain information
## extracted, organized and output as a tidy dataset.

## Load the dplyr package to be used for data manipulation
library(dplyr)

## Load table files necessary for tidying the data
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.label <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.label <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")

## Clean typos and invalid R variable name characters and make descriptive variable names
clean.features <- gsub("fBodyBody", "fBody", features[,2])
clean.features <- gsub("()", "", clean.features, fixed=TRUE)
clean.features <- gsub("-", "_", clean.features)
clean.features <- gsub("Jerk", ".Jerk", clean.features)
clean.features <- gsub("X", "X.axis", clean.features)
clean.features <- gsub("Y", "Y.axis", clean.features)
clean.features <- gsub("Z", "Z.axis", clean.features)
clean.features <- gsub("std", "standard.deviation", clean.features)
clean.features <- gsub("Mag", ".Magnitude", clean.features)
clean.features <- gsub("meanFreq", "mean.frequency", clean.features)
clean.features <- gsub("tBodyAcc", "Time.domain.body.accelerometer", clean.features)
clean.features <- gsub("tGravityAcc", "Time.domain.gravity.accelerometer", clean.features)
clean.features <- gsub("tBodyGyro", "Time.domain.body.gyroscope", clean.features)
clean.features <- gsub("tGravityGyro", "Time.domain.gravity.gyroscope", clean.features)
clean.features <- gsub("fBodyAcc", "Frequency.domain.body.accelerometer", clean.features)
clean.features <- gsub("fGravityAcc", "Frequency.domain.gravity.accelerometer", clean.features)
clean.features <- gsub("fBodyGyro", "Frequency.domain.body.gyroscope", clean.features)
clean.features <- gsub("fGravityGyro", "Frequency.domain.gravity.gyroscope", clean.features)
clean.features <- gsub("\\(", ".", clean.features)
clean.features <- gsub(",", "_", clean.features)
clean.features <- gsub(")", "", clean.features, fixed=TRUE)
clean.features <- gsub("Mean", ".mean", clean.features)
activity.labels[6,2]="LYING"

## Merge (concatenate) the test and train datasets by rows
merged <- bind_rows(test, train)
## Insert clean descriptive column names for the measurements into the merged data
colnames(merged) <- c(clean.features)
## Extract only the measurement columns with the mean and standard deviation
merged <- merged[, grep("mean|standard.deviation", colnames(merged), ignore.case = TRUE)]

## Tidy the merged data and store to a new wide form dataset
## 1. Combine test and train activity labels by rows, then combine this to
##    merged data as a new left column
## 2. Rename the new column for activity in the merged data
## 3. Combine test and train subject labels by rows, then combine this to
##    merged data as a new left column
## 4. Rename the new column for subject in the merged data
## 5. Group the data by each subject and their activities
## 6. Take the mean of each measurement in the new grouped table
## 7. Replace the activity 'numbers' with the activity descriptive names
##    since this column is now grouped and ordered as 1 to 6
tidyset <- merged %>%
    bind_cols(bind_rows(test.label, train.label),.) %>%
    rename(Activity=V1) %>%
    bind_cols(bind_rows(test.subject, train.subject),.) %>%
    rename(Subject=V1) %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(mean)) %>%
    mutate(Activity = rep(activity.labels[,2]))

## Write the new tidy data to a file
write.table(tidyset, file="tidyset.txt", row.names = FALSE)
