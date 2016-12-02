## Load the packages
library(dplyr)
library(tidyr)

## Download and unzip the file
## Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(Url, "data.zip", "curl")
## unzip("data.zip")

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
## for each activity and each measurement and each subject
label <- read.table("UCI HAR Dataset/features.txt", colClasses = "character")
label <- c(label$V2, 'activity')
colnames(total) <- label
sub_total <- total[,grep('-mean[^a-zA-Z]|-std[^a-zA-Z]|activity', label)]
label <- label[grep('-mean[^a-zA-Z]|-std[^a-zA-Z]|activity', label)]
label <- c(label, 'observation')
tidy1 <- sub_total %>% mutate(observation = 1: nrow(sub_total)) %>%
        gather(measurement.sta.subject, value, -observation, -activity) %>%
        separate(measurement.sta.subject, c("measurement", "sta", "subject")) %>%
        spread(sta, value)
tidy1 <- tidy1 %>% arrange(observation, activity, measurement, subject, mean, std)

## Generate the required tidy data for average mean and standard
## deviation for each observation, each activity and each subject
tidy2 <- tidy1 %>%
        group_by(activity, measurement, subject) %>%
        summarize(averagemean = round(mean(mean),2), averagestd = round(mean(std),2))

## Save the tidy data set into the "result.txt"
write.table(tidy2, 'result.txt', row.names = FALSE)
