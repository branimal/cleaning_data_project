hw1 <- function() {
     ## load feature names
     features <<- read.table(file="./UCI HAR Dataset/features.txt")
     
     ## Load test data, test subjects and test activities
     X_test <<- read.fwf(file="./UCI HAR Dataset/test/X_test.txt", widths=c(rep(16,562))) 
     subject_test <<- read.table(file="./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
     activity_test <<- read.delim(file="./UCI HAR Dataset/test/y_test.txt", sep=" ", col.names=c("activity"), header=FALSE)

     ## re-label test data (step 4)
     names(X_test) <<- features[,2]
     
     ## prepend test subject and test activity to raw readings
     test_data <<- cbind(subject_test, activity_test, X_test)

     ## Load training data, test subjects and test activities
     X_train <<- read.fwf(file="./UCI HAR Dataset/train/X_train.txt", widths=c(rep(16,562))) 
     subject_train <<- read.table(file="./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
     activity_train <<- read.delim(file="./UCI HAR Dataset/train/y_train.txt", sep=" ", col.names=c("activity"), header=FALSE)
     
     ## re-label test data (step 4)
     names(X_train) <<- features[,2]

     ## prepend training subject and test activity to raw readings
     train_data <<- cbind(subject_train, activity_train, X_train)
}

hw2 <- function() {
     activities <<- read.delim(file="./UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE)
     ## merge test and train data (step 1)
     merged_data <<- rbind(test_data, train_data)
     merged_data[,2] <<- activities[merged_data[,2],2]

     ## retain only subject, activity, mean and std columns
     merged_data <<- merged_data[, grepl("std|mean|subject|activity", names(merged_data))]
     merged_data <<- merged_data[, !grepl("meanFreq|gravityMean", names(merged_data))]
     
     ## compute step 5, whatever that is
     step5 <<- aggregate(merged_data[3:68], list(subject=merged_data$subject, activity=merged_data$activity), mean)
     write.table(step5, file="./project1.txt")
}


