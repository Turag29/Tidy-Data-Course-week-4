---
title: "Readme"
output: html_document
date: "2022-10-25"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Topic

This rep was created for "Getting and Cleaning Data Course Project". Data was gathered Reyes-Ortiz et al., for more information please see readme of data set.

The data was collected by volunteers by using a samsung galaxy smart phone. The data contains sensor signals of accelerometer and gyroscoe during six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## Creating a tidy data set

The script "Download and Clean wearable data.R" downloads the data and unpacks (as long data does not yet exist). It then merges the training and test data sets and renames activities and features according to given tables. The labels are then renamed to avoid abbreviations and finally a tidy data set is given in "tidy_data.txt" file. data is given here with the mean of each variable for each activity and each subject.


## Readme of data set

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

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
