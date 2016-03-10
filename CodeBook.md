#Coursera - Getting and Cleaning Data
### This course project excutes the code run_analysis.R and it does the following :

 * Download the datasets and load the necessary files recursively 
 * Now each entry has Identifier/Subject, The Activity (walking ,walking up etc) and Feature vector
 * Check if the directory exists and if not download the file from URL
 * Now unzip the contents of the file to the drive for processing 
 * Goto the unzipped folder and process the contents of the folder
 * Get the file names inside the folder recursively
 * Reading Test and Train data sets from the respective folders by specifying path
 * Reading Test and Train data labels  Subject/Identifier
 * Reading the Subject files into memory before merging
 * Join the Test and Train Feature/Activity/Subject together. Add Header info
 * Merge all the three data sets together
 * Check if 'mean' or 'std' is present in the header if so use only that data set
 * sort(unique(ActivitySet$Activity)) gives 6 levels so repalce that with descriptive names
 * Repalce f, t acc, gyro , mag , coeff , bodybody
 * Create a summary table based on activity and subject and calculate average/mean
 * Arrange in the order or Subject and Activity
 * Once the data processing is complete save the tidy data set as TidyData.txt

 
## Variables Information

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
   
Several packages are also used such as plyr, dlyr etc for processing the data
 
