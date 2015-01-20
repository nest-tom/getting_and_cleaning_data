Code Book
Getting and Cleaning Data

The data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  and contained the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

where the X_* files contained the measured data and the Y_* files contained the activity undertaken for those measurements. The activities columns from the Y_* files were merged with their X_* counterparts, and then these merged files were further merged together to form one complete data set.

The activities column was translated from numerical to String values, following the definitions in the activity_labels file, where the numbers 1 thru 6 were defined as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

The column headers were further transformed with string substitutions to make them more readable. For example, "tgravityAccMag" was translated to gravity-acceleration-magnitude-(time)"

The project was interested in the mean and standard deviation columns only, so these were extracted into a second data set. The average values of these columns were then calculated and reported in the file "output.txt"
