
## Get and process data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "data.zip")
unzip("data.zip")

## 1. Merges the training and the test sets to create one data set.
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
data <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
mean_std_idx <- grep("(mean|std)\\(", features$V2)
data_full <- data[mean_std_idx]

## 3. Uses descriptive activity names to name the activities in the data set
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
activity <- rbind(activity_train, activity_test)
names(activity) <- "activity"
activity_name <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("level", "label"))
activity <- factor(unlist(activity), labels = activity_name$label)

## 4. Appropriately labels the data set with descriptive variable names
col_names <- gsub("\\(\\)$", "", features$V2[mean_std_idx])
col_names <- gsub("(-|\\(\\))", "_", col_names)
names(data_full) <- col_names

## extracts subject
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"

## merges all pieces together
data_full <- cbind(subject, activity, data_full)

##5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_tidy <- aggregate(.~subject+activity, data = data_full, mean)
write.table(data_tidy, "analysis.txt", row.name=FALSE)