# Getting and Cleaning Data: Course Project

## Introduction

This project consists of manipulating the Human Activity Recognition dataset available at: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

The accompanying [run_analysis.R](https://github.com/saifs/GetCleanDataProject/blob/master/run_analysis.R) contains the script to perform this task and the [CodeBook.md](https://github.com/saifs/GetCleanDataProject/blob/master/CodeBook.md) contains the description of the tidy data and its variables.

The experiment involves 30 volunteers between the ages of 19 and 48 each performing six physical activitings wearing a smartphone on their waist. The phone is a Samsung Galaxy S II that has a built-in accelerometer for measuring linear acceleration and a gyroscope for measuring angular velocity. The signals are captured at a constant rate of 50Hz. The original dataset was not tidy, had errors and spanned several files to make it functional.

## Analysis

Here we explain the steps taken in the *run_analysis.R* file to achieve a tidy dataset.

#### Load the data 

The UCI HAR dataset spans several files. In our project, we require the training and test dataset files that make up 70% and 30% of the volunteers, respectively. We also require the files with the subject and activity labels as well as the files with the descriptive names of the activities and measurements. We load all of them. We also load the *dplyr* package to be used for data manipulation. The script begins with the assumption that the Samsung data is available in the working directory in an unzipped 'UCI HAR Dataset' folder.


```r
library(dplyr)
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.label <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.label <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt", colClasses="character")
```

#### Clean the variable names to make them descriptive

We notice that the *features.txt* and *activity_labels.txt* files have typographical errors and invalid R variable name characters. We clean and modify them to make them descriptive variable names. Now the names are more understandable with complete words instead of letters like 't' for time and 'f' for frequency. These new descriptive names allow the reader to understand what exactly is being measured.


```r
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
```

#### Merge sets and extract the required measurements

We then merge (concatenate) the test and train datasets by rows.


```r
merged <- bind_rows(test, train)
```

After we can insert the newly created clean descriptive column names for the measurements into the merged data.


```r
colnames(merged) <- c(clean.features)
```

The project guidelines for extracting only the measurements on the mean and standard deviation are open to interpretation. We interpret them by matching only the measurements with the keyword "mean" or "standard.deviation" (renamed earlier). This results in 86 columns.


```r
merged <- merged[, grep("mean|standard.deviation", colnames(merged), ignore.case = TRUE)]
```

#### Create a tidy data set

We use the *dplyr* package in R that allows us to combine several steps into one code chunk. This chunk runs faster and is readible, making it easy to follow. This important step of the data analysis will tidy the merged data and store it to a new wide form dataset. Below are the steps in order that explain the code chunk, corresponding to each line of code.

1. Assign the dyplr code chunk to a new variable that will contain the tidy dataset once the instructions are complete.
2. Combine the test and train activity labels by rows, then combine this to the merged data as a new left column.
3. Rename the new column for activity in the merged data.
4. Combine the test and train subject labels by rows, then combine this to
the merged data as a new left column.
5. Rename the new column for subject in the merged data.
6. Group the data by each subject and their activities. This will sort the table according to the subject column in ascending order. Within each subject, the activity column will also be sorted in ascending order. Likewise, the measurements will automatically sort accordingly to the grouping.
7. Summarize the data by taking the average of each measurement in the new grouped table, for each activity and each subject.
8. Replace the activity 'numbers' with the activity descriptive names
since this column is now grouped and ordered as 1 to 6. These new names are words that are easily understood by the reader as to which physical activity.


```r
tidyset <- merged %>%
    bind_cols(bind_rows(test.label, train.label),.) %>%
    rename(Activity=V1) %>%
    bind_cols(bind_rows(test.subject, train.subject),.) %>%
    rename(Subject=V1) %>%
    group_by(Subject, Activity) %>%
    summarise_each(funs(mean)) %>%
    mutate(Activity = rep(activity.labels[,2]))
```

Finally, we write the new independent tidy data set to a file that is uploaded per project requirement.


```r
write.table(tidyset, file="tidyset.txt", row.names = FALSE)
```

## Result

The new tidy data set saved as *tidyset.txt* consists of 180 rows (observations) and 88 columns, with column 1 being *Subject*, column 2 being *Activity* and the remaining columns being the measurements involving mean and standard deviation, summarized by their averages. Since there are 30 volunteers and each performs 6 physical activities, each of the 180 observations are different.

The wide form of the data was chosen as this analysis leaves each column with a different variable. All principles of tidy data were followed:

1. Each variable being measured has its own column.
2. Each row is a different observation of that variable.
3. There are no duplicate columns.
4. There are human-readible variable names for each column.

* https://github.com/jtleek/datasharing
