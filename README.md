Getting and Cleaning Data Project ReadMe
========================================

Data
----

The data for this project can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, a full description of the data is available here - http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From Course Project README.txt:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

See CodeBook.md for more details on the variables

run_analysis.R Script
---------------------

Lines 1-6:
Here I am checking to see if the data is in the working directory, if it is not then we download the data.

Lines 8-25:
Here I am reading some of the data as well as cleaning up the formating and adding column names where applicable for clariy. Additionally I make all of the column names lowercase so that they are conistent with 'tidy data'

Lines 27-34:
Here I am reading in additional data while at the same time setting their column names equal to some of the previous data already read in.

Lines 36-46:
Here I am combining the pieces of data read in to form a complete data frame. I also label certain column names for clarity.

Lines 48-49:
Here I am merging my complete data frame with another data frame so that we have a 'descriptive activity name' column instead of just a activity code.

Lines 51-53:
Here I am subsetting the data to include only the measurement columns that measure the mean or standard deviation. To subset these columns I manually recorded which columns met this requirement by number and chose to exclude the angle variables listed in the 'features_info.txt' file (gravityMean, 
tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean) as this data was not a simple mean or std on the original variables.

Lines 55-58:
Here I load the 'reshape2' R package and then use the melt function to reshape the data to make into less columns and more rows. Then I'm able to use the 'dcast' function to apply the 'mean' function along all measurements from each subject and activity. The result is a tidy data data frame of 180 rows (30 subjects times 6 activities) for each variable.

Lines 60-61:
Here I write the tidy data frame to a txt file called 'tidy_data.txt' which is the finished product.