# README - Getting and Cleaning data Coursera Class
Gauthier le Courtois du Manoir  
24 juillet 2016  


The following steps were executed during our getting & cleaning process for the Coursera projectof the course Getting and Cleaning Data course.

* 1 We set the working directory and download the zip file in the "data" folder

* 2 We extract the 8 following files and load them :

  y_train.txt
  
  X_train.txt
  
  subject_train.txt
  
  y_test.txt
  
  x_test.txt
  
  subject_test.txt
  
  features.txt
  
  activity_labels.txt

* 3 We merge (y_train.txt & y_test.txt), (x_train.txt & x_test.txt) and (subject_train.txt & subject_test.txt)

* 4 We take only the measurement on mean and Standard error

* 5 We relabel every columns to have the righteous names. This gives us the data set called "tot_data""

* 6 We create an independant dataset base on the data set created at the end of step 5. In this new data set called "tot_data_mean", we calculate mean grouped by activites and Subjects for all the variable of the data set.
  



