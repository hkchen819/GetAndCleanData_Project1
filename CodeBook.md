# Human Activity Recognition Using Smartphones

## Data

#### The original dataset: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

- The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities listed below wearing a smartphone (Samsung Galaxy S II) on the waist. 

- Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity are captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.




## Variables

>### For each record it is provided:
>- 66 measurements from the accelerometer and gyroscope.
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.

### subject

#### There are 30 subjects included in this dataset.

### activity

#### Six activities are labeled, include:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
	
### 66 measurements

>-      Prefix **'t'** to denote time, prefix **'f'** to indicate frequency domain signals.
>-      The acceleration signal from accelerometer was then separated into body and gravity acceleration signals (**tBodyAcc** and **tGravityAcc**).
>-      The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (**tBodyAccJerk** and **tBodyGyroJerk**).
>-      The magnitude of these three-dimensional signals were calculated using the Euclidean norm (**tBodyAccMag**, **tGravityAccMag**, **tBodyAccJerkMag**, **tBodyGyroMag**, **tBodyGyroJerkMag**). 
>-      A Fast Fourier Transform (FFT) was applied to some of these signals producing **fBodyAcc**, **fBodyAccJerk**, **fBodyGyro**, **fBodyAccJerkMag**, **fBodyGyroMag**, **fBodyGyroJerkMag**. 
>-      **mean** and **std** representing mean value and standard deviation were used to analyze above signals.
>-      **XYZ** is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc_mean__X
- tBodyAcc_mean__Y
- tBodyAcc_mean__Z
- tBodyAcc_std__X
- tBodyAcc_std__Y
- tBodyAcc_std__Z
- tGravityAcc_mean__X
- tGravityAcc_mean__Y
- tGravityAcc_mean__Z
- tGravityAcc_std__X
- tGravityAcc_std__Y
- tGravityAcc_std__Z
- tBodyAccJerk_mean__X
- tBodyAccJerk_mean__Y
- tBodyAccJerk_mean__Z
- tBodyAccJerk_std__X
- tBodyAccJerk_std__Y
- tBodyAccJerk_std__Z
- tBodyGyro_mean__X
- tBodyGyro_mean__Y
- tBodyGyro_mean__Z
- tBodyGyro_std__X
- tBodyGyro_std__Y
- tBodyGyro_std__Z
- tBodyGyroJerk_mean__X
- tBodyGyroJerk_mean__Y
- tBodyGyroJerk_mean__Z
- tBodyGyroJerk_std__X
- tBodyGyroJerk_std__Y
- tBodyGyroJerk_std__Z
- tBodyAccMag_mean
- tBodyAccMag_std
- tGravityAccMag_mean
- tGravityAccMag_std
- tBodyAccJerkMag_mean
- tBodyAccJerkMag_std
- tBodyGyroMag_mean
- tBodyGyroMag_std
- tBodyGyroJerkMag_mean
- tBodyGyroJerkMag_std
- fBodyAcc_mean__X
- fBodyAcc_mean__Y
- fBodyAcc_mean__Z
- fBodyAcc_std__X
- fBodyAcc_std__Y
- fBodyAcc_std__Z
- fBodyAccJerk_mean__X
- fBodyAccJerk_mean__Y
- fBodyAccJerk_mean__Z
- fBodyAccJerk_std__X
- fBodyAccJerk_std__Y
- fBodyAccJerk_std__Z
- fBodyGyro_mean__X
- fBodyGyro_mean__Y
- fBodyGyro_mean__Z
- fBodyGyro_std__X
- fBodyGyro_std__Y
- fBodyGyro_std__Z
- fBodyAccMag_mean
- fBodyAccMag_std
- fBodyBodyAccJerkMag_mean
- fBodyBodyAccJerkMag_std
- fBodyBodyGyroMag_mean
- fBodyBodyGyroMag_std
- fBodyBodyGyroJerkMag_mean
- fBodyBodyGyroJerkMag_std

## Tranformation performed to clean up the data

####The following transformations were performed on the default dataset:

- Get the default dataset.  
**Download and unzip the dataset.**

```r
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "data.zip")
unzip("data.zip")
```

- The training and the test sets were merged together.  
**Use rbind() in R.**

```r
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
data <- rbind(train, test)
```

- Only the measurements on the mean and standard deviation were extracted.  
**Find feature names with mean() or std().**

```r
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
mean_std_idx <- grep("(mean|std)\\(", features$V2)
data_full <- data[mean_std_idx]
```
- Descriptive activity names were labeled.  
**Use Human readable labels instead of numbers.**

```r
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
activity <- rbind(activity_train, activity_test)
names(activity) <- "activity"
activity_name <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("level", "label"))
activity <- factor(unlist(activity), labels = activity_name$label)
```

- Descriptive variable names were labeled.  
**Replace all dash lines and parentheses with underline.**

```r
col_names <- gsub("\\(\\)$", "", features$V2[mean_std_idx])
col_names <- gsub("(-|\\(\\))", "_", col_names)
names(data_full) <- col_names
```

- Subject info is extracted and combined with activity info and measurements.  
**Use rbind() and cbind() in R. Data frame "data_full" is generated.**


```r
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"
data_full <- cbind(subject, activity, data_full)
```

- A second tidy data set with the average of each variable for each activity and each subject was created. Stored the data set into file.  
**Use aggregate() in R to separate data into groups by each subject and each activity and get the average of each variable as data frame "data_tidy".  **
**Use write.table() to store the final result.**


```r
data_tidy <- aggregate(.~subject+activity, data = data_full, mean)
write.table(data_tidy, "analysis.txt", row.name=FALSE)
```
