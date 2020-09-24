---
title: "CodeBook"
author: "MPBBi"
date: "23/09/2020"
output:
  html_document:
    df_print: paged
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## UCI HAR DATA

The data collection came from the below researchers:

```{}
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

```

## Activities and Attributes

*Activies* which can be found in the activities labels txt file of the original download:
In the combined data set the activities variable is initially INT and then converted to Char when a left join is done to convert the codes to descriptions. 
* Walking
* Walking Upstairs
* Walking Downstairs
* Sitting
* Standing
* Laying

*Attributes*
The below attributes are all data type num. 

```{}
TIME VARIABLES:
tBodyAcc-XYZ ( 3 axes)
tGravityAcc-XYZ ( 3 axes)
tBodyAccJerk-XYZ ( 3 axes)
tBodyGyro-XYZ ( 3 axes)
tBodyGyroJerk-XYZ ( 3 axes)
tBodyAccMag ( 3 axes)
tGravityAccMag ( 3 axes)
tBodyAccJerkMag ( 3 axes)
tBodyGyroMag ( 3 axes)
tBodyGyroJerkMag ( 3 axes)

FREQUENCY VARIABLES:
fBodyAcc-XYZ ( 3 axes)
fBodyAccJerk-XYZ ( 3 axes)
fBodyGyro-XYZ ( 3 axes)
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

angle(tBodyAccMean,gravity)
angle(tBodyAccJerkMean),gravityMean)
angle(tBodyGyroMean,gravityMean)
angle(tBodyGyroJerkMean,gravityMean)


Each of the above had the below computed and was present in the train and test data sets:
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

```

The data was manipulated as described briefly in README.md to get the final aggregation of mean and standard deviation of each variable. Then aggregated to get the mean for each variable by subject id or grouped by subject id. 

To see the means and standard deviation, call objects called means and std. 

The final tidy data is written to a txt file called DataSummary.txt or can also be seen by calling the object tidy.The summary data was created by using group_by and then summarizing via summarise each.