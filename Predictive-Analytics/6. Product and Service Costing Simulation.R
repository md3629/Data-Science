# 1. Service costing at RailWorks Company ---------------------------------


# Unknown: number of passenger cars hauled during a week (P)
# Unknown: number of trips during a week (N)
# Uncertainties: N = Uniform(38,58) and P = Uniform(1620, 2620)
# The annual total passenger service cost (T)
# T = 121,000,000 + 551,200N + 67,600P
# The service cost per passenger (c)
# c = (121,000,000 + 551,200N + 67,600P) / (3,120P)



# 1.1 Simulating the Probability Distribution for Total Passenger  --------
 # Compute the mean, median, 25th and 75th quartiles, minimum and maximum values,
# and standard deviation for the total passenger cost

n <- 10000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  T <- 121000000 + 551200 * N + 67600 * P
}

hist(T,
     probability = TRUE,
     breaks = 100,
     main = "Total Passenger Service Cost in £")

summary(T)
sd(T)

# 1.2 Constructing a Frequency Table of the Simulated Total Passenger Service Cost

n <- 10000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  T <- 121000000 + 551200 * N + 67600 * P
}
hist(T,
     probability = TRUE,
     breaks = 100,
     main = "Total Passenger Service Cost in £")
library('plyr')
TC <- cut(T, breaks = seq(250000000, 350000000, 25000000))
table(TC)
count(TC)



# 1.3 Constructing a Frequency Table of the Simulated Total Passenger Service Cost

n <- 10000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  T <- 121000000 + 551200 * N + 67600 * P
}
hist(T,
     probability = TRUE,
     breaks = 100,
     main = "Total Passenger Service Cost in £")
library('plyr')
library('epiDisplay')
TC <- cut(T, breaks = seq(250000000, 350000000, 25000000))

tab1(TC, cum.percent = TRUE)

# determining the probability of service costs exceeding £275 million as 
# p(X>=275 = 1- p(X<275) = 1-0.27 = 73%)
# The probability of total passenger service costs exceeding £325 million
# is p(X>=325) =1.6%

# 1.4 Simulating the Probability Distribution for Service Cost per Passenger

n <- 10000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  c <- (121000000 + 551200 * N + 67600 * P) / (3120 * P)
}

hist(c,
     probability = TRUE,
     breaks = 100,
     main = "Service Cost per Passenger in £")

summary(c)
sd(c)

# 1.5. Constructing a frequency Table for Service Cost per Passenger

n <- 10000
for (j in 1:n) {
  N <- runif(n, min = 38, max = 58)
  P <- runif(n, min = 1620, max = 2620)
  c <- (121000000 + 551200 * N + 67600 * P) / (3120 * P)
}


library('plyr')
library('epiDisplay')

uc <- cut(c, breaks = seq(39, 53, 2))
tab1(uc, cum.percent = TRUE)
