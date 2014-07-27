######################################################################################################################
#
# Human Activity Recognition Using Smartphones Data Set
#
# Project Goal:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
######################################################################################################################

###########################
# Initial setup
###########################
library(reshape2)        
setwd("Z:/Coursera/Data Science/Getting and Cleaning Data/Project")        

###########################
# Read Features
###########################
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("No","Name")
features <- rbind(features[grep("mean\\(\\)",features$Name),],features[grep("std\\(\\)",features$Name),])
features <- features[order(features$No),]

###########################
# Read Activities
###########################
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("No","Name")

###########################
# Combine Test data
###########################
features.test <- read.table("./UCI HAR Dataset/test/X_test.txt")[features$Name]
names(features.test) <- features$Name

activities.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(activities.test) <- c("Activity")
activities.test$Activity <- factor(activities.test$Activity, levels = activities$No, labels = activities$Name)

subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject.test) <- c("Subject")

test <- cbind(features.test, Activity = activities.test$Activity, Subject = subject.test$Subject)

###########################
# Combine Train data
###########################
features.train <- read.table("./UCI HAR Dataset/train/X_train.txt")[features$Name]
names(features.train) <- features$Name

activities.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(activities.train) <- c("Activity")
activities.train$Activity <- factor(activities.train$Activity, levels = activities$No, labels = activities$Name)

subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject.train) <- c("Subject")

train <- cbind(features.train, Activity = activities.train$Activity, Subject = subject.train$Subject)

###########################
# Joining test and train data
###########################
data <- rbind(test, train)


###########################
# Creating independent tidy data set with the average of each variable
# for each activity and each subject.
###########################
data <- melt(data, id = c("Subject", "Activity"))
data <- dcast(data, Subject + Activity ~ variable, mean)

###########################
# Save the tidy data.
###########################
write.table(data, "tidydata.txt", row.names = FALSE, quote = FALSE)

###########################
# Clean up
###########################
remove(list=ls())