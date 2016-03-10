# Getting and Cleaning Data Course Project

library(dplyr)
library(reshape2)
library(plyr)
# Now each entry has Identifier/Subject, The Activity (walking ,walking up etc) and Feature vector

# 1. Merges the training and the test sets to create one data set.--> Complete

# Check if the directory exists and if not download the file from URL
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip")

# Now unzip the contents of the file to the drive for processing 
unzip(zipfile="Dataset.zip")

# Goto the unzipped folder and process the contents of the folder
path_uci <- file.path("UCI HAR Dataset")
# Get the file names inside the folder recursively
pathFiles<- list.files(path_uci,recursive=TRUE) 

# Reading Test and Train data sets from the respective folders by specifying path
FeatureTrainSet <- read.table(file.path(path_uci, "Train", "X_train.txt"))
FeatureTestSet <- read.table(file.path(path_uci, "test", "X_test.txt"))

# Reading Test and Train data labels  Subject/Identifier
ActivityTrainSet <- read.table(file.path(path_uci, "Train", "y_Train.txt"))
ActivityTestSet <- read.table(file.path(path_uci, "test", "y_Test.txt"))

# Reading the Subject files into memory before merging
SubjectTrainSet <- read.table(file.path(path_uci, "Train", "subject_train.txt"))
SubjectTestSet <- read.table(file.path(path_uci, "test", "subject_test.txt"))

# Join the Test and Train Feature/Activity/Subject together. Add Header info
FeatureSet <- rbind(FeatureTrainSet,FeatureTestSet)
ActivitySet <- rbind(ActivityTrainSet,ActivityTestSet)
SubjectSet <- rbind(SubjectTrainSet,SubjectTestSet)

names(FeatureSet)  <- read.table(file.path(path_uci, "features.txt"),head=FALSE)$V2
names(SubjectSet)  <- "Subject"
names(ActivitySet) <- "Activity"

# Merge all the three data sets together
AllData <- cbind(FeatureSet,SubjectSet, ActivitySet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Check if 'mean' or 'std' is present in the header if so use only that data set

AllDataHeader <- names(AllData)
MeanStd <- c(grep("mean\\(\\)|std\\(\\)",AllDataHeader),562,563)
MeanStdDataset <- AllData[MeanStd]

# Display only the contents satifying #2.
str(MeanStdDataset)

# 3 Uses descriptive activity names to name the activities in the data set
# sort(unique(ActivitySet$Activity)) gives 6 levels so repalce that with descriptive names

ActivityNames <- read.table(file.path(path_uci, "activity_labels.txt"))
names(ActivityNames) <- c("Activity","Name")
MeanStdDatasetName <- merge(MeanStdDataset,ActivityNames,by= "Activity")


# 4 Appropriately labels the data set with descriptive variable names.
# Repalce f, t acc, gyro , mag , coeff , bodybody

names(MeanStdDatasetName)<-gsub("^t", "time", names(MeanStdDatasetName))
names(MeanStdDatasetName)<-gsub("^f", "frequency", names(MeanStdDatasetName))
names(MeanStdDatasetName)<-gsub("Acc", "Accelerometer", names(MeanStdDatasetName))
names(MeanStdDatasetName)<-gsub("Gyro", "Gyroscope", names(MeanStdDatasetName))
names(MeanStdDatasetName)<-gsub("Mag", "Magnitude", names(MeanStdDatasetName))
names(MeanStdDatasetName)<-gsub("BodyBody", "Body", names(MeanStdDatasetName))

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Create a summary table based on activity and subject and calculate average/mean
TidyData<-aggregate(. ~Subject + Name, MeanStdDatasetName, mean)
# Arrange in the order or Subject and Activity
TidyData<-TidyData[order(TidyData$Subject,TidyData$Activity),]
write.table(TidyData, file = "TidyData.txt",sep = ",")


