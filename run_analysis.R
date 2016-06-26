##R script run_analysis.R that does the following:
##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement.
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names.
##From the data set above, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Assumptions:
## The following files activity_labels.txt, features.txt, subject_test.txt, subject_train.txt, X_test.txt, y_test.txt, X_train.txt, y_train.txt
## are copied into the same folder where run_analysis.R is saved and executed
## run_analysis.R depends on data.table, dplyr packages

## Install data.table, dplyr packages if needed
if(!require('dplyr')) {
    install.packages('dplyr')
}

## Load dplyr library
library(dplyr)

## Read activity labels
actlabs <- read.table('activity_labels.txt')$V2

## Read features
ftrs <- read.table('features.txt')$V2

## Read test data
X_test <- read.table('X_test.txt')
y_test <- read.table('y_test.txt')
subject_test <- read.table('subject_test.txt')

## Assign col names for subject
names(subject_test) <- 'subject'

## Add activity description and assign col names
y_test_descr <- cbind(y_test, as.data.frame(actlabs[y_test[,1]]))
names(y_test_descr) <- c('actid', 'actdescr')

## Add column names to test data
names(X_test) <- ftrs

## Find mean, std columns only
X_test_meanstd <- X_test[,grepl('mean|std', ftrs)]

## Combine subject, activity and test to get tidy testdata
testdata <- cbind(subject_test, y_test_descr, X_test_meanstd)

## Read train data
X_train <- read.table('X_train.txt')
y_train <- read.table('y_train.txt')
subject_train <- read.table('subject_train.txt')

## Assign col names for subject
names(subject_train) <- 'subject'

## Add activity description and assign col names
y_train_descr <- cbind(y_train, as.data.frame(actlabs[y_train[,1]]))
names(y_train_descr) <- c('actid', 'actdescr')

## Add column names to test data
names(X_train) <- ftrs

## Find mean, std columns only
X_train_meanstd <- X_train[,grepl('mean|std', ftrs)]

## Combine subject, activity and train data to get tidy traindata
traindata <- cbind(subject_train, y_train_descr, X_train_meanstd)

## merge testdata and traindata
mergeddata <- rbind(testdata, traindata)

## group mergeddatat by subject and actdescr. Perform mean on the grouped data
## Using dplyr summarize_each and group_by functions
tidydata <- summarize_each(group_by(mergeddata, subject, actdescr), funs(mean))

