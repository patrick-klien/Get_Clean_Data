# ReadMe.md

This file will serve as an explanation of how the R function will work.  It is part of the course project for Getting and Cleaning Data (Coursera).

Please note that this is only half of the explanation, there will also be a Code Book (codebook.md) containing and what purpose they have.  All variables that I use in this ReadMe file will be explained and defined there.

Further note, for this function to work correctly -  all the data for the analysis needs to be in a directory called DATA (all caps).  

## Origin of the data

Data for this project was supplied by the instructors of the course.  

This dataset was extracted form the a Samsung Galaxy S II smartphone that each participant had on him/her during the activities.  They performed 6 separate activities:
- Walking
- Walking Upstairs 
- Walking Downstairs
- Sitting
- Standing 
- Laying

It consists of two sets of data - “test” and “train”.  Each in a separate directory and has three separate main files:
- Subject 
  - The “subject” file is the person who performed the activities.
- X
  - The “X” file contains all the data for each activity.  In this case each measurement (row) has 561 columns for the various different measurements that were taken.
- Y 
  - The “Y” file contains the activities that each subject performed. 

## Assignment

The assignment is defined as:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## The Script

Here follows how the function will work.

1. Make sure that the directory exists.
2. Make sure that the “test” files exist.
3. Read “test” data into R.
4. Make sure that the “train” files exist.
5. Read “train” data into R.

3. Merge two data-sets so that I have only one dataset.

### Reading “test” data into R.

Read all the data into three separate variables: 
- test_subject
- test_x_data
- test_y_activity

This data will be imported using “colClasses = “numeric”” to make sure that the data is imported as numbers.

Read the feature names to name the “test_data” variable. 

Name the several columns for later use.

Proceed then to bind the three variables together so that we have on variable for test containing all data in one place.


### Renaming activities so that they are words instead of index numbers.

The file “activity_labels.txt” contains all the activities and their respective index number.  

Use this file to replace the index number in the “Activity” variable in the final data.