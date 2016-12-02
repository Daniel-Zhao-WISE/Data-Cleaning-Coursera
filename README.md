## README
### Files
This repo consits of following files  
  > - 'REAME.md'
  > - 'CodeBook.md': Code Book of variables in final tidy dataset.  
  > - 'result.txt': Final tidy dataset.
  > - 'run_analysis.R': R scirpt consits manipulation from the data downloaded, to the final tidy dataset.

### run_analysis.R
This script is used to generate tidy data the average value for each activity, each measurement, and each subject. (I think the subject means that which kind of data, the mean or the standard deviation). It takes following steps:  
1. Download and unzip the file.  
2. Read the data from test and train, in addition, merge them into one total data set.  
3. Change the dataset to a tidy dataset consits teh mean and the standard deviation with each observation and each measurement. Each observation has five variables: activity, measurement, subject, average mean (averagemean), and average standard deviation (averagestd).  
4. Group the dataset by activity and compute the average value for each varaible for each activity and each measurement, which is the final tidy dataset.

### Notes
1. My result is the "long" format tidy dataset, and I believe there're five variables as I mentioned above.

### Reference
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
