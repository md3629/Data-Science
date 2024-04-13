<img src="/Customer Segmentation/pic/purrr.png" align="right" width="10%" /> <img src="/Customer Segmentation/pic/dbscan.svg" align="right" width="10%" />


# Customer Segmentation using R

**Customer segmentation** is the process of dividing customers into groups based on shared characteristics or behaviors. In R, we can perform customer segmentation using various clustering techniques such as k-means clustering, hierarchical clustering, and DBSCAN. Here's a basic guide on how to perform customer segmentation using k-means clustering in R:

## 1. Load Required Libraries

Libraries like purrr, cluster, [dbscan] (https://github.com/mhahsler/dbscan) etc

## 2. Load and Preprocess Data
Load our customer data into R and preprocess it as needed. Ensure that our data is cleaned and in the right format for clustering analysis.

## 3. Feature Selection
Select relevant features for customer segmentation. These features could include demographic information, purchase behavior, website interactions, etc.

## 4. Standardize Features
Standardize numerical features to ensure that they have the same scale. This step is crucial for k-means clustering.

## 5. Determine the Number of Clusters (k)
Use methods like the elbow method or silhouette analysis to determine the optimal number of clusters for our data.

## 6. Perform K-Means Clustering
Fit the k-means clustering algorithm to your data with the chosen number of clusters (k).

## 7. Interpret Results
Analyze the resulting clusters to understand their characteristics and interpretability. We can examine cluster centroids, visualize clusters, and compare cluster profiles.

## 8. Refine and Validate Clusters
Evaluate the quality of the clusters and refine your segmentation approach if needed. You can validate clusters using internal validation measures or external validation with domain knowledge.

## 9. Use Segmentation Results
Apply the segmentation results to marketing strategies, product development, or other business decisions. Tailor our approach to each customer segment to maximize effectiveness.

By following these steps, we can perform customer segmentation using k-means clustering in R and gain insights into your customer base for targeted marketing and personalized services.

## Building a customer segmentation in R - Case study
<p> A simple customer segmentation in R using Power BI. </p>
Using KMeans for Segmenting Customers and determining the Optimal value of K using Elbow Method. <br>
First part is checking data quality and Visualising the Dataset using various dimensions.
<br>
The Second part is choosing the number of clusters - this is a very easy dataset.  
<br>
From the second visualisation, we observe that there is a distribution of 6 clusters as follows<br>
<br>
Cluster 1: This Cluster represents the customers who have a low Annual Income as well as a low Annual spend.<br>
Cluster 2: This Cluster represents the customers who have a high Annual Income but spends low.<br>
Cluster 3 + 4: This Cluster represents the customers having a medium Annual Income as well as a medium Annual spend, with two age groups, up to 40 and above.<br>
Cluster 5: This Cluster represents the customers having a low Annual Income but spends way too much.<br>
Cluster 6: This Cluster represents the customers having a very high Annual Income along with a high spending.

<img src="/Customer Segmentation/pic/Customer Segmentation_page-0001.jpg" width="100%" />
<img src="/Customer Segmentation/pic/CS1.jpeg" width="100%" />
<img src="/Customer Segmentation/pic/CS2.jpeg" width="100%" />
<img src="/Customer Segmentation/pic/CS3.jpeg" width="100%" />
<img src="/Customer Segmentation/pic/CS4.jpeg" width="100%" />
<img src="/Customer Segmentation/pic/CS5.jpeg" width="100%" />
