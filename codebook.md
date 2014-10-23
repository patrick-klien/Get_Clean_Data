# CodeBook.md

This file’s purpose is to define all variables that I will use in the R Script/function run_analysis.R.

## Variables

- test_subject - variable used to hold the initial data read from file “subject_test.txt”.
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the subjects that took part in the experiment. 
- test_x_data - variable used to hold the initial data read from file “X_test.txt”.  
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the actual data that was taken from the measurements of the activities.
  - This variable will initially hold 561 columns, most of which will be discarded.
- test_y_activity - variable used to hold the initial data read from file “y_test.txt”.
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the various activities that were performed by the subjects listed in the “subject_test.txt” file.
  - This variable has 6 possible activities: walking, walking upstairs, walking downstairs, sitting, standing and laying.  These activities were listed in the “activity_lables.txt” provided with the data.

- test_data - variable that will be used to hold all data for test in one place.  
  - Will column bind the data (test_x_data), then the activity (test_y_activity) and finally the subject (test_subject).

- train_subject - variable used to hold the initial data read from file “subject_train.txt”.
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the subjects that took part in the experiment. 
- train_x_data - variable used to hold the initial data read from file “X_train.txt”.  
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the actual data that was taken from the measurements of the activities.
  - This variable will initially hold 561 columns, most of which will be discarded.
- train_y_activity - variable used to hold the initial data read from file “y_train.txt”.
  - This variable is mostly a temporary variable - will be disregarded later on when the data is merged.  
  - This variable represents the various activities that were performed by the subjects listed in the “subject_train.txt” file.
  - This variable has 6 possible activities: walking, walking upstairs, walking downstairs, sitting, standing and laying.  These activities were listed in the “activity_lables.txt” provided with the data.

- train_data - variable that will be used to hold all data for test in one place.  
  - Will column bind the data (test_x_data), then the activity (test_y_activity) and finally the subject (test_subject).

- feature_names - variable used to give names to the different measurements in the “data” variables.
  — Will be discarded later.
  - Will only really use the second column to get the names.

- activity_names - a variable containing all possible activities in the file “activity_lables.txt”.  There are 6 possibilites:
  - Walking
  - Walking Upstairs
  - Walking Downstairs
  - Sitting
  - Stading
  - Laying

- final_data - data frame that contains all data in one place.
  - Initially this data frame will contain extraneous columns that will be removed later.

- keep_cols - reads data from a file called “edited_features.txt”.  This file has a list of all the columns that need to be kept for the final dataset.