# Load required packages
library(dplyr)

# Sample customer data (replace with your actual data)
customer_data <- data.frame(
  CustomerID = 1:100,
  TotalSales = rnorm(100, mean = 1000, sd = 200),
  TotalCost = rnorm(100, mean = 700, sd = 150)
)

# Calculate customer profitability metrics
customer_data <- customer_data %>%
  mutate(
    Profit = TotalSales - TotalCost,
    CLV = Profit * 5 # Example calculation of CLV (replace with your actual CLV calculation)
  )

# Rank customers by CLV
top_customers <- customer_data %>%
  arrange(desc(CLV)) %>%
  head(10) # Get top 10 most profitable customers

# Print top customers
print(top_customers)
