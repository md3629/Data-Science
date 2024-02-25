# 4.1 Simple Linear Regression

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
  pch = 15,
  frame = FALSE, col="red"
)

abline(lm(x~d)) #linear model

# 4.2 Local regression

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
  pch = 15,
  frame = FALSE,
  type = "b",
  lty = 1,
  col="red"
)

lines(lowess(d,x), col="blue")