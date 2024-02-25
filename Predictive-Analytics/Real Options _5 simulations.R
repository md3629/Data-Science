library(LSMRealOptions)
library(ggplot2)
library(tidyr)
library(dplyr)
set.seed(1)

# Step 1 - Simulate the underlying asset price:

## Initial underlying price:
initial_price <- 36

## discrete time step:
dt <- 1 / 12

## Project lifetime (in years):
project_lifetime <- 10
forecasting_periods <- seq(0, project_lifetime, dt)

revenue_prices <-
  GBM_simulate(
    n = 5,
    t = project_lifetime,
    mu = 0.06,
    sigma = 0.2,
    S0 = initial_price,
    dt = dt
  )
# str(revenue_prices)
# head(revenue_prices)
# df_revenue_prices <- cbind(revenue_prices,forecasting_periods)

# Preparing data
df_revenue_prices <- as.data.frame(revenue_prices) %>%
  mutate(ix = 1:nrow(revenue_prices)) %>%
  pivot_longer(-ix, names_to = 'sim', values_to = 'price')

df_revenue_prices %>%
  ggplot(aes(x = ix, y = price, color = sim)) +
  geom_line() +
  theme(legend.position = 'none') +
  ggtitle("1. Simulation of the underlying asset price over Project Planning Horizon") +
  xlab("Planning Horizon (Months)")

# Step 2 - Evaluate cash flows:

## Fixed cash flow:
# FCF <- 1e4 * initial_price
FCF <- 1e4 * 36

## Net cash flow is equal to variable cash flows subtract fixed cash flows:
NCF <- (1e4 * revenue_prices - FCF) * dt

## Financial Parameters:
construction <- 0.5 / dt
rf <- 0.05

## Initial capital investment:
learning_rate <- 0.01
CAPEX <- 1e5 * exp(- learning_rate * dt * (1:nrow(revenue_prices)-1))

# Step 3 - Evaluate Project Value through Real Options Analysis:
NCF <- (1e4 * revenue_prices - FCF) * dt
project_value <- LSM_real_option(state_variables = revenue_prices,
                                 NCF = NCF,
                                 CAPEX = CAPEX,
                                 dt = dt,
                                 rf = rf,
                                 construction = construction,
                                 verbose = TRUE)
print(format(unlist(project_value[1:9]), big.mark = ","))
project_value$PB

matplot(
  forecasting_periods,
  project_value$`Cumulative Investment Prob`,
  type = 'l',
  ylim = c(0, 1),
  xlab = "Forecasting Horizon",
  ylab = "Cumulative Investment Proability",
  main = "Cumulative Investment Prop. over Forecasting Horizon",
  sub = "5 simulations"
)
abline(v = project_value$PB, col = "red")
legend(
  "right",
  c("Probability", "Payback"),
  cex = 0.8,
  col = 1:2,
  fill = 1:2
)

df_NCF <- as.data.frame(NCF) %>%
  mutate(ix = 1:nrow(NCF)) %>%
  pivot_longer(-ix, names_to = 'sim', values_to = 'value')

df_NCF %>%
  ggplot(aes(x = ix, y = value, color = sim)) +
  geom_line() +
  theme(legend.position = 'none') +
  labs(x = "Planning Horizon (Months)",
       title = "Evaluate net cash flows NCF",
       subtitle = "5 simulations using geometric Brownian motion GBM\nROV = 1.2 mil, NPV = 1.0 mil, WOV = 0.2 mil") +
  geom_vline(aes(xintercept = as.numeric(project_value$PB * 12)),
             colour = "grey50",
             alpha = 1.5) +
  geom_text(aes(x = 37, y = 75000, label = "Payback, PB"),
            size = 4) +
  scale_y_continuous(labels = scales::label_dollar(prefix = "", suffix = ""))

