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

![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/6953b27e-69e7-463b-b332-e48fa2268142)

##### 2) Dbscan
##### Dbscan result when using eps = 6, MinPts =  5 based on (thalach, trestbps) features:
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/f0d2fdab-dca6-4907-8335-bf963af071ec)
##### Dbscan clustered the data into 8 clusters.

##### 3) hierarchical clustering: there is 2 linkage types are complete and single hierarchical clustering models:

##### •	complete link: link 2 clusters based on the max distance between 2 elements.
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/9e7fb655-5ebf-483a-8de9-c1bc5d576f3d)

##### •	single link: link 2 clusters based on the min distance between 2 elements.
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/c98db03a-1e4a-400e-aa7b-8c2bbcd59121)

##### complete or single link clustered the data into 5 clusters but complete hierarchical clustering model gived better perfomance.
