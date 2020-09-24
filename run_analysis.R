library(dplyr)
library(tidyr)

# getting the labels for activity and names of attributes, separating them from the unnecessary extra no. column
activitylab <- read.table("C:/RRepos/R data/UCI HAR Dataset/activity_labels.txt") 
attrinames <- read.table("C:/RRepos/R data/UCI HAR Dataset/features.txt")
attrinames <- attrinames$V2

# pulling the train and test data sets
traindata <- read.table("C:/RRepos/R data/UCI HAR Dataset/train/X_train.txt")
trainlabels <- read.table("C:/RRepos/R data/UCI HAR Dataset/train/y_train.txt")
trainsub <- read.table("C:/RRepos/R data/UCI HAR Dataset/train/subject_train.txt")
testdata <- read.table("C:/RRepos/R data/UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("C:/RRepos/R data/UCI HAR Dataset/test/y_test.txt")
testsub <- read.table("C:/RRepos/R data/UCI HAR Dataset/test/subject_test.txt")

#row binding the test and train data 
combox <- rbind(traindata,testdata)
comboy <-rbind(trainlabels,testlabels)
combosub <- rbind(trainsub,testsub)


#everything combined 
d <- cbind(combosub,comboy,combox)

#getting the mean and standard deviation for each measurement (script requiremetn 2 of assignment)
# getting number of columns first and excluding the first two columns
c <- ncol(d)
means <- sapply(d[,3:c], mean)
std <- sapply(d[3:c],sd)
#outputting the means and std for each measurement
#means
#std

#adding the activity names and attributes (script requirement 3 of assignment)
names(d) <- c("ID","Activity",attrinames)

# replace the activity codes with activity names, doing a merge, a left outer join (script requirement 4 of assignment)
d2 <- merge(x=d,y=activitylab, by.x="Activity",by.y="V1",all.x=TRUE )
#rename the new column from merge
n <- ncol(d2)
colnames(d2)[n] = "Activity_Description"

#re order the table to see Activity_description at the front & get rid of activity code 
data <- d2[,c(n,2:(n-1))]
colnames(data)[1] = "Activity"

# the data has finally been merged together (script requirement 1 of assignment complete)
# need to remove previous variables to get to d
rm(activitylab,attrinames,traindata,trainlabels,trainsub,testdata,testlabels,testsub,combox,comboy,combosub,d,d2)

# now need to get the mean and standard deviation for each measurement (script requirement 5 of assignment complete)
# need to group the data by subject
by_sub_act <- data %>% group_by(ID,Activity)

DataSummary <- by_sub_act %>%   summarise_each(funs(mean))
write.table(DataSummary, file = "DataSummary.txt", row.names = FALSE)
# the tidy data has also been saved into environment, just call or print tidy
tidy <- read.table("DataSummary.txt")