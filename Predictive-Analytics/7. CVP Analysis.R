# 1. Cost Volume Profit (CVP) Analysis at RailWorks Company ---------------------------------


# Unknown: number of passenger cars hauled during a week (P)
# Unknown: number of trips during a week (N)
# Unknown: the price per passenger ticket (S)
# Unknown: the break-even load factor L
# Uncertainties: N = Uniform(38,58) and P = Uniform(1620, 2620)
# Uncertainities: S ~ Normal(40, 5^2)
# The annual profit (∏)
# ∏ = 4160PSL - (121,000,000 + 31200N + 1040P + 1280PL + 520000N + 26000P + 41600PL)
# ∏ = 0
#  => L = (121,000,000 + 551,200N + 27,040P) /(4,160PS - 54,080P)



# 1.1 Simulating the Break-even Load Factor  --------
# Compute the mean, median, 25th and 75th quartiles, minimum and maximum values,
# and standard deviation for the break-even load factor

set.seed(101)
n <- 1000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  S <- rnorm(n, mean = 40, sd = 5)
  L <- (121000000 + 551200 * N + 27040 * P) / (4160 * P * S - 54080 * P)
}

hist(L,
     probability = TRUE,
     breaks = 100,
     main = "Break-even Passenger Load Factor")

summary(L)
mean(L)
min(L)
max(L)
sd(L)

# The minimum and the maximum values for the break-even load factor are 49.7% and 230%, respectively
#The load factor cannot exceed 100%, and hence simulation should be truncated at the maximum 100% load factor values

# L<= 1, prob(l <= 1)
# The probability of L being less than 100% is 68.91%

pnorm(1, 0.8983, 0.2061873)

# 1.2 Effect of Sample Size: Simulating the Break-even Load Factor

n <- 10000

# 1.3 Fitting a Lognormal Distribution to the Simulated Load Factors

logL <- log(L)
meanlog <- mean(logL)
sdlog <- sd(logL)

set.seed(101)
n <- 1000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  S <- rnorm(n, mean = 40, sd = 5)
  L <- (121000000 + 551200 * N + 27040 * P) / (4160 * P * S - 54080 * P)
}

Lden <- seq(min(L), max(L), length = 100)


lines(Lden,
      dlnorm(
        Lden,
        meanlog = -0.1309096,
        sdlog = 0.2137691,
        log = FALSE
      ))
#Ex1
#probability of break-even load factor L<100%
# L<100% is 72.9%
plnorm(1, -0.1309096, 0.2137691)

#Ex2
# Probability of a break-even load factor
# 40% < L < 70%
#is 14.5%
plnorm(0.7,-0.1309096, 0.2137691)
plnorm(0.4,-0.1309096, 0.2137691)



# 2.Monte Carlo Simulation of the Degree of Operating Leverage (DOL) --------

# Degree of operating leverage DOL = (sales – variable costs)/(sales variable costs – fixed costs)
# Degree of operating leverage DOL = changes in sales/change in operating income
# DOL = % change in sales / % change in EBIT

# Unknown: number of passenger cars hauled during a week (P)
# Unknown: number of trips during a week (N)
# Unknown: the price per passenger ticket (S)
# Unknown: the break-even load factor L
# Uncertainties: N = Uniform(38,58) and P = Uniform(1620, 2620)
# Uncertainities: S ~ Normal(40, 5^2)
# Uncertainities: L =Uniform(0.49, 0.85)
# DOL = 1 + (121,000,000/(4160PSL - 551200N - 27040P -54080PL))

# Compute the mean, median, 25th and 75th quartiles, minimum and maximum values,
# and standard deviation for the DOL


n <- 10000
#set.seed(101)
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  S <- rnorm(n, mean = 40, sd = 5)
  L <- runif(n, min = 0.49, max = 0.85)
  D <-  (1 + ((121000000) / (
    4160 * P * S * L - 551200 * N - 27040 * P - 54080 * P * L
  )))
}

hist(D,
     probability = TRUE,
     breaks = 100,
     main = "Break-even Passenger Load Factor")

summary(D)
mean(D)
min(D)
max(D)
sd(D)

# 2.1 Excluding Negative DOL Values

# assign the possitive value to another parameter, DP <- D[D>0]

n <- 10000
#set.seed(101)
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  S <- rnorm(n, mean = 40, sd = 5)
  L <- runif(n, min = 0.49, max = 0.85)
  D <-  (1 + ((121000000) / (
    4160 * P * S * L - 551200 * N - 27040 * P - 54080 * P * L
  )))
}

DP <- D[D > 0]

hist(DP,
     probability = TRUE,
     breaks = 2000,
     main = "Break-even Passenger Load Factor")


library(plyr)
PDOL <- cut(DP, breaks = seq(0, 15, 1))
library(epiDisplay)
tab1(PDOL, cum.percent = TRUE)

#The highest relative PDOL frequency is between 2 and 3 times, with 46.8%