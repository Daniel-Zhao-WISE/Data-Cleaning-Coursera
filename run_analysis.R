## Load the packages
library(dplyr)
library(tidyr)

## Download and unzip the file
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(Url, "data.zip", "curl")
unzip("data.zip")

## Read data and merge them into one data.frame called "total"
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_label <- tolower(activity_label$V2)
test_activity <- factor(test_activity$V1, labels = activity_label)
test <- test %>% mutate(activity = test_activity)
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
train_activity <- factor(train_activity$V1, labels = activity_label)
train <- train %>% mutate(activity = train_activity)
total <- full_join(test, train)

## Generate the original tidy data of the mean and standard deviation
## for each observations and each measurement
label <- read.table("UCI HAR Dataset/features.txt", colClasses = "character")
label <- c(label$V2, 'activity')
colnames(total) <- label
sub_total <- total[,grep('-mean[^a-zA-Z]|-std[^a-zA-Z]|activity', label)]
label <- label[grep('-mean[^a-zA-Z]|-std[^a-zA-Z]|activity', label)]
label <- c(label, 'id')
label <- gsub('[^a-zA-Z]', '', label)
sub_total1 <- sub_total %>% mutate(id = 1:nrow(sub_total)) %>%
        select(grep('mean|activity|id', label)) %>%
        gather(measurement, mean, -activity, -id)
sub_total1$measurement <- gsub('mean', '', sub_total1$measurement)
sub_total2 <- sub_total %>% mutate(id = 1:nrow(sub_total)) %>%
        select(grep('std|id', label)) %>%
        gather(measurement, standardDeviation, -id)
sub_total2$measurement <- gsub('std', '', sub_total2$measurement)
tidy1 <- right_join(sub_total1, sub_total2)
tidy1$measurement <- gsub('[^a-zA-Z]', '', tidy1$measurement)
tidy1 <- tidy1[order(tidy1$id), c(2, 3, 1, 4, 5)]
rownames(tidy1) <- 1:nrow(tidy1)
tidy1 <- rename(tidy1, observation=id)
## write.csv(tidy1, 'tidy_data_mean&std.csv')

## Generate the required tidy data for average mean and standard
## deviation for each observation, each activity and each subject
tidy2 <- tidy1 %>%
        group_by(activity, measurement) %>%
        summarize(averageMean = round(mean(mean),2), averageStandardDeviation = round(mean(standardDeviation),2))
## write.csv(tidy2, 'tidy_data_average_mean&std.csv')

## Save the tidy data set into the "result.txt"
write.table(tidy2, 'result.txt', row.names = FALSE)
