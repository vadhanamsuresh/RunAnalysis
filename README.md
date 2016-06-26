# RunAnalysis
Getting and Cleaning Data Programming Assignment

The purpose of this assignment is to prepare tidy data as part of Getting and Cleaning Data Coursera course.

Data source for the assignment is located at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The goal is to create an R script file that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This data set includes the following files:
- 'README.md'
- 'CodeBook.md' -  Code book that describes the variables, the data, and any transformations or work that was performed to clean up the data
- 'run_analysis.R' - R script file that performs the data clean up and produces tidydata.txt output file

How to use this data set:
* Download 'UCI HAR Dataset.zip' file from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' into the same folder which contains 'run_analysis.R'.
* Extract 'UCI HAR Dataset.zip' to the same folder that contins 'run_analysis.R'. The folder that contains 'run_analyis.R' also contains the sub folder 'UCI HAR Dataset'.
* Set the folder that contains 'run_analyis.R' and sub folder 'UCI HAR Dataset' as the working directory in RStudio.
* Run source("run_analysis.R") and it will generate a new file tinydata.txt in the working directory.
