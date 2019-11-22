#Shefali Emmanuel
#November 19, 2019
#Part 3

#References
  #StackOverflow
  #http://www.sthda.com/english/wiki/fast-reading-of-data-from-txt-csv-files-into-r-readr-package
  #https://bookdown.org/rdpeng/exdata/exploratory-data-analysis-checklist.html#read-in-your-data
  #https://www.r-bloggers.com/data-types-part-4-logical-class/
  #https://www.statmethods.net/input/missingdata.html


#load packages
library("readr")
library("tidyverse")
library("dplyr")
library("randomForest")

#4. Import the "flattened" table (or CSV file) into your open source analytic environment of choice (R, Python, Java, etc.) and stage it for analysis.
mydata = read_csv("flattenedRecords.csv")  #read csv file 

#5. Perform some simple exploratory analysis and generate summary statistics to get a sense of what is in the data.
#df
nrow(mydata) #number of rows
ncol(mydata) #number of cloumns
str(mydata) #information about the data
glimpse(mydata)

head(mydata,10) #first 10 
tail(mydata, 10) #last 10

#know all the potential options in each column
unique(mydata$age)
unique(mydata$workClass)
unique(mydata$eduLevel)
unique(mydata$maritalStatus)
unique(mydata$occupation)
unique(mydata$relationship)
unique(mydata$race)
unique(mydata$sex)
unique(mydata$over50K)

#numerical summaries 
summary(mydata$age)
summary(mydata$capitalGain)
summary(mydata$capitalLoss)
summary(mydata$hoursPerWeek)
summary(mydata$over50K)

mydata #see entire data set

#histogram representation of numerical categories
hist(mydata$age, col = "lightblue")
  #large majority is from age range 20-50
hist(mydata$capitalLoss, col = "lightblue")
hist(mydata$hoursPerWeek, col = "lightblue")
hist(mydata$over50K, col = "lightblue")
  #primarily under 40 hours per week

#convert to numerical since they are of locial class
class(mydata$maritalStatus)
  #if want to convert them back use as.numerical and as.character
    #origionally had them setting to new factors but it added 2x variables
mydata$age<-as.factor(mydata$age)
mydata$workClass<- as.factor(mydata$workClass)
mydata$eduLevel<- as.factor(mydata$eduLevel)
mydata$maritalStatus<-as.factor(mydata$maritalStatus)
mydata$occupation<-as.factor(mydata$occupation)
mydata$relationship<-as.factor(mydata$relationship)
mydata$race<-as.factor(mydata$race)
mydata$sex<- as.factor(mydata$sex)
mydata$over50K<-as.factor(mydata$over50K)

#check that it worked
str(mydata)

#percentage of eduLevel and having Over 50K
nBachelors = nrow(filter(mydata, eduLevel == "Bachelors"))
nBachelorsOver50K = nrow(filter(mydata, over50K!= 0 & eduLevel == "Bachelors"))
percentOfBachOver50 = (nBachelorsOver50K / nBachelors) * 100

nMasters = nrow(filter(mydata, eduLevel == "Masters"))
nMastersOver50K = nrow(filter(mydata, over50K!=0 & eduLevel == "Masters"))
percentOfMastersOver50 = (nMastersOver50K / nMasters) * 100

nDoctorate =nrow(filter(mydata, eduLevel == "Doctorate"))
nDoctorateOver50K =nrow(filter(mydata, over50K!=0 & eduLevel == "Doctorate"))
percentOfDoctorateOver50 = (nDoctorateOver50K / nDoctorate) * 100


#Correlation between over 50K and numerical variables
cor.test(mydata$age, mydata$over50K, method = "pearson") #low
cor.test(mydata$hoursPerWeek, mydata$over50K, method = "pearson") #low

#clean the data by taking out outliers

#6. Split the data into training, validation, and test data sets.
normalize <- function(x){
  + return( (x-min(x)) / (max(x)-min(x))) }
normalize(c(1,2,3,4,5))

mydata_train <- mydata[1:16280, ]
mydata_validation <- mydata[16281:32560, ]
mydata_test <- mydata[32560:48842, ]

m1 <- knn(mydata_train,mydata_test,mydata_validation,100) #prediction for the classification of all the values in the test dataframe
m1
#7. Develop a model that predicts whether individuals, based on the census variables provided, make over $50,000/year. 
    # Use over_50k as the target variable.