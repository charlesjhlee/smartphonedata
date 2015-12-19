
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

#####################################################

########### Data preparation#########################

#Assign correct column names to the training and test data
names(traindata) <- features$V2
names(testdata) <- features$V2

#add label column to the training and test data
traindata$label <- trainlabel$V1
testdata$label <- testlabel$V1

