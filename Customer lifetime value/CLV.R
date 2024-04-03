library(dplyr)
library(ggplot2)
library(rlist)
library(ggthemes)
library(survival)
library(survminer)



# Simulated customer transaction data
customer_data <- data.frame(
  CustomerID = 1:100,
  Recency = sample(1:365, 100, replace = TRUE), # Days since last purchase
  Frequency = sample(1:10, 100, replace = TRUE), # Number of purchases
  Monetary = runif(100, min = 10, max = 1000) # Monetary value of purchases
)

# Calculate RFM metrics
rfm_data <- customer_data %>%
  mutate(
    RecencyScore = ntile(Recency, 5), # Divide customers into quintiles based on recency
    FrequencyScore = ntile(Frequency, 5), # Divide customers into quintiles based on frequency
    MonetaryScore = ntile(Monetary, 5) # Divide customers into quintiles based on monetary value
  )

# Calculate CLV using simple average monetary value
clv_data <- rfm_data %>%
  summarise(
    AverageMonetary = mean(Monetary) * (Frequency / Recency)
  )

# Visualize CLV distribution
ggplot(clv_data, aes(x = AverageMonetary)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Customer Lifetime Value Distribution",
       x = "Average Monetary Value",
       y = "Frequency") +
  theme_few()
