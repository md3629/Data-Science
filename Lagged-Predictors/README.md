# Lagged predictors in R
Discussing process and experimenting with lagged predictors
<img src="/Lagged-Predictors/pic/Ins+Adv.jpeg" width="100%" />
<br>
Y<sub>t</sub> = 2.155 + 1.253x<sub>t</sub> + 0.146x<sub>t−1</sub> + η<sub>t</sub>, <br>
* where y<sub>t</sub> is the number of quotations provided in month _t_, x<sub>t</sub> is the advertising expenditure in month _t_,<br>
- η<sub>t</sub> = 0.512η<sub>t−1</sub> + ε<sub>t</sub> + 0.917ε<sub>t−1</sub> + 0.459ε<sub>t−2</sub>,
