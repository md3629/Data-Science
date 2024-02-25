# 1. Simulating a Probabilistic Sales Budget ------------------------------

# Total sales reveneue - 4XY
# Sales demand X ~ lognormal(15.205, 0.634284)
# Unit selling price Y ~ lognormal(-0.28991, 0.077094)

set.seed(1999)

n <- 10000
for (j in 1:n) {
  X <- rlnorm(n, meanlog = 15.208, sdlog = 0.634284)
  Y <- rlnorm(n, meanlog = -0.28991, sdlog = 0.077094)
  S <- 4 * X * Y
}

hist(S,
     probability = TRUE,
     breaks = 100,
     main = "Total Annual Sales Revenue")
summary(S)
min(S)
max(S)
sd(S)

# Probability of total sales revenue exceeding the traditional budgeted amount of £12 million

logS <- log(S)
mean(logS)
sd(logS)

Sden <- seq(min(S), max(S), length = 100)
lines(Sden, dlnorm(Sden, meanlog = 16.2962, 0.6422126, log = FALSE))
plnorm(12000000, 16.2962, 0.6422126)

#The probability of total annual sales being less than budget of 12 million is 50.26%

# 2. Simulating Probabilistic Production Budget ---------------------------

#Total Production = 4X + 25000
# X ~ lognormal(15.208, 0.634284)
# The probability of annual production in units exceeding  the traditional bedgeted amountof 16,025,000 units

set.seed(1999)

n <- 10000
for (j in 1:n) {
  X <- rlnorm(n, meanlog = 15.05796, sdlog = 0.634284)
  P <- 4 * (X*0.9469  + 218750)
}



hist(P,
     probability = TRUE,
     breaks = 100,
     main = "Total Annual Production in Units")
summary(P)
min(P)
max(P)
sd(P)

logP <- log(P)
mean(logP)
sd(logP)

Pden <- seq(min(P), max(P), length = 100)
lines(Pden,
      dlnorm(
        Pden,
        meanlog = 16.56568,
        sdlog = 0.5889247,
        log = FALSE
      ))
plnorm(16025000, 16.56568, 0.5889247)

#Probability of annual production quantity being less that the traditional budgeted production quantity of 16,025,000 units is 49.88%