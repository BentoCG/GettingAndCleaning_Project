CODEBOOK
=========
Features on this database were obtained from the accelerometer ('Acc') and gyroscope('Gyro') 
3-axial raw signals. Prefix 't' stands for time domain signals, while 'f' indicates frequency 
domain signals. 'Mag' denotes the magnitude of these XYZ signals according to the Euclidean norm.
Every possible combination of this. The acceleration signal was separated between 'Body' and 'Gravity',
while Gyroscope signals are only available for 'Body'. Columns 1 and 2 stand for the Subject ID and
the activity type.

#### This dataset is restricted to the *mean* and *std* of every possible variable combination explained
#### above, adding up a total of 66 variables.

## Three-axial Variables
#### Signals from all axes are separated in different columns (i.e. There is a 'tBodyAcc-X', tBodyAcc-Y',
#### and a 'tBodyAcc-Z' column.) For each axis, there is a mean and std measure. 

 Variable              | Index
-----------------------|-----------------
1. tBodyAcc-XYZ        | (columns 3 - 8)
2. tGravityAcc-XYZ     | (columns 9 - 14)
3. tBodyAccJerk-XYZ    | (columns 15 - 20)
4. tBodyGyro-XYZ       | (columns 21 - 26)
5. tBodyGyroJerk-XYZ   | (columns 27 - 32)
6. fBodyAcc-XYZ        | (columns 33 - 38)
7. fBodyAccJerk-XYZ    | (columns 39 - 44)
8. fBodyGyro-XYZ       | (columns 45 - 50)

##Magnitude Variables
#### Duplicated for mean and std measur

Variable               | Index
-----------------------|-----------------
9.  fBodyAccMag        | (columns 51 - 52)
10. fBodyAccJerkMag    | (columns 53 - 54)
11. fBodyGyroMag       | (columns 55 - 56)
12. fBodyGyroJerkMag   | (columns 57 - 58)
13. tBodyAccMag        | (columns 59 - 60)
14. tGravityAccMag     | (columns 61 - 52)
15. tBodyAccJerkMag    | (columns 63 - 64)
16. tBodyGyroMag       | (columns 65 - 66)
17. tBodyGyroJerkMag   | (columns 67 - 68)


**For further information, check 'features_info.txt', present on the downloaded
data**


