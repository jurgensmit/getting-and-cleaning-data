#
# 1. Merges the training and the test sets to create one data set.
#

# Read the training data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt') 

# Read the test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt') 

# Merge the training and test sets
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#

# Read the feature labels
feature_labels <- read.table("UCI HAR Dataset/features.txt")

# Get the mean and standard deviation measurements
applicable_columns <- grep("-(mean|std)\\(\\)-", feature_labels[, 2])

# Extract the applicable columns
X <- X[, applicable_columns]

#
# 3. Uses descriptive activity names to name the activities in the data set
#

# Read the activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Translate the numeric activity labels to descriptive labels
y[, 1] <- tolower(activity_labels[y[, 1], 2])

#
# 4. Appropriately labels the data set with descriptive variable names. 
#

# Label columns of the activity and subject data sets
names(y) <- "activity"
names(subject) <- "subject"

# Extract the applicable feature labels
applicable_feature_labels <- feature_labels[applicable_columns, 2]

# Clean-up the feature labels
applicable_feature_labels <- tolower(gsub("-|\\(\\)", "", applicable_feature_labels))

# Label the features
names(X) <- applicable_feature_labels

# Create a single data set from the subject, activity and feature data sets
data <- cbind(subject, y, X)

#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject.
#

# Aggregate the data over subject and activity. Note: Exclude the first 2 columns, activity and subject
# as they are the aggregation variables
tidy_data <- aggregate(data[-c(1, 2)], by = list(subject = data$subject, activity = data$activity), mean)

# Relabel the data columns to denote that they are the means of the aggregated data
names(tidy_data) <- c(names(tidy_data[1:2]), paste("mean", names(tidy_data[-c(1, 2)]), sep = ""))

# Write the tidy data set to disk
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
