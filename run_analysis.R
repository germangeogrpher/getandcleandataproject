##Welcome to the Getting and Cleaning Data Course Project
##February 2015
## 1 Step: Download and unzip the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,"Dataset.zip", mode="wb")
unzip("Dataset.zip")
##2. Step read th global data sets
files <- (Sys.glob("*UCI HAR Dataset//*.txt"))
listOfFiles <- lapply(files[2:3], function(x) read.table(x, header = FALSE))
activity_labels<-data.frame(listOfFiles[1])
colnames(activity_labels)<-c("activity","activity")
features<-data.frame(listOfFiles[2],stringsAsFactors = FALSE)
##3. Step read train and the test data sets

#first the train data set
files <- (Sys.glob("*UCI HAR Dataset//train//*.txt"))
listOfFiles <- lapply(files[], function(x) read.table(x, header = FALSE))
X_train<-data.frame(listOfFiles[1])
subject_train<-data.frame(listOfFiles[2])
y_train<-data.frame(listOfFiles[3])
colnames(X_train)<-features[,2];colnames(y_train)<-c("activity");colnames(subject_train)<-c("subject")
#all the train data in one file
train_data<-cbind(subject_train,y_train,X_train)

#second the test data set
files <- (Sys.glob("*UCI HAR Dataset//test//*.txt"))
listOfFiles <- lapply(files[], function(x) read.table(x, header = FALSE))
X_test<-data.frame(listOfFiles[1])
subject_test<-data.frame(listOfFiles[2])
y_test<-data.frame(listOfFiles[3])
colnames(X_test)<-features[,2];colnames(y_test)<-c("activity");colnames(subject_test)<-c("subject")
#all the est data in one file
test_data<-cbind(subject_test,y_test,X_test)

##4. Step combining data sets
##we can just bind them together because of the same dimensions
alldata<-rbind(train_data,test_data)

##5. Step quick and dirty renaming of the activities variable
alldata$activity[alldata$activity==1] <- "WALKING";alldata$activity[alldata$activity==2] <- "WALKING_UPSTAIRS";alldata$activity[alldata$activity==3] <- "WALKING_DOWNSTAIRS"
alldata$activity[alldata$activity==4] <- "SITTING";alldata$activity[alldata$activity==5] <- "STANDING";alldata$activity[alldata$activity==6] <- "LAYING"

##6. Step cutting out the relevant variables
meanorstd <- grep("*mean\\()*|*std\\()*", names(alldata))
step4<-alldata[, c(1,2,meanorstd)]

##7. Step renaming variables in order to get tidier data
step4names<-names(step4)
step4names<-lapply(step4names,gsub,pattern="tBody",replacement="time")
step4names<-lapply(step4names,gsub,pattern="fBody",replacement="frequency")
step4names<-lapply(step4names,gsub,pattern="\\(|\\)|\\-",replacement="")
step4names<-lapply(step4names,gsub,pattern="Acc",replacement="Acceleration")
colnames(step4)<-step4names

##task one to four completed: cut out and tidy data set

##Finally the analysis using dplyr
library(dplyr)
#The new summarise_each funktion is really helpful here
final_result<-step4 %>% group_by(subject,activity) %>% summarise_each(funs(mean))
#Save the final result
write.table(final_result,"final_result.txt",row.name=FALSE)

##Thank you for your attention


