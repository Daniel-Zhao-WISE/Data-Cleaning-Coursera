## Code Book
### Data
Data is downloaded from the website "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", and the original infomation is in the 'UCI HAR Dataset' file
### Variables
In the final result.txt file, there're 198 observations and 5 Variables. The format of this tidy dataset is "long". More details are as follows  
* activity  
This variable is the activity label of different observations, and it has 6 values:  

  >'walking'  
  'walking_upstairs'  
  'walking_downstairs'  
  'sitting'  
  'standing'  
  'laying'  

* measurement  
This shows which measurement this row's value takes, and it has 33 values:  

  > 'tGravityAcc'  
  'tBodyAccJerk'  
  'tBodyGyro'
  'tBodyGyroJerk'  
  'tBodyAccMag'  
  'tGravityAccMag'  
  'tBodyAccJerkMag'  
  'tBodyGyroMag'  
  'tBodyGyroJerkMag'  
  'fBodyAcc'  
  'fBodyAccJerk'
  'fBodyGyro'  
  'fBodyAccMag'  
  'fBodyAccJerkMag'  
  'fBodyGyroMag'  
  'fBodyGyroJerkMag'  

  Attention:  
  -XYZ is used to denote 3-axial signals in the X, Y and Z directions. Each has three sub-values, -X, -Y, -Z.  

  Explanations:  
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

  Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

  Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

* subject  
This variable shows the direction of the measurement's value, it has four values:  
  >'X' -X direction  
  'Y' -Y direction  
  'Z' -Z direction  
  ' ' -Euclidean norm  

  Note: ' ' means missing

* averagemean  
This shows the average mean for each activity, each measurement and each subject.  

* averagestd  
This shows the average standard deviation for each activity, each measurement and each subject.

### Notes
  - Features are normalized and bounded within [-1,1].
  - Each feature vector is a row on the text file.
  - My final tidy dataset is in "long" format.
