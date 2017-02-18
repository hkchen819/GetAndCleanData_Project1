# Human Activity Recognition Using Smartphones
***

#### The original dataset: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


## Variables

>### For each record it is provided:
>- 66 measurements from the accelerometer and gyroscope.
>- Its activity label. 
>- An identifier of the subject who carried out the experiment.

### subject
***
#### There are 30 subjects included in this dataset.

### activity
***
#### Six activities are labeled, include:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
	
### 66 measurements
***

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

## Tranformation
####The following transformations were performed on the default dataset:

- The training and the test sets were merged together.
- Only the measurements on the mean and standard deviation were extracted.
- Descriptive activity and variable names were labeled.
- A second tidy data set with the average of each variable for each activity and each subject was created.