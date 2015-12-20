
# Getting and Cleaning Data Course Project

## 1. Introduction

This course project is one of the deliverables required for the Coursera course "Getting and Cleaning Data".

## 2. Purpose

The purpose of this project is to demonstrate one's ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## 3. Objectives

It is required that one R script called run_analysis.R is created, which does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## 4. Explanation of how the run_analysis.R script works

1. Working directory was set
2. Necessary libraries were loaded into R. "data.table" library was required to perform data table / data frame specific work and "dplyr" was used to aggregate the final tidy data.
3. Thereafter, all the required data were read into R. In addition to the training and test datasets, column names (i.e. features), activities (i.e. activity labels as well as activity names) and subjects (ranging from 1 to 30) were read in.
4. Column names from features were used to rename the column names of the training and test datasets. Furthermore, only the mean and std columns were selected as this was the subset of the data required for the tidy data.
5. Activity names and subjects were added to both the training and test data as additional columns, and the columns in the datasets were rearranged so that activity names and subjects were the first columns in the datasets.
6. Using the rbind() function, the training and test datasets were combined into one dataset.
7. Using the aggregate() function, mean of each mean and std columns were calculated grouped by subject and activity name.
8. Finally, this tidy data was then written into a txt file.