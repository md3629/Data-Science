# 3.1 Scatter Plot

d <- c(220, 375, 380, 415, 420, 455, 515, 620, 630, 655, 725, 752)

x <-
  c(5.35,
    5.00,
    5.15,
    3.50,
    4.25,
    4.40,
    3.55,
    2.45,
    2.10,
    2.30,
    1.95,
    1.65)

plot(
  d,
  x,
  main = "Scatter Plot of Product Demand",
  xlab = "Demand",
  ylab = "Price",
  pch = 19,
  frame = FALSE
)

# 3.2 Creating Line Plots

plot(
  d,
  x,
  main = "Scatter Plot of Product Demand",
  xlab = "Demand",
  ylab = "Price",
  pch = 15,
  frame = FALSE,
  type = "b",
  lty = 1
)

plot(
  d,
  x,
  main = "Scatter Plot of Product Demand",
  xlab = "Demand",
  ylab = "Price",
  pch = 15,
  frame = FALSE,
  type = "s",
  lty = 2
)

# 3.3 Plots with Multiple Lines and a legend
y <-
  c(5.10,
    4.80,
    4.85,
    3.10,
    3.75,
    3.95,
    3.30,
    2.10,
    1.90,
    1.85,
    1.60,
    1.25)

plot(
  d,
  x,
  main = "Scatter Plot of Product Demand",
  xlab = "Demand",
  ylab = "Price",
  pch = 15,
  frame = FALSE,
  type = "b",
  lty = 1,
  col="red"
)
lines(
  d,
  y,
  pch = 19,
  col = "blue",
  type = "b",
  lty = 3
)
legend(
  "topright",
  legend = c("Product A", "Product B"),
  col = c("red", "blue"), lty=1,3, cex=0.8)
 