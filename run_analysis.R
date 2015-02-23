# Data Science Specialization: Getting and Cleaning Data Course Project

# set the working directory to 'UCI HAR Dataset'

# read and merge the train data
train_x <- read.table('train/X_train.txt')
train_y <- read.table('train/Y_train.txt')
train_subject <- read.table('train/subject_train.txt')
train_data <- cbind(train_subject, train_y, train_x)
# read and merge the test data
test_x <- read.table('test/X_test.txt')
test_y <- read.table('test/Y_test.txt')
test_subject <- read.table('test/subject_test.txt')
test_data <- cbind(test_subject, test_y, test_x)
# merge the training and the test sets to create one data set.
big_data <- rbind(train_data, test_data)
features <- c('subject', 'activity', as.character(read.table('features.txt')[,2]))
names(big_data) <- features
# extract only the measurements on the mean and standard deviation for each measurement
columns<-grepl("activity|subject|mean\\(\\)|std\\(\\)", names(big_data))
big_data <- big_data[,columns]
# use descriptive activity names to name the activities in the data set
activity_label <- read.table('activity_labels.txt', col.names=c('activity', 'activity_label'))
big_data <- aggregate(big_data, list(big_data$subject, big_data$activity), mean)[,3:70]
big_data <- merge(activity_label, big_data)[,c(3,2,4:69)]
# label the data set with descriptive variable names
names(big_data) <- gsub("\\()","", names(big_data))
names(big_data) <- gsub("^t", "time", names(big_data))
names(big_data) <- gsub("^f", "frequency", names(big_data))
names(big_data) <- gsub("BodyBody", "Body", names(big_data))
names(big_data) <- gsub("Acc", "Accelerometer", names(big_data))
names(big_data) <- gsub("Gyro", "Gyroscope", names(big_data))
names(big_data) <- gsub("Mag", "Magnitude", names(big_data))
# write the data to a tidy data set as txt file
write.table(big_data, "tidy.txt", row.names=FALSE)