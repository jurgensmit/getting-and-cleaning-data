# Coursera - Getting and Cleaning Data - Course Project

## Goal

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare a tidy data that can be used for later analysis.

## Input

The input of the project is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can be found here:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Processing

The processing is performed by the script run_analysis.R. The script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script expects the input data to be present in the sub folder "UCI HAR Dataset".

## Output

The output of the script will be a tidy data set named "tidy_data.txt" which will be written to the working folder.