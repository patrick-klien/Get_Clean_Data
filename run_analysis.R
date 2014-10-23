## This script is created as part of the Getting and Cleaning Data course for Coursera.
##
## Please read the readme.md file to understand what it will.
## Please also read the codbook.md for reference to all variables used in this function.

run_analysis <- function(){
  ## Need to read the data for "test" variables.
  ##
  ## As stated in the readme.md - this directory has 3 separate TXT files - all need to be read in separately.
  
  ## Make sure that the "test" directory exists and is in the directory "Data".
  if (!file.exist("DATA/test")){
    stop ("Unable to locate directory test.  Please make sure that the dictory exists and data-files are located in the directory.")
  }
  
  ## Make sure that all the files exist.
  if (!file.exist("DATA/test/subject_test.txt")){
    stop ("Unable to locate file 'subject_test.txt.")
  } else if (!file.exist("DATA/test/X_test.txt")){
    stop ("Unable to locate file 'X_test.txt'.")
  } else if (!file.exist("DATA/test/y_test.txt")){
    stop ("Unable to locate file 'y_test.txt'.")
  }
  
  ## Read the variables for "test".
  test_subject <- read.table("DATA/test/subject_test.txt", colClasses = "numeric")
  
  test_y_activity <- read.table("DATA/test/y_test.txt", colClasses = "numeric")
  
  test_x_data <- read.table("DATA/test/X_test.txt", colClasses = "numeric")
  
  ## Read the feature names - help ou later on.
  
  feature_names <- read.table("DATA/features.txt")
  
  ## Set the name of the variables for later reference.
  names(test_subject) <- paste("Subject")
  
  names(test_y_activity) <- paste("Activity")
  
  names(test_x_data) <- paste(feature_names$V2)
  
  ## Bind the three variables together.
  test_data <- cbind(test_x_data, test_y_activity, test_subject)

  
  ## Read the names of each activity so that I can substitute it in the data.
  activity_names <- read.table("DATA/activity_labels.txt", colClasses = "character")
  
  ## Create an index variable to know the index for each reading so that it can be substituted for actual activity.
  activity_index <- final_data$Activity
  
  ## Change the Activity variable so that it has the actual names instead of the index.
  final_data$Activity <- activity_namesV2[activity_index]
}