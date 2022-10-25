# File: Download and Clean wearable data.R

# Overview in readme.md and data and steps explained in codebook.md


#step 0 loading libraries and getting data and reading in

library(dplyr)


dataUrl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"
dataPath <- "UCI HAR Dataset"

if (!file.exists(zipFile)) {
      download.file(dataUrl, zipFile, mode = "wb")
}

if (!file.exists(dataPath)) {
      unzip(zipFile)
}

#test set
testSub<- read.table(file.path(dataPath, "test", "subject_test.txt"))
testVal <- read.table(file.path(dataPath, "test", "X_test.txt"))
testAct <- read.table(file.path(dataPath, "test", "y_test.txt"))

#train set
trainSub <- read.table(file.path(dataPath, "train", "subject_train.txt"))
trainVal <- read.table(file.path(dataPath, "train", "X_train.txt"))
trainAct <- read.table(file.path(dataPath, "train", "y_train.txt"))

#list of acitivties (labelling)
activities <- read.table(file.path(dataPath, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

#list of features (feature names are duplicated (see fBodyAcc- bandsEnergy...))
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)


#############################
#1 Merges the training and the test sets to create one data set.

completeActivities <- rbind(
      cbind(trainSub, trainVal, trainAct),
      cbind(testSub, testVal, testAct)
)


# assign column names
colnames(completeActivities) <- c("subject", features[, 2], "activity")


#############################
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

coltemp <- grepl("subject|activity|mean|std", colnames(completeActivities))
completeActivities <- completeActivities[, coltemp]


#############################
#3 Uses descriptive activity names to name the activities in the data set

#get names from activities table to rename with values
completeActivities$activity <- factor(completeActivities$activity, levels = activities[, 1], labels = activities[, 2])

#############################
#4 Appropriately labels the data set with descriptive variable names. 

#renaming columns in temp set and replacing names in original data set

coltemp <- colnames(completeActivities)

# kill all special characters
coltemp <- gsub("[\\(\\)-]", "", coltemp)

# expand abbreviations
coltemp <- gsub("^f", "frequencyDomain", coltemp)
coltemp <- gsub("^t", "timeDomain", coltemp)
coltemp <- gsub("Acc", "Accelerometer", coltemp)
coltemp <- gsub("Gyro", "Gyroscope", coltemp)
coltemp <- gsub("Mag", "Magnitude", coltemp)
coltemp <- gsub("Freq", "Frequency", coltemp)
coltemp <- gsub("mean", "Mean", coltemp)
coltemp <- gsub("std", "StandardDeviation", coltemp)
coltemp <- gsub("BodyBody", "Body", coltemp) #remove duplicates of Body

# renaming columns in data set
colnames(completeActivities) <- coltemp


#############################
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# tidy data set, grouped by subject and activity and summarised using mean
wearableActivityMeans <- completeActivities %>% 
      group_by(subject, activity) %>%
      summarise_each(funs(mean))

# output file "tidy_data.txt"
write.table(wearableActivityMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)


#############################
#"Thanks" for the"Good luck!" :)