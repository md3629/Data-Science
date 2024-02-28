# Data  Science using R <img src="/Forecasting/pic/logo.png" align="right" /><img src="/Predictive-Analytics/pic/ggplot2.png" align="right"  width="20%"/><br>

This repository focuses on practical applications of Data Science using R, specifically delving into Predictive Analytics through Monte Carlo simulation and Customer Segmentation using clustering techniques. The repository provides insights into service costing, financial budgeting under uncertainty, and demonstrates the power of real options in investment projects.
<br> <br> **Key Topics:**

## Predictive Analytics under uncertainity using Monte Carlo simulation


The repository explores Monte Carlo simulation for predictive analytics, emphasizing its application under uncertainty.<br>
Detailed discussions and experiments are conducted, highlighting the process and significance of Monte Carlo simulation.

 ### Service costing in R using Power BI

<img src="Predictive-Analytics/pic/MC-4.jpg" width="100%" />

### Cost Volume Profit (CVP) Analysis.

<img src="Predictive-Analytics/pic/MC-5.jpg" width="100%" />

### Financial budgeting under uncertainity

<img src="Predictive-Analytics/pic/MC-6.jpg" width="100%" />

 ### A simple example to illustrates the power of real options through the execution of an option to wait.		

**Assumptions for the Real Option Valuation:** <br>
- Fixed operating costs.<br>
- Revenues dependent on a stochastically evolving underlying asset following a GBM process.
- Monthly investment opportunities with a construction time of 6 months.
- Exponential decrease in the initial capital investment cost.
- Key parameters: Initial asset price, time step, project lifetime, and capital investment.<br><br>
**Results:**

**'Real Option Value'**: Considering flexibility in the timing of investment (1.2 mil).<br>
**'Net Present Value'**: Immediate investment scenario (1.0 mil).<br>
**'Waiting Option Value**': The value of the option to delay initial investment (0.2 mil).<br>

<img src="Predictive-Analytics/pic/NPV.jpeg" width="100%" />
	
## Clustering
### Customer Segmentation using R
Discussing process and experimenting with clustering <br>
Using **KMeans** for Segmenting Customers and determining the Optimal value of K using Elbow Method. <br>
<br>
From the second visualisation, we observe that there is a distribution of 6 clusters as follows<br>
<br>
Cluster 1: This Cluster represents the customers who have a low Annual Income as well as a low Annual spend.<br>
Cluster 2: This Cluster represents the customers who have a high Annual Income but spends low.<br>
Cluster 3 + 4: This Cluster represents the customers having a medium Annual Income as well as a medium Annual spend, with two age groups, up to 40 and above.<br>
Cluster 5: This Cluster represents the customers having a low Annual Income but spends way too much.<br>
Cluster 6: This Cluster represents the customers having a very high Annual Income along with a high spending.

<img src="/Customer Segmentation/pic/CS5.jpeg" width="100%" />
