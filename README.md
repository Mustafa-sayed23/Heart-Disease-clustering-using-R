# Heart-Disease-clustering-using-R
## R Program to clustering heart disease based on different features

### • Pre-processing
##### removed dublicated rows.
##### removed (id) column from dataset as it not important feature.
##### replaced null values in (slope) column by mode (most frequent value) which defined in the script.
##### converted (age) column to categories based on specific intervals.
##### converted the (age) and (oldpeak) columns to integer as age is factor.
##### Dealt with outliers based on box plot visualization:
##### - (trestbps) column contained outliers when value > 170.
##### - (chol) column contained outliers when value > 360.
##### - (thalach) column contained outliers when value < 100.
##### then replaced outliers by median.

##### then based on correlation matrix that was calculated and visualized (sex, fbs, chol) columns had removed as they had low correlation value compared with other features.

### • Models
##### three clustering models had applied are:
##### 1) Kmeans
##### Kmeans result when using K = 5 based on (thalach, trestbps) features:

![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/7ae5e97c-fd5c-4b1f-ae3f-8e14f96cc656)

##### 2) Dbscan
##### Dbscan result when using eps = 6, MinPts =  5 based on (thalach, trestbps) features:
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/ac13a8e7-8c0a-4bff-90b1-5f3e160bf641)

##### Dbscan clustered the data into 8 clusters.

##### 3) hierarchical clustering: there is 2 linkage types are complete and single hierarchical clustering models:

##### •	complete link: link 2 clusters based on the max distance between 2 elements.
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/c87e6eb6-54d0-45cf-b5fa-d19301793d40)

##### •	single link: link 2 clusters based on the min distance between 2 elements.
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/5449005a-ce18-4f60-bd9f-47471f3dc040)

##### complete or single link clustered the data into 5 clusters but complete hierarchical clustering model gived better perfomance.
