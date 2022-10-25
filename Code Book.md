---
title: "Code Book"
output: html_document
date: "2022-10-25"

---


## Code Book

Data Set described by this code book is given in tidy_data.txt in this
repository. Please see readme.md for more information.

## Describtion Data tidy_data.txt

Data is text file, values are separated by space. Features are
normalized and bounded within [-1,1].

First row gives names of variables. These contain averaged signal
measurements.

subject Each volunteer had a unique number (integer 1:30).

activity six acitivities were documented.(WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Data is given with the following describtions: The sensor signals
(accelerometer and gyroscope) were pre-processed by applying noise
filters and then sampled in fixed-width sliding windows of 2.56 sec and
50% overlap (128 readings/window). The sensor acceleration signal, which
has gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and gravity. The
gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each
window, a vector of features was obtained by calculating variables from
the time and frequency domain. See 'features_info.txt' for more details.

Subsequently, the body linear acceleration and angular velocity were
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for
each pattern:\
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

TimeDomain, frequencyDomain Describing data given in time or frequency
domain.

BodyAccelerometer, BodyAccelerometerJerk, BodyGyroscope,
BodyGyroscopeJerk Data given by Accellerometer or Gyroscope and/or given
as Jerk vector.

Magnitude, Frequency Data is given as Magnitude or as Frequency.

Mean, StandardDeviation Calculations performt on data.

X, Y, Z Direction of data.

## steps to tidy_data.txt

The following steps were done to get "tidy_data.txt"

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for
each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names.

From the data set in step 4, creates a second, independent tidy data set
with the average of each variable for each activity and each subject.

Original data located at
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
