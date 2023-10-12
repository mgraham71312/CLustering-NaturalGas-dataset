library(dbscan)

## Step 1: Import dataset.
df <- read.csv("NaturalGas.csv")

# select variables for analysis
df <- df[, c("heating", "lprice")]


## Step 2: Show the data without clustering.
# 138 observations over 2 variables.
plot(df)


## Step 3: K-means.
set.seed(42)
(km <- kmeans(df, centers = 3, nstart = 25))


## Step 4: Show k-means clusters.
plot(df, main = "K-means Clustering", col = km$cluster)


## Step 5: DBSCAN.
# Find optimal eps value
kNNdistplot(df, k = 7)
abline(h = 146, lty = 2)

set.seed(42)
(db <- dbscan(df, eps = 146, minPts = 3))


## Step 6: Show DBSCAN clusters.
hullplot(df, main = "DBSCAN", db)


### Dataset
#### NaturalGas.csv retrieved June 25, 2022, from 
#### https://vincentarelbundock.github.io/Rdatasets/datasets.html