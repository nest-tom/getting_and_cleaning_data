# getting_and_cleaning_data
Coursera Data Science class: Getting and Cleaning Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The Project contains one R script called run_analysis.R that does the following. 
  Merges the training and the test sets to create one data set.
  Extracts only the measurements on the mean and standard deviation for each measurement. 
  Uses descriptive activity names to name the activities in the data set
  Appropriately labels the data set with descriptive variable names. 
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Assuming the data files are extracted to the same directory as the run_analysis.R file, the file can be executed in the R programming environment as "source("run_analysis.R")" and the output will be found in the resulting output.txt file 
