# lets start
ls()

# dataset text file as a table
dataset <- read.table("Q:/forth year/second term/Distributed computing/practical/data sceince project/Heartdiseas.txt", header = TRUE, sep = ",")
summary(dataset)

# some visualizations 
hist(dataset$sex, col ="yellow", freq = TRUE, main ="sex")
hist(dataset$slope, col ="blue", freq = TRUE, main ="slope")
hist(dataset$cp, col ="red", freq = TRUE, main ="chest pain type")

hist(dataset$fbs,main = "Fasting blood sugar > 120 mg/dl (1 = true; 0 = false)",
     col ="green", freq = TRUE)

hist(dataset$exang,main ="Exercise induced angina (1 = yes; 0 = no)",
     col ="black", freq = TRUE)


boxplot(dataset$trestbps)
boxplot(dataset$chol)
boxplot(dataset$thalach)
boxplot(dataset$oldpeak)


# preprocessing
preprocessing <- function(x){
  # removing duplicated rows
  install.packages('dplyr')
  library(dplyr)
  x <- distinct(x)
  summary(x)
  
  # Remove (Id)
  x = subset(x, select = -c(id))
  
  # replace null values in (age) by median
  x$Age[is.na(x$Age)] <- median(x$Age, na.rm = TRUE)
  
  # replace null values in (slope) by mode(most freq value) 
  t <- mode(x$slope)
  x$slope[is.na(x$slope)] <- t
  
  # now there is no nulls
  summary(x)
  
  # convert age to categories
  breaks <- c(20, 50, 60, 80)
  labels <- c(1, 2, 3)
  x$age <- cut(x$age, breaks, labels)
  summary(x)
  
  #convert the age and oldpeak to integer
  x$age <- as.integer(x$age)
  x$oldpeak <- as.integer(x$oldpeak)
  summary(x)
  
  # deal with outliers
  outliers <- which(x$trestbps  > 170)
  x$trestbps[outliers]<-median(x$trestbps)
  
  # plot trestbps values again
  trestbps_img <- boxplot(x$trestbps)
  
  # deal with outliers
  outliers <- which(x$chol > 360)
  x$chol[outliers]<-median(x$chol)
  
  # plot chol values again
  chol_img<-boxplot(x$chol)
  
  # deal with outliers
  outliers <- which(x$thalach < 100)
  x$thalach[outliers]<-median(x$thalach)
  
  # plot chol values again
  thalach_img<-boxplot(x$thalach)
  
  # return data after preprocessing
  x
}


# Define Mode Function
mode <- function(x){
  unique_values <- unique(x)
  distinct_values <- tabulate(match(x, unique_values))
  unique_values[which.max(distinct_values)]
}


# apply pre-processing on data
data <- preprocessing(dataset)
summary(data)


# plot correlation matrix
install.packages("ggcorrplot")
library(ggcorrplot)


model.matrix(~0+., data) %>% 
  cor(use="pairwise.complete.obs") %>% 
  ggcorrplot(show.diag=FALSE, type="lower", lab=TRUE, lab_size=2)


# Remove (sex and fbs and chol)
data = subset(data, select = -c(sex,fbs,chol))


#==============================================================================
# kmean model
install.packages("cluster")
library(cluster)

# get best k value
wss=numeric(15)
for(i in 1:15) wss[i]=sum(kmeans(data,i)$withinss)
plot(1:15,wss,type='b',xlab='number of cluster',ylab='within grp sum square')

kc <- kmeans(data, 5)
kc

# visualize model
hist(kc$cluster, main = "Histogram of Kmeans Clustring results", xlab = "clusters")
plot(data, col=kc$cluster)

plot(data$trestbps, data$thalach, col=kc$cluster)


#============================================================================
# Dbscan model
install.packages("dbscan")
library(dbscan)

Db <- dbscan(data, eps = 7, MinPts =  4)
Db

# visualize model
hist(Db$cluster, main = "Histogram of Dbscan Clustring results", xlab = "clusters")
plot(data, col=Db$cluster)

plot(data$trestbps, data$thalach, col=Db$cluster)


#============================================================================
# executing hierarchical clustering with complete linkage
hier_clust_1 <- hclust(dist(data), method = "complete")

# plot hierarchy
plot(hier_clust_1)

# getting cluster assignments based on number of selected clusters
hc_1_assign <- cutree(hier_clust_1, 5)
hc_1_assign

# visualize model
hist(hc_1_assign, main = "Histogram of complete hierarchy Clustring results", xlab = "clusters")

plot(data, col=hc_1_assign)

plot(data$trestbps, data$thalach, col=hc_1_assign)


#============================================================================
# executing hierarchical clustering with single linkage
hier_clust_2 <- hclust(dist(data), method = "single")

# plot hierarchy
plot(hier_clust_2)

# getting cluster assignments based on number of selected clusters
hc_2_assign <- cutree(hier_clust_2, 5)
hc_2_assign

# visualize model
hist(hc_2_assign, main = "Histogram of single hierarchy Clustring results", xlab = "clusters")

plot(data, col=hc_2_assign)

plot(data$trestbps, data$thalach, col=hc_2_assign)


#============================================================================