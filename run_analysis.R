## Checks to see if data file is available and if not downloads and unzips it
if(!file.exists("UCI HAR Dataset")) {
	download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
		destfile = "getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")
	unzip("getdata-projectfiles-UCI HAR Dataset.zip")
}

## Read in all files and clean up formatting
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Set column names of 'act_labels' for clarity
colnames(act_labels) <- c("act_key", "activity")

## Replace "_" with " " and convert uppercase to lowercase in 'activity' column
act_labels$activity <- gsub("_", " ", tolower(act_labels$activity))

features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
## Cleans up features, makes 'features' more descriptive for better clarity of column names and makes lowercase for tidy data
features$V2 <- gsub("^t", "time.", features$V2)
features$V2 <- gsub("^f", "frequency.", features$V2)
features$V2 <- gsub("-", ".", features$V2)
features$V2 <- gsub("[()]", "", features$V2)
features$V2 <- tolower(features$V2)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

## Set x_test & x_train column names equal to 'features' with all lowercase letters (to make tidy)
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE, col.names = features$V2, check.names = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)


subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE, col.names = features$V2, check.names = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

## Create xys_test & xys_train data frames by adding subject number and activity key columns to x_test & x_train
xys_test <- cbind(x_test, subject_test, y_test)
## Set column names of 'xys_test' for clarity
colnames(xys_test)[562:563] <- c("subject", "act_key")

xys_train <- cbind(x_train, subject_train, y_train)
## Set column names of 'xys_train' for clarity
colnames(xys_train)[562:563] <- c("subject", "act_key")

## Create all_dat data frame by combining xys_test & xys_train
test_train <- rbind(xys_test, xys_train)

## Add Descriptive activity names by merging test_train & act_labels on the act_key column for each
all_dat <- merge(test_train, act_labels, by.x="act_key", by.y="act_key")

## Subsets data to exclude measurements that are not the mean or standard deviation
all_dat_sub <- all_dat[, c(2:7, 42:47, 82:87, 122:127, 162:167, 202:203, 
	215:216, 228:229, 241:242, 254:255, 267:272, 346:351, 425:430, 504:505, 517:518, 530:531, 543:544, 563:564)]

## Reshapes data using 'melt' function and then calculates the mean of each subject/activity using 'dcast' function
library(reshape2)
dat_melt <- melt(all_dat_sub, id=c("subject", "activity"), measure.vars=c(names(all_dat_sub[1:66])))
dat_mean <- dcast(dat_melt, subject + activity ~ variable, mean)

## Makes txt file of tidy data described in step 5
write.table(dat_mean, file="tidy_data.txt", row.names=FALSE)