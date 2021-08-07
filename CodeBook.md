The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
----------------------------------------------------

The observation data for test sample is in test/X_test.txt and the same for training is in /training/X_train.txt. 
These 2 data sets do not have any column heading. 
They each have 561 columns separated by space. 
The column headers are in the file features.txt
The column headers are self explanatory as described above.
Each data reading has 3 elements for X, Y and Z directions
They also have calculated measured as mentioned earlier.
Column heading can be added to these data sets using features.txt
The subjects participated in these data collection are in test/subject_test.txt and training/subject_train.txt respectively.
These 2 file have 30 distinct subjects
Subjects are added to the data file to identify observed data to corresponding subject
The column header for this column is 'subject'
Measured activities are listed in test/y_test.txt and training/y_train.txt respectively.
There are 6 activities and their corresponding numeric code is in these data sets.
The activity description is provided in the file activity_labels.txt
Using this file descriptive activities is set and another column 'activity' was added to each data set
The resulting data sets have 563 columns: 
  The first one for subject
  The second one is descriptive activities
  The rest are the corresponding measurements
These 2 data sets (test and training) are combined into one.
Extracted only the mean and standard deviation measures from this combined data set along with subject and activity
The extracted data has 10299 rows pertaining to all 30 subjects and the activities they participated
This data set has 88 column: subject, activity and the rest 86 are mean and standard deviation
This data was then grouped by subject and activity
The final step is to calculate mean for 'mean' and 'standard deviation' values on the grouped data set
The final extract has the same column headers as the tidy data sets prepared.
The final result had 180 rows for 30 subjects and their 6 activities.
