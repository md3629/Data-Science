# Load required packages
library(dplyr)
library(lubridate)

# Sample sales data (replace with your actual data)
sales_data <- data.frame(
  Date = seq(as.Date("2023-01-01"), by = "month", length.out = 24),
  Sales = c(100, 120, 110, 130, 140, 150, 160, 180, 170, 190, 200, 210,
            220, 240, 230, 250, 260, 270, 280, 290, 300, 310, 330, 320)
)

# Feature engineering (optional)
# Add lagged sales as a feature
sales_data$Prev_Sales <- lag(sales_data$Sales)

# Split data into training and testing sets
train_size <- floor(0.8 * nrow(sales_data))
train_data <- sales_data[1:train_size, ]
test_data <- sales_data[(train_size + 1):nrow(sales_data), ]

# Train linear regression model
model <- lm(Sales ~ ., data = train_data)

# Make predictions on test data
predictions <- predict(model, newdata = test_data)

# Evaluate model performance
mae <- mean(abs(predictions - test_data$Sales))
rmse <- sqrt(mean((predictions - test_data$Sales)^2))

# Visualize predictions
plot(test_data$Date, test_data$Sales, type = "l", col = "blue", xlab = "Date", ylab = "Sales", main = "Actual vs Predicted Sales")
lines(test_data$Date, predictions, type = "l", col = "red")
legend("topleft", legend = c("Actual", "Predicted"), col = c("blue", "red"), lty = 1)

# Print evaluation metrics
cat("Mean Absolute Error (MAE):", mae, "\n")
cat("Root Mean Squared Error (RMSE):", rmse, "\n")
