# ReadMe.md

This file will serve as an explanation of how the R function will work.  It is part of the course project for Getting and Cleaning Data (Coursera).

Please note that this is only half of the explanation, there will also be a Code Book (codebook.md) containing and what purpose they have.  All variables that I use in this ReadMe file will be explained and defined there.

## Origin of the data

Data for this project was supplied by the instructors of the course.  

This dataset was extracted form the a Samsung Galaxy S II smartphone that each participant had on him/her during the activities.  They performed 6 separate activities:
- Walking
- Walking Upstairs 
- Walking Downstairs
- Sitting
- Standing 
- Laying

It consists of two sets of data - “test” and “train”.  Each has three separate main files:
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


