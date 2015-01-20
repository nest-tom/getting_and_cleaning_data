# load the files into data tables
library(data.table)

xtest <- read.table("test/X_test.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/Y_train.txt")
subtrain <- read.table("train/subject_train.txt")
ytest <- read.table("test/Y_test.txt")
subtest <- read.table("test/subject_test.txt")
colnames(ytest) = "activity"
colnames(ytrain) = "activity"

# merge the test and trainng data sets
xtest2 <- cbind(xtest, ytest)
ytest2 <- cbind(xtrain, ytrain)
fds <- rbind(xtest2, ytest2)

# column names wll come from features.txt
features <- read.table("features.txt")
# just get the labels by extracting the V2 column into its own data frame
f2 <- as.data.frame(features$V2)
# now convert the rows into a vector by extracting the column
labels <- f2[,1]

# label activities
colnames(fds) = labels
names(fds)[562] = "activity"
fds$activity[fds$activity==1] <- "WALKING"
fds$activity[fds$activity==2] <- "WALKING_UPSTAIRS"
fds$activity[fds$activity==3] <- "WALKING_DOWNSTAIRS"
fds$activity[fds$activity==4] <- "SITTING"
fds$activity[fds$activity==5] <- "STANDING"
fds$activity[fds$activity==6] <- "LAYING"

# make column labels more descriptive
names(fds) <- gsub("tgravityAccMag", "gravity-acceleration-magnitude-(time)", names(fds))
names(fds) <- gsub("tgravityAcc", "gravity-acceleration-(time)", names(fds))
names(fds) <- gsub("tBodyAccjerkMag", "acceleration-jerk-magnitude-(time)", names(fds))
names(fds) <- gsub("tBodyAccjerk", "acceleration-jerk-(time)", names(fds))
names(fds) <- gsub("tBodyAccMag", "acceleration-magnitude-(time)", names(fds))
names(fds) <- gsub("tBodyAcc", "acceleration-(time)", names(fds))
names(fds) <- gsub("tBodyGyrojerkMag", "gyroscope-jerk-magnitude-(time)", names(fds))
names(fds) <- gsub("tBodyGyrojerk", "gyroscope-jerk-(time)", names(fds))
names(fds) <- gsub("tBodyGyroMag", "gyroscope-magnitude-(time)", names(fds))
names(fds) <- gsub("tBodyGyro", "gyroscope-(time)", names(fds))
names(fds) <- gsub("fBodyAccjerkMag", "acceleration-jerk-magnitude-(freq)", names(fds))
names(fds) <- gsub("fBodyAccjerk", "acceleration-jerk-(freq)", names(fds))
names(fds) <- gsub("fBodyAccMag", "acceleration-magnitude-(freq)", names(fds))
names(fds) <- gsub("fBodyAcc", "acceleration-(freq)", names(fds))
names(fds) <- gsub("fBodyGyrojerkMag", "gyroscope-jerk-magnitude-(freq)", names(fds))
names(fds) <- gsub("fBodyGyrojerk", "gyroscope-jerk-(freq)", names(fds))
names(fds) <- gsub("fBodyGyroMag", "gyroscope-magnitude-(freq)", names(fds))
names(fds) <- gsub("fBodyGyro", "gyroscope-freq)", names(fds))
names(fds) <- gsub("fBodyBodyAccjerkMag", "acceleration-jerk-magnitude (freq)", names(fds))
names(fds) <- gsub("fBodyBodyGyroMag", "gyroscope-magnitude-(freq)", names(fds))
names(fds) <- gsub("fBodyBodyGyrojerkMag", "gyroscope-jerk-magnitude-(freq)", names(fds))

# extract only those columns with ‘mean’ and ‘std’
fds2 <- fds[,grepl("mean|std", colnames(fds))]

# extract a new data frame with the mean of each column
fds3 <- colMeans(fds2)

write.table(fds3, "output.txt", row.name=FALSE)
