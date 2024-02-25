# 5.1 Random Sampling from Probability Distribution

# 5.1.1 Sampling from Standard Normal Distribution

# 5 St Normal values with mean of 0 and a standard deviation of 1
x <- rnorm(5)
x

# 5.1.2 Sampling from Normal Distribution
# 5 St Normal values with mean of 15 and a standard deviation of 3

x <- rnorm(5, 15, 3)
x
summary(x)

# 5.1.3 Computing Probability Using the Normal Distribution

# What is the probability of a value of 8
pnorm(8, 15, 3)

# 5.1.4 Inverse Transformation of the Normal Distribution
#probability/quantile 0.23, mean - 15, SD = 3
qnorm(0.23, 15, 3)

# 5.2 Setting the Random Number Seed

set.seed(1)
rnorm(5.15, 3)

# 5.3 Running and Plotting Simulations - Sampling from a Normal Distribution

set.seed(9567)
n <- 10000000
x <- rnorm(n, 15, 3)
hist(x,
     probability = TRUE,
     breaks = 100,
     main = "Simulated Normal Distribution")
xden <- seq(min(x), max(x), length = 100)
lines(xden, dnorm(xden, mean = 15, sd = 3))

# 5.4 Running and Plotting Simulations - Sampling from a Uniform Distribution

?dunif()
# punif()
# qunif()
# runif()

n <- 5000
x <- runif(n, min = 100, max = 150)
hist(x, probability = TRUE, main = "Simulated Uniform Distribution")

# 5.5 Running and Plotting Simulations - Sampling from a Lognormal Distribution
set.seed(1999)
n <- 1000
x <- rlnorm(n, meanlog = 120, sdlog = 1.2)
hist(x,
     probability = TRUE,
     breaks = 100,
     main = "Simulated Lognormal Distribution")

#5.6 Running and Plotting Simulations - Sampling from a discrete Distribution

# Discrete probability distribution for demand X shown below
# The probability of 1, 600 units demanded is 20 % (p1), 2,000 units demanded is 60% (p2),
# and 2,400 units demanded is 20% (p3)

rX <- function(n, p) {
  U <- runif(n)
  X <- rep(0, n)
  w1 <- which(U <= p[1])
  X[w1] <- 1600
  w2 <- which((U > p[1]) & (U < sum(p[1:2])))
  X[w2] <- 2000
  w3 <- which(U > sum(p[1:2]))
  X[w3] <- 2400
  return(X)
}
X <- rX(1000, c(0.2, 0.6, 0.2))
hist(X, probability = TRUE, main="Simulated Discrete Distribution")


# 5.7 

set.seed(19678)
n <- 10000
for (j in 1:n) {
  x <- rnorm(n, mean = 10, sd = 2)
  R <- 1000 * x
}
hist(R,
     probability = TRUE,
     breaks = 100,
     main = "Density for the total revenue R = 1000X, with mean of 10 and sd of 2")
summary(R)
min(R)
max(R)
sd(R)

#probability of realizing total sales revenue less than  X<= £8,000
# prob(x<=8000)
pnorm(8000, 10002, 1998)

#probability that revenue will exceed 12,000
1- pnorm(12000, 10002, 1998)
