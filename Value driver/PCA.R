library(tidyverse)
# Generate example data
set.seed(42)
n_obs <- 100
n_vars <- 5
data <- data.frame(
  Sales = runif(n_obs, min = 1000, max = 5000),
  Expenses = runif(n_obs, min = 500, max = 2000),
  Profit = runif(n_obs, min = 300, max = 1500),
  Employees = sample(180:200, n_obs, replace = TRUE),
  CustomerSatisfaction = runif(n_obs, min = 1, max = 10)
)

# Standardize the Data
scaled_data <- scale(data)

# Perform PCA
pca <- prcomp(scaled_data, center = TRUE, scale. = TRUE)

# Explore Principal Components
summary(pca)

# Analyze Component Loadings
loadings <- pca$rotation

# Scree plot
plot(pca)

# Biplot
biplot(pca)
