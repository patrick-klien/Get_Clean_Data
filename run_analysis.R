## This script is created as part of the Getting and Cleaning Data course for Coursera.
##
## Please read the readme.md file to understand what it will.
## Please also read the codbook.md for reference to all variables used in this function.

run_analysis <- function(){
  ## Load several libraries into memory
  library(dplyr)
  library(reshape2)
  ## Need to read the data for "test" variables.
  ##
  ## As stated in the readme.md - this directory has 3 separate TXT files - all need to be read in separately.
  
  ## Make sure that the "test" directory exists and is in the directory "Data".
  if (!file.exists("DATA/test")){
    stop ("Unable to locate directory test.  Please make sure that the dictory exists and data-files are located in the directory.")
  }
  
  ## Make sure that all the files exists.
  if (!file.exists("DATA/test/subject_test.txt")){
    stop ("Unable to locate file 'subject_test.txt.")
  } else if (!file.exists("DATA/test/X_test.txt")){
    stop ("Unable to locate file 'X_test.txt'.")
  } else if (!file.exists("DATA/test/y_test.txt")){
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
  

  ## Make sure that the "train" directory exists and is in the directory "Data".
  if (!file.exists("DATA/train")){
    stop ("Unable to locate directory train.  Please make sure that the dictory exists and data-files are located in the directory.")
  }
  
  ## Make sure that all the files exists.
  if (!file.exists("DATA/train/subject_train.txt")){
    stop ("Unable to locate file 'subject_train.txt.")
  } else if (!file.exists("DATA/train/X_train.txt")){
    stop ("Unable to locate file 'X_train.txt'.")
  } else if (!file.exists("DATA/train/y_train.txt")){
    stop ("Unable to locate file 'y_train.txt'.")
  }
  
  ## Read the variables for "train".
  train_subject <- read.table("DATA/train/subject_train.txt", colClasses = "numeric")
  
  train_y_activity <- read.table("DATA/train/y_train.txt", colClasses = "numeric")
  
  train_x_data <- read.table("DATA/train/X_train.txt", colClasses = "numeric")
  
  ## Set the name of the variables for later reference.
  names(train_subject) <- paste("Subject")
  
  names(train_y_activity) <- paste("Activity")
  
  names(train_x_data) <- paste(feature_names$V2)
  
  ## Bind the three variables together.
  train_data <- cbind(train_x_data, train_y_activity, train_subject)
  
  ## ------
  ## Now, hopefully, we will bind the two data-sets together using rbind.
  ## ------
  
  final_data <- rbind(test_data, train_data)
  
  ## Do a little sorting - making things cleaner.
  final_data <- arrange(final_data, Subject, Activity)
  
  ## Read the names of each activity so that I can substitute it in the data.
  activity_names <- read.table("DATA/activity_labels.txt", colClasses = "character")
  
  ## Create an index variable to know the index for each reading so that it can be substituted for actual activity.
  activity_index <- final_data$Activity
  
  ## Change the Activity variable so that it has the actual names instead of the index.
  final_data$Activity <- activity_names$V2[activity_index]
  
  ## Read a file called edited_features.txt that has a list of all the columns that need to be kept.
  keep_cols <- read.table("DATA/edited_features.txt", colClasses = "character")
  
  ## Ditch the extra columns.
  final_data <- subset(final_data, select = c(keep_cols$V1, "Activity", "Subject"))
  
  ## Now we need to melt and recast the data in such a way that it will provide the mean for each measurment, organized by 
  ## Activity then Subject.
  final_data <- melt(final_data, id.vars = c("Activity", "Subject"))
  final_data <- dcast(final_data, Activity + Subject ~ variable, mean)
  
  ## Write the final data set to a file called final_data.txt.
  write.table(final_data, "final_data.txt", row.names = FALSE)
}