# Project Coursera Getting and Cleaning Data W4
# Gauthier le Courtois du Manoir
# Created :06/02/2016
# Modified 23/07/2016

library(dplyr)
#####################################################################
# 1. Merges the training and the test stes to create one data set
#####################################################################
# Get the data
setwd("C:/Users/Gauthier/Documents/R Working Directory/Getting and Cleaning data/Week 4/")
if(!file.exists("./data")){dir.create("./data/")}
sourcefile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile<-"./data/dataSet.zip"
download.file(sourcefile, destfile)
 
# Load files train
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt", header=F) #Labels
x_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",  header=F)
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=F)

# Load files test
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt", header=F) #Labels
x_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",  header=F)
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",  header=F)

base_features<-read.table("./data/UCI HAR Dataset/features.txt",  header=F)
activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",  header=F)

#Merges the training and the test sets to create one data set.
tot_y<-rbind(y_train, y_test)
tot_x<-rbind(x_train, x_test)
tot_subject<-rbind(subject_train, subject_test)

#####################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#####################################################################
#mean are ...-mean()-, Standard deviation are like ...-std()-...
#We take only the row containing "mean()" or "std()"
Mean_and_Std <- grep("mean()|std()", base_features[, 2]) 
#We take only the column concerning mean and standard deviation
tot_x<-tot_x[,Mean_and_Std]

#####################################################################
# 3. Uses descriptive activity names to name the activities in the data set
#####################################################################
#Put activity names
names(tot_y)<-"Activities"
tot_y[,1]<-activity_labels[tot_y[,1], 2] # Change number by the corresponding activities

#####################################################################
# 4. Appropriately labels the data set with descriptive variable names.
#####################################################################
#We give the right name the the tot_x columns
names(tot_x)<- gsub("\\()", "", base_features[Mean_and_Std,2]) # erase ()
names(tot_x)<-gsub("-", " ", names(tot_x)) # change "-" to " "

#Tidy data that can be used for later analysis
tot_data<-cbind(tot_x,tot_subject,tot_y)
#####################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
#####################################################################

grouped<-group_by(tot_data, Activities, Subjects)
tot_data_mean<-(summarise_each(grouped, funs(mean)))

