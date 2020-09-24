
# Getting and Cleaning Data UCI HAR DataSet

This is an R Markdown document required by Getting and Cleaning Data Course Project . This README document is to describe this repo and how things work.  

The data that was used for this repo can also be extracted from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and detail information can be acessed from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The aim of this assessment piece was to:
1. Merge the data sets into one 
2. Extract the mean and standard dev for each measurement 
3. Use descriptive names for the activities
4. Label the variables appropriately
5. Create a new data tidy data set with the mean of each activity. 

The files that was used to create the tidy data set can be really confusing, only the original data set was used ( train and test data) for this tidy data repo. 
The below describes the files that were used

```{}
UCI HAR Dataset
- activity_labels.txt : activity names
- features.txt - attribute names aka variable names
- features_info.txt - information about the attributes and calculations made from the data
- README.txt : this was helpful file to describe the dataset, do read it. 


Test folder
- subject_test.txt : identifiers of subjects 
- x_test.txt : test data
- y_test.txt : test labels 

Train folder 
- subject_train.txt : identifiers of subjects
- x-train.txt : train data 
- y-train.txt: train labels
```

## What was done with the above files?

```{}
A. Data was read then combined using rbind, cbind to get it all into one dataset. 
B. The mean and standard deviation was then extracted
C. Column names was then added to the complete data set
D. Then replaced the activity codes with actual activity descriptions
E. The data was then grouped to be then be able to calculate the mean for each individual for each activity.
F. The tidy data was outputted into a txt file called DataSummary. This is also in the repo.
```

The above should meet all the requirements of the assessment piece in regards to manipulating the data.In this repo, there is also a CODEBOOK.md, this CODEBOOK.md should describe the variables, activities and any major script code. The script that provides the tidy data is called run_analysis.R and is contained within this repo.
Thank you for your time and reviewing. 

