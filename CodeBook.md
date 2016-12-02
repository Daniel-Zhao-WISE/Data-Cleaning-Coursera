## Code Book
### Data
Data is downloaded from the website "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", and the original infomation is in the 'UCI HAR Dataset' file
### Variables
In the final result.txt file, there're 198 observations and 4 Variables. Details are as follows  
* activity  
This variable is the activity label of different observations, and it has 6 values:  
  >walking  
  walking_upstairs  
  walking_downstairs  
  sitting  
  standing  
  laying  

* measurement  
This shows which measurement this row's value takes, and it has 33 values:  

  > tGravityAcc-XYZ  
  tBodyAccJerk-XYZ  
  tBodyGyro-XYZ  
  tBodyGyroJerk-XYZ  
  tBodyAccMag  
  tGravityAccMag  
  tBodyAccJerkMag  
  tBodyGyroMag  
  tBodyGyroJerkMag  
  fBodyAcc-XYZ  
  fBodyAccJerk-XYZ  
  fBodyGyro-XYZ  
  fBodyAccMag  
  fBodyAccJerkMag  
  fBodyGyroMag  
  fBodyGyroJerkMag  

  Attention:  
  -XYZ is used to denote 3-axial signals in the X, Y and Z directions. Each has three sub-values, -X, -Y, -Z.  

  Explanations:  
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

* mean  
This shows the mean for each activity and each measurement.  

* standardDeviation  
This shows the standard deviation for each activity and each measurement.

### Notes
  - Features are normalized and bounded within [-1,1].
  - Each feature vector is a row on the text file.
