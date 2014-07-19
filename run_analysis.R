## Make sure to set working directory to unzipped folder 
## for UCI HAR Dataset, located at:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Make sure to install plyr package into RStudio

library(plyr)


file3 <- "./UCI HAR Dataset/features.txt"
cols<-read.table(file3, stringsAsFactors=FALSE)

## Project req #2: Extract only the measurements on the mean and standard deviation for each measurement. 

index<-grepl("[Mm]ean|[Ss][Tt][Dd]", cols$V2)
index[555:561]<-FALSE

## Project req #4: Appropriately labels the data set with descriptive variable names. 
## This portion cleans up the elements of Features.TXT

cols2<-cols[index,]
cols2$V2<-gsub("^t", "Timedomain", cols2$V2)
cols2$V2<-gsub("^f", "Freqdomain", cols2$V2)
cols2$V2<-gsub("[Aa]cc", "Acceleration", cols2$V2)
cols2$V2<-gsub("[Mm]ean", "Mean", cols2$V2)
cols2$V2<-gsub("[Ss]td", "Stdev", cols2$V2)
cols2$V2<-gsub("-", "", cols2$V2)
cols2$V2<-gsub("[()]", "", cols2$V2)
cols2$V2<-gsub("X", "Xaxis", cols2$V2)
cols2$V2<-gsub("Y", "Yaxis", cols2$V2)
cols2$V2<-gsub("Z", "Zaxis", cols2$V2)



##  Project req #1: Merge the training and the test sets to create one data set.
##  This portion will combine columns for Test activities and subjects to the Test data
##  and combine the columns for the Train activities and subjects to the Train data
##  then combine the rows of both data sets into a super set

file1 <- "./UCI HAR Dataset/test/X_test.txt"
file2 <- "./UCI HAR Dataset/train/X_train.txt"
file5<-"./UCI HAR Dataset/test/subject_test.txt"
file6<-"./UCI HAR Dataset/test/y_test.txt"
file7<-"./UCI HAR Dataset/train/subject_train.txt"
file8<-"./UCI HAR Dataset/train/y_train.txt"

test<-read.table(file1)
test_subs<-read.table(file5)
test_acts<-read.table(file6)
colnames(test_subs)<-"Subject"
colnames(test_acts)<-"Activity"
test<-test[,index]
colnames(test)<-cols2$V2
test2<-cbind(test_subs, test_acts)
test2<-cbind(test2, test)

train<-read.table(file2)
train_subs<-read.table(file7)
train_acts<-read.table(file8)
colnames(train_subs)<-"Subject"
colnames(train_acts)<-"Activity"
train<-train[,index]
colnames(train)<-cols2$V2
train2<-cbind(train_subs, train_acts)
train2<-cbind(train2, train)

data<-rbind(test2, train2)

final<-ddply(data, .(Subject, Activity), numcolwise(mean))

##  Project req #3: Uses descriptive activity names to name the activities
##  in the data set

file4 <- "./UCI HAR Dataset/activity_labels.txt"
acts<-read.table(file4)

final$Activity<-gsub("1", acts$V2[1], final$Activity)
final$Activity<-gsub("2", acts$V2[2], final$Activity)
final$Activity<-gsub("3", acts$V2[3], final$Activity)
final$Activity<-gsub("4", acts$V2[4], final$Activity)
final$Activity<-gsub("5", acts$V2[5], final$Activity)
final$Activity<-gsub("6", acts$V2[6], final$Activity)

##  Project req #5 - Create independeny tidy data set with the average 
##  of each varilable for each activity and each subject

write.csv(final, file = "final.csv")
