==================================================================
Getting and Cleaning Data - John Hopkins University
Coursera July 2014

ndvillagomez
==================================================================

Tidy data set derived from:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Information about the raw data set can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

==================================================================

This aim of this project is to provide an R script which creates a Tidy Data Set from the raw 
data collected during the experiments which were  carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data captured included 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The raw dataset was originally randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This Tidy Data set will provide a summary of mean and standard deviation data by subject and activity.


The Tidy Data set includes the following files:
=========================================

- 'README.md' - this document

- 'CodeBook.md': describes the variables, the data, and any transformations performed to clean up the data. 

- 'run_analysis.R': R script with commands to create the Tidy Data set, as follows:
   1) Merge the training and the test sets to create one data set.
   2) Extract only the measurements on the mean and standard deviation for each measurement. 
   3) Uses descriptive activity names to name the activities in the data set
   4) Appropriately labels the data set with descriptive variable names. 
   5) Creates a new tidy data set with the average of each variable for each activity and subject. 
   
   The 'run_analysis.R' script can be found at the following Github location:
 
  
For more information about the raw dataset contact: activityrecognition@smartlab.ws




License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The raw dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.