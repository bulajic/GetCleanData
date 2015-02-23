## Getting and Cleaning Data Course Project
### Data
[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project.
### Full description
A [full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is available at the site where the data was obtained.

#### Goal
The goal of the **run_analysis.R** script is to accomplish the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Procedure
- set the working directory to 'UCI HAR Dataset'
- read and merge the train data
- read and merge the test data
- merge the training and the test sets to create one data set.
- extract only the measurements on the mean and standard deviation for each measurement
- use descriptive activity names to name the activities in the data set
- label the data set with descriptive variable names
- write the data to a tidy data set as txt file