# https://rpubs.com/Koi_P/660327

# DATA SUMMARY ------------------------------------------------------------


View(Mall_Customers)
summary(Mall_Customers) #summary of the data set 

any(is.na(Mall_Customers))#To find missing values


# DATA VISUALIZATION ------------------------------------------------------


# PLOTS
# Histograms

library(ggplot2)
ggplot(Mall_Customers, aes(x = Age, fill = Gender)) +
  geom_histogram(bins = 50) # Histogram of Age filling Gender

ggplot(Mall_Customers, aes(x = `Annual Income (k$)`, fill = Gender)) +
  geom_histogram(bins = 50) # Histogram of Annual income filling Gender


ggplot(Mall_Customers, aes(x = Gender)) + 
  geom_bar ()


p <-
  ggplot(Mall_Customers, aes(y = `Annual Income (k$)`, x = Gender)) +
  geom_violin(trim = FALSE)
p + geom_boxplot(width = 0.1)#  shows the Annual income plot showwing the different genders


p <-
  ggplot(Mall_Customers, aes(y = `Spending Score (1-100)`, x = Gender)) +
  geom_violin(trim = FALSE)
p + geom_boxplot(width = 0.1)# shows the Annual income plot showwing the different genders


library(GGally)
ggcorr(Mall_Customers)

par(mfrow=c(2,2))
plot(Mall_Customers)


X <- Mall_Customers[, 2:5]
library(GGally)
ggpairs(X)


# K-MEAN ALGORITHM --------------------------------------------------------



library(purrr)
set.seed(123)
#function to calculate total intra-cluster sum of square
iss <- function(k)
{
  kmeans(
    Mall_Customers[, 3:5],
    k,
    iter.max = 100,
    nstart = 100,
    algorithm = "Lloyd"
  )$tot.withinss
}

k.value <- 1:10

iss_value <- map_dbl(k.value, iss)

plot(
  k.value,
  iss_value,
  type = "b",
  pch = 19,
  frame = FALSE,
  xlab = "Number of clusters K",
  ylab = "Total intra-clusters sum of squares"
)


# AVERAGE SILHOUETTE METHOD -----------------------------------------------



library(NbClust)
library(factoextra)


fviz_nbclust(Mall_Customers[, 3:5], kmeans, method = "silhouette")


# GAP STATISTIC METHOD ----------------------------------------------------


library(NbClust)
library(factoextra)
library(cluster)
stat_gap <-
  clusGap(
    Mall_Customers[, 3:5],
    FUN = kmeans,
    nstart = 25,
    K.max = 10,
    B = 50
  )
fviz_gap_stat(stat_gap)


# PLOTTING THE 6 CLUSTERS -------------------------------------------------


pcclust = prcomp(Mall_Customers[, 3:5], scale = FALSE) #principal component analysis
summary(pcclust)

pcclust$rotation[,1:2]


fun <- function(k) {
  kmeans(Mall_Customers[, 3:5],
         k,
         iter.max = 100,
         nstart = 100,
         algorithm = 'Lloyd')$tot.withinss
}

k.values <- 1:10

fun_value <- map_dbl(k.values, fun)

k6 <- kmeans(Mall_Customers[, 3:5],
             6,
             iter.max = 100,
             nstart = 50,
             algorithm = 'Lloyd')


library(ggplot2)
# annual income vs spending score clusters
ggplot(Mall_Customers,
       aes(x = `Annual Income (k$)`, y = `Spending Score (1-100)`)) +
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(
    name = " ",
    breaks = c("1", "2", "3", "4", "5", "6"),
    labels = c(
      "Cluster 1",
      "Cluster 2",
      "Cluster 3",
      "Cluster 4",
      "Cluster 5",
      "Cluster 6"
    )
  ) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")


#spending score vs age clusters
ggplot(Mall_Customers, aes(x = `Spending Score (1-100)`, y = Age)) +
  geom_point(stat = "identity", aes(color = as.factor(k6$cluster))) +
  scale_color_discrete(
    name = " ",
    breaks = c("1", "2", "3", "4", "5", "6"),
    labels = c(
      "Cluster 1",
      "Cluster 2",
      "Cluster 3",
      "Cluster 4",
      "Cluster 5",
      "Cluster 6"
    )
  ) +
  ggtitle("Segments of Mall Customers", subtitle = "Using K-means Clustering")


# MAPPING CLUSTERS BACK TO THE DATA ---------------------------------------


o = order(k6$cluster)
data.frame(Mall_Customers$CustomerID[o], k5$cluster[o])# Using only customer ID for easy tracking
