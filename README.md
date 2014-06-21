README
Getting and Cleaning Data Project
========================================================
This is to explain how the scripts work and how they are connected 

This work is cleaning data collected from the accelerometers from the Samsung Galaxy S smartphone. The experiement is carried out with a group of 30 volunteers who performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

Step 1: loading the data including both test and train groups among 30 volunteers, all 561 features the equippment recorded. Then name all variables in data set with the features. Then call command "merge" to combine test and train data set.

Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

Step 3: Uses descriptive activity names to name the activities in the data set.
Replace the numbers in activity data by activity labels.

Step 4:Appropriately labels the data set with descriptive variable names
Use command "gsub" to remove all special characters in the variable names.

Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject. For each activity and each subject, calculate the average of each variable by apply function and put the average vector into data frame tidydata. Then add the columns of all activity and subjects to the data frame.

The data frame "tidydata" is the final data set of with the average of each variable for each activity and each subject.
