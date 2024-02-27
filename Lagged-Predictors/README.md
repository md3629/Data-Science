# Lagged predictors in R
Discussing process and experimenting with lagged predictors.

"Lagged predictors in R" refer to a technique in time series analysis where the values of a variable at previous time points (lags) are used as predictors for the current or future values of the same or another variable. This approach is especially relevant when analyzing time-dependent data to capture temporal dependencies and trends.<br>

In the context of regression models or machine learning, creating lagged predictors involves incorporating past values of a variable as features in the model. For example, if you have a time series dataset with a variable 'Y', lagged predictors would involve creating new features like 'Y<sub>(t-1)</sub>', 'Y<sub>(t-2)</sub>', and so on, representing the values of 'Y' at one or more time steps before the current time point 't'.

## Sample 1
<img src="/Lagged-Predictors/pic/Ins+Adv.jpeg" width="100%" />
<br>
Y<sub>t</sub> = 2.155 + 1.253x<sub>t</sub> + 0.146x<sub>t−1</sub> + η<sub>t</sub>, <br>
where <br>y<sub>t</sub> is the number of quotations provided in month t, x<sub>t</sub> is the advertising expenditure in month t,<br>
η<sub>t</sub> = 0.512η<sub>t−1</sub> + ε<sub>t</sub> + 0.917ε<sub>t−1</sub> + 0.459ε<sub>t−2</sub>,<br> <br>
and ε<sub>t</sub> is white noise.<br>
Data source is "Insurance.csv"
