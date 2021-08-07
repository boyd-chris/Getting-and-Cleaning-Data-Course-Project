# Downloaded data exists in the folder 'course3' within the working directory
# data files in the corresponding folder are as specified in the zip
# read activity label to a data.frame called activity
activity <- read.table("course3/activity_labels.txt")
# read features into a data.frame called features
features <- read.table("course3/features.txt")
#
##following steps explains getting a tidy training data into a data.frame
# read training data into a data.frame and call it trdata
trdata <- read.table("course3/train/X_train.txt")
# assign proper column header to trdata using features
colnames(trdata) <- features[,2]
# read row labels to a data.frame trlabel
trlabel <- read.table("course3/train/y_train.txt")
# using 'activity' assign proper activity names to row labels and assign back to trlabel
for (i in 1:nrow(trlabel)) {
  trlabel[i,1] <- activity[trlabel[i,1],2]
}
# assign column header to trlabel
colnames(trlabel) <- "activity"
# read training subject to a data.frame trsubject
trsubject <- read.table("course3/train/subject_train.txt")
# assign column header to trsubject
colnames(trsubject) <- "subject"
# bring trdata, trsubject and trlabel together into one data.frame
trdata <- cbind(trsubject, trlabel, trdata)
# tidy training data is in the data.frame trdata
#
##following steps explain getting a tidy test data into a data.frame
# read test data into a data.frame and call it tedata
tedata <- read.table("course3/test/X_test.txt")
# assign proper column header to tedata using features 
colnames(tedata) <- features[,2]
# read row labels to a data.frame telabel
telabel <- read.table("course3/test/y_test.txt")
# using 'activity' assign proper activity names to row labels and assign back to telabel
for (i in 1:nrow(telabel)) {
  telabel[i,1] <- activity[telabel[i,1],2]
}
# assign column header to telabel
colnames(telabel) <- "activity"
# read test subject to a data.frame tesubject
tesubject <- read.table("course3/test/subject_test.txt")
# assign column header to tesubject
colnames(tesubject) <- "subject"
# bring tedata, tesubject and telabel together into one data.frame
tedata <- cbind(tesubject, telabel, tedata)
# tidy test data is now in the data.frame tedata
#
# column merge of training and test data is not possible as subject in both these samples are mutually exclusive
# row merge is possible to combine these two data.frames
codata <- rbind(trdata, tedata)
# The data.frame codata contains all rows from trdata and tedata
# the rest of the processing requires the package 'dplyr'
library(dplyr)
# extract only the columns pertaining to mean and standard deviation and store it in exdata (tibble)
exdata <- select(codata, subject, activity, contains(c("mean", "std"), ignore.case = TRUE))
# Following 'pipe' commands 
# 1. group_by exdata based on each subject and activity 
# 2. summarise and find mean for all numeric columns of the grouped data.frame (tibble)
# 3. View() is needed to see the resultant data.frame (tibble)
exdata %>%
  group_by(subject, activity) %>%
    summarise_if(is.numeric, mean, na.rm = TRUE) %>%
      View()
# The data.frame (tibble) displyed by the View shows mean of the columns for each subject and activity with 180 rows (30 subjects x 6 activities)
# final data can be assigned to a data.frame (tibble) just by modifying the above like
# final_extract <- exdata %>%
#  group_by(subject, activity) %>%
#    summarise_if(is.numeric, mean, na.rm = TRUE)
# View(final_extract)
#