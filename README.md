Getting and Cleaning Data

Course Project

 You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Steps to complete the project

1. Download data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ] in to your RStudio working directory. This will create a folder, UCI HAR Dataset,  under your working forlder.
2. Download the run_analysis.R script in your RStudio working folder so that it stays where you have already downloaded the dataset.
3. Please modify run_analysis.R script to set your working directory. To do that please change the line, which starts with setwd().
4. Finally, run the run_analysis.R script and collect tidydata.txt from your working directory.
 
Dependencies:
1. Please make sure to install reshape2 package, because run_analysis.R is using it.
