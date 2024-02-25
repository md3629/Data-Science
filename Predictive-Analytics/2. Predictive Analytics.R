# 2.1 Mean
x <- c(2.45, 3.55, 4.25, 5.35, 3.50)
mean(x)

# 2.2 Median
 median(x)

 
# 2.3 Standard Deviation

sd(x)

# 2.4 Standard Deviation
var(x) 

# 2.5 Descritive Statistics

summary(x)

# 2.6 Correlation

d <- c(620, 515, 420, 220, 415) # demand

cor(x, d)

# 2.7 Correlation Tests

cor.test(x, d, method=c("pearson")) #used in accounting application

cor.test(x, d, method=c("kendall"))

cor.test(x, d, method=c("spearman"))

# 2.8 Covariance
cov(x, d)

# 2.9 Histograms

d <- c(620, 515, 420, 220, 415, 752, 455, 655, 375, 380,630, 725)

hist(
  d,
  probability = FALSE,
  breaks = 3,
  main = "Frequency Distribution",
  col = "yellow"
)

hist(
  d,
  probability = TRUE,
  breaks = 5,
  main = "Probability Mass Function",
  col = "green"
)