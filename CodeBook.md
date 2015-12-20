
# CodeBook for "tidy_data.txt"

This is a code book that describes all the variables and summaries calculated, along with units, and any other relevant information relating to "tidy_data.txt"

## 1. Original Data

* The original dataset was downloaded from - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* The description of each of the elements found in the original dataset can be found in "README.txt" and "features_info.txt" of the above zip file. Please refer to these documents for the original document and variable descriptions.

## 2. Variables in "tidy_data.txt"

The following variables are included in "tidy_data.txt":

```{r}
subject - An identifier of the subject who carried out the experiment.Its range is from 1 to 30. The data is identical to those found in "subject_train.txt" and "subject_test.txt" in the zip file.
```

```{r}
activity_name - 6 activity labels. The activities are Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing and Laying. Lables found in "y_train.txt" and "y_test.txt" were mapped onto these activity names by using the mapping table "activity_labels.txt"
```

```{r}
Mean denoted by mean(), Standard Deviation denoted by std() were selected for each 3-axial signals X, Y and Z for the following variables:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

For example, the variable containing values for the mean of tBodyAcc Z-axis is denoted by "tBodyAcc-mean()-Z"

Please note that some variables did not have XYZ axis. These are the variables that end in the word "Mag".

Prefix "t" denotes time domain signals and hence the mean calculates average time and standard deviation calculates the length of time from the average time.

Prefix "f" denotes fast furier transformation and hence the units are frequency domain signals.

```

## 3. Transformation of data

* Per the objective of the course project, tidy data containing averages of the values in the variables mentioned in the third bullet point of above Section 2 were created.

* The averages were calculated for each distinct "subject" and "activity_name" combination.

## 4. Data Summary

* Total number of variables: 68
* Total number of rows: 180
* Grouping variables: "subject", "activity_name"
* Value/Data variables: tBodyAcc-mean()-X ... fBodyBodyGyroJerkMag-std()