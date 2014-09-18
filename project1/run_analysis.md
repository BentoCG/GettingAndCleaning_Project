---
title: "run_analysis.Rmd"
author: Bento Collares
date: Wednesday, September 17, 2014
output: html_document
---

##Preparation

####Loads the required libraries


```r
library(data.table); library(reshape2)
```

##Loading Data

####Reads most of the required data into data.frames and merges **Activity** and
####**Subject** from train and test.


```r
Activity_Labels = read.table("activity_labels.txt")
Activity_Train = read.table(file.path("train", "y_train.txt"))
Activity_Test  =  read.table(file.path("test" , "y_test.txt" ))
Activity = rbind(Activity_Train, Activity_Test)

Subject_Train = read.table(file.path("train", "subject_train.txt"))
Subject_Test  = read.table(file.path("test" , "subject_test.txt" ))
Subject = rbind(Subject_Train, Subject_Test)
```

##Loading Data 2

####Reads the test and train observation and merges them into a single data frame


```r
dt_Train = read.table(file.path("train", "X_train.txt"))
dt_Test = read.table(file.path("test", "X_test.txt"))
dt_Final = rbind(dt_Train, dt_Test)
```

##Subsetting

####Subsets the **dt_Final** data frame to include only *mean* and *std* variables 


```r
features = read.table("features.txt")
setnames(features,c("featureNum", "featureName"))
logic = grepl("mean\\(\\)|std\\(\\)", features[,"featureName"])
features = features[logic,]
dt_Final = dt_Final[,features[,"featureNum"]]
```

##Labelling

####Adds up the Activity and Subject columns to the main data frame and labels
####both activities and column names.


```r
dt_Final = cbind(Activity, dt_Final)
dt_Final = cbind(Subject, dt_Final)
setnames(dt_Final, c("Subject", "Activity",
                     as.character(features[,"featureName"])))

dt_Final[,"Activity"] = factor(dt_Final[,"Activity"], 
                               labels = Activity_Labels[,2])
```

##Tidying up

####Creates a tidy data frame using the previous version of the main data frame.
The new data frame, **dt_Tidy**, now has a single row for every activity on 
every subject, with the average value of all variable values for that same
activity and subject. Finally, tidy data is outputted in a txt file separated
by tabs.


```r
dt_Tidy = data.frame()
for ( subj in unique(dt_Final$Subject)){
    for ( act in unique(dt_Final$Activity)){
        x = dt_Final[dt_Final$Subject == subj & dt_Final$Activity == act,]
        for (i in 3 : dim(features)[1]){
            x[1,i] = sum(x[,i]) / length(x[,i])
        }
        dt_Tidy = rbind(dt_Tidy, x[1,])
    }
}
dt_Tidy = dt_Tidy[order(dt_Tidy$Subject),]
row.names(dt_Tidy) = 1:dim(dt_Tidy)[1]

write.table(dt_Tidy, file = "ActivityMeasurements.txt", row.name = FALSE, 
            sep = "\t")
```
