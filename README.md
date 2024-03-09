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
##### three clustering models had applied are: Kmeans
##### When using K = 5 with (thalach, trestbps):
![image](https://github.com/Mustafa-sayed23/Heart-Disease-clustering-using-R/assets/162192046/6953b27e-69e7-463b-b332-e48fa2268142)



, Dbscan, hierarchical using (complete and single) link.

