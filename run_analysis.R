##read test and train data and merge them
setwd("~/Documents/my classes/Coursera/getting and cleaning data/file/project/UCI HAR Dataset")
test<-read.table("./test/X_test.txt",sep="",header=TRUE)  ##use sep="", if sep="," it will be 1 varible
train<-read.table("./train/X_train.txt",sep="",header=TRUE)
features<-read.table("./features.txt",sep="",header=FALSE)
colnames<-features[,2]
colnames(test)<-colnames ##name all columns with the 561 features
colnames(train)<-colnames
mergedData<-rbind(test,train) ##merge test set and train set


##Extracts only the measurements 
##on the mean and standard deviation for each measurement. 
extractCols<-grep("mean\\(\\)|std\\(\\)",colnames) 
measure<-mergedData[,extractCols]  ##extract columns whose names include only mean and std


##read subject and activity data
## Uses descriptive activity names to name the activities in the data set
test_subject<-read.table("./test/subject_test.txt",sep="",header=TRUE)  
test_activity<-read.table("./test/y_test.txt",sep="",header=TRUE)
train_subject<-read.table("./train/subject_train.txt",sep="",header=TRUE)
train_activity<-read.table("./train/y_train.txt",sep="",header=TRUE)
colnames(test_subject)<-"subject"
colnames(train_subject)<-"subject"
subject<-rbind(test_subject,train_subject) 
mergedData<-cbind(subject,mergedData) ##add subject to entire mergedData
colnames(test_activity)<-"activity"
colnames(train_activity)<-"activity"
activity<-rbind(test_activity,train_activity)
mergedData<-cbind(activity,mergedData) ##add activity to entire mergedData
activitylabel<-read.table("./activity_labels.txt",sep="",header=FALSE)  ##read activity labels
row<-nrow(mergedData)
for(i in 1:row){
  mergedData[i,1]<-as.character(activitylabel[mergedData[i,1],2])
}


##Appropriately labels the data set with descriptive variable names
j=1
for(i in 1:563){
  c[j]<-gsub("[[:punct:]]","",names(mergedData)[i])
  j<-j+1
}
colnames(mergedData)<-c

##create tidy data
tidydata<-data.frame()
for(i in 1:6){
  activity_sub<-subset(mergedData,mergedData$activity==activitylabel[i,2])
  for(j in 1:30){
    subject_sub<-subset(activity_sub,activity_sub$subject==j)[,3:563]
    mean<-apply(subject_sub,2,mean)
    mean.df<-data.frame(mean)
    tidydata<-rbind(tidydata,mean.df[,1])
  } 
}
colnames(tidydata)<-names(mergedData)[3:563]
activity_tidydata<-rep(activitylabel[,2],times=30)
subject_tidydata<-rep(c(1:30),times=6)
tidydata<-cbind(subject_tidydata,tidydata)
tidydata<-cbind(activity_tidydata,tidydata)
