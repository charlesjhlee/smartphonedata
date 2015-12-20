
###########Getting and Cleaning Data Course Project#######

#Create one R script called run_analysis.R 
#that does the following: 

#Merges the training and the test sets to create one data set.

#Extracts only the measurements on the mean and standard deviation 
#for each measurement. 

#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names. 

#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.


#set working directory
setwd("C:/Users/LEEJNC/Google Drive/Coursera/getting_cleaning_data/project")
getwd()


#load required libraries
library(data.table)
library(dplyr)

################ Read in Data #######################

#read in training data
train.source <- read.table("../UCI HAR Dataset/train/X_train.txt")
traindata <- train.source

#read in test data
test.source <- read.table("../UCI HAR Dataset/test/X_test.txt")
testdata <- test.source

#read in training and test data labels
trainlabel <- read.table("../UCI HAR Dataset/train/y_train.txt")
testlabel <- read.table("../UCI HAR Dataset/test/y_test.txt")


#read in features and activity labels
features <- read.table("../UCI HAR Dataset/features.txt")
activities <- read.table("../UCI HAR Dataset/activity_labels.txt")


#read in subjects ranging from 1 to 30
trainsubjects <- read.table("../UCI HAR Dataset/train/subject_train.txt")
testsubjects <- read.table("../UCI HAR Dataset/test/subject_test.txt")

#####################################################

########### Data preparation#########################

#Assign correct column names to the training and test data
names(traindata) <- features$V2
names(testdata) <- features$V2


#extract mean and standard deviation columns from each of the dataset
#did not extract meanfreq as these are not the same as mean
selectedcolumns <- grepl("mean\\(\\)|std\\(\\)", features$V2)
trainset <- traindata[, selectedcolumns]
testset <- testdata[, selectedcolumns]


#add activity label and activity name columns to the training and test data
trainlabel$activity_name = activities[trainlabel$V1, 2]
testlabel$activity_name = activities[testlabel$V1, 2]

trainset$activity_label <- trainlabel$V1
testset$activity_label <- testlabel$V1

trainset$activity_name <- trainlabel$activity_name
testset$activity_name <- testlabel$activity_name


#add subjects to the training and test data
trainset$subject <- trainsubjects$V1
testset$subject <- testsubjects$V1


#move linked columns to the front (and remove activity label as no longer needed)
trainset <- cbind("activity_name" = trainset$activity_name, "subject" = trainset$subject, traindata[,selectedcolumns])
testset <- cbind("activity_name" = testset$activity_name, "subject" = testset$subject, testdata[,selectedcolumns])

#combine the training and test data
fulldata <- rbind(trainset, testset)

###########################################################


#############Tidy subset data creation####################

#Create a second, independent tidy data set with the average of each variable for each activity and each subject
data_subset <- aggregate(fulldata[, 3:ncol(fulldata)], by=list("subject" = fulldata$subject, "activity_name" = fulldata$activity_name), mean)

##########################################################


############## Write to txt file for submission ##########

write.table(data_subset, file = "tidy_data.txt", row.names = FALSE)

