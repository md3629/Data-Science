library(tidyverse)
# Generate example data
set.seed(42)
n_months <- 12
sales_data <- data.frame(
  Month = seq(as.Date("2022-01-01"), by = "month", length.out = n_months),
  AdvertisingSpend = runif(n_months, min = 1000, max = 5000),
  SalesForceEfficiency = runif(n_months, min = 0.5, max = 1),
  WebsiteTraffic = runif(n_months, min = 5000, max = 10000),
  Sales = rnorm(n_months, mean = 50000, sd = 10000)
)


# Calculate correlation coefficients
correlation <- cor(sales_data[, c("AdvertisingSpend", "SalesForceEfficiency", "WebsiteTraffic")], sales_data$Sales)
correlation


# Visualize relationships
ggplot(sales_data, aes(x = AdvertisingSpend, y = Sales)) +
  geom_point() +
  labs(title = "Advertising Spend vs. Sales")

ggplot(sales_data, aes(x = SalesForceEfficiency, y = Sales)) +
  geom_point() +
  labs(title = "Sales Force Efficiency vs. Sales")

ggplot(sales_data, aes(x = WebsiteTraffic, y = Sales)) +
  geom_point() +
  labs(title = "Website Traffic vs. Sales")


# Scenario analysis: Increase advertising spend by 20%
sales_data$Sales_scenario1 <- sales_data$Sales + (sales_data$AdvertisingSpend * 0.2)

# Scenario analysis: Improve sales force efficiency by 10%
sales_data$Sales_scenario2 <- sales_data$Sales + (sales_data$SalesForceEfficiency * 0.1)

# Plot scenario analysis results
ggplot(sales_data, aes(x = Month)) +
  geom_line(aes(y = Sales, color = "Actual")) +
  geom_line(aes(y = Sales_scenario1, color = "Scenario 1")) +
  geom_line(aes(y = Sales_scenario2, color = "Scenario 2")) +
  labs(title = "Scenario Analysis for Sales",
       x = "Month",
       y = "Sales") +
  scale_color_manual(values = c("Actual" = "blue", "Scenario 1" = "red", "Scenario 2" = "green"))

