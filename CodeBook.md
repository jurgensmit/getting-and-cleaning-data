# Coursera - Getting and Cleaning Data - Course Project

## Input Data Set

The input data set contains the data about experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the dataset it is provided: 

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Processing

The script run_analysis.R is used to prepare a tidy data set from the input data that can be used for later analysis.

### Step 1: Merges the training and the test sets to create one data set.

The feature, activity and subject data is read from respectively the files X_*.txt, y_*.txt and subject_*.txt files from the training and test folder. The training and test data are combined into one data set with the names X, y and subject

### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

The mean and standard deviation columns are being extracted from the features data set X, the other features are discarded.

### Step 3: Uses descriptive activity names to name the activities in the data set

Relabel the activity data y with the labels as found in the file features.txt.

### Step 4: Appropriately labels the data set with descriptive variable names. 

Label the activity and subject columns as activity and subject. Relabel the feature columns to make them tidy, i.e. all lower case and remove the minus sign and parentheses from the column names.

The subject (subject), activity (y) and feature (X) data sets are combined into one big data set data.

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To create the tidy data set the data is grouped (aggregated) by subject and activity. Of the resulting groups the mean is calculated.

To finish the tidy data the column names of the calculated values are prepended with mean after which the tidy data set is written to a file on disk with the name "tidy_data.txt".

## Output Data Set

The output data set "tidy_data.txt" has the following columns:

Column              | Description
--------------------|------------------------------------------------------------
subject             | An identifier of the subject who carried out the experiment
activity            | Activity label
mean*               | The mean of the features for the given subject and activity