# Getting and Cleaning Data - Introduction

This project is designed  to demonstrate your ability to collect, work with, and clean a data set. 

The dataset is extracted from :
[Human Activity Recognition](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The code used to complete the assignment is named ``` run_analysis.r ```

The code flow is the following: 
* Merges training sets for test and train into one
* Separate the variables having mean and std
* Modify variable names to be more descriptive
* Lavel the data sets
* From the above step create a tidy data set


``` run_analysis.r ``` contains all the codes and it will perform all the steps required after which it will generate 
a new tidy data called ``` TidyData.txt ```

This data is then uploaded to the Github account# GettingAndCleaningData

There are several files in this repo: 

1. run_analysis.R --> Code/script 
2. README.md --> Description of this repo
3. CodeBook.md --> Showing the variables/units (if any) etc
4. TidyData.txt --> a tidy data set generated at the end of the program.