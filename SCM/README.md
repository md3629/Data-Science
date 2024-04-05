<img src="/SCM/pic/planr.png" align="right" width="10%" />

# Supply Chain Management (SCM)

**Supply chain management** (SCM) is the process of managing the flow of goods and services to and from a business, including every step involved in turning raw materials and components into final products and getting them to the ultimate customer.

Modelling various reports can be done with _BI using DAX_ or _R_.

In R, there are various models and techniques available for supply chain management (SCM) analytics, which aim to optimize and improve various aspects of supply chain operations. Some of the commonly used models include:

## Inventory Management Models:
- Economic Order Quantity (EOQ) models
- Inventory control models (e.g., ABC analysis, JIT inventory)
- Multi-echelon inventory optimization models
- Stochastic inventory models

## Demand Forecasting Models:
- Time series forecasting models (e.g., ARIMA, exponential smoothing)
- Machine learning algorithms (e.g., random forests, gradient boosting)
- Regression-based forecasting models
- Collaborative filtering and recommendation systems

## Network Optimization Models:
- Transportation optimization models (e.g., vehicle routing problem, transportation network design)
- Facility location and allocation models
- Supply chain network design models
- Multi-commodity flow models
## Production Planning and Scheduling Models:
- Aggregate production planning models
- Material requirements planning (MRP) models
- Production scheduling algorithms (e.g., job shop scheduling, flow shop scheduling)
- Capacity planning and optimization models
## Supply Chain Simulation Models:
- Discrete event simulation models
- Agent-based modeling and simulation
- Monte Carlo simulation for risk analysis and scenario planning
## Supply Chain Analytics with Machine Learning:
- Predictive maintenance models for equipment and machinery
- Anomaly detection models for detecting deviations in supply chain operations
- Natural language processing (NLP) for analyzing unstructured data such as customer feedback and supplier contracts

## Case study solution in R
The [**planr** package](https://github.com/nguyennico/planr) in R provides tools for generating and manipulating schedules and timelines. It can be useful for various applications such as project management, resource allocation, and capacity planning. 

There are currently 3 groups of functions :

-   Calculation & Analysis of projected inventories : **light_proj_inv()** / **proj_inv()** / **const_dmd()**

-   Calculation of Replenishment Plan (also called DRP) : **drp()**

-   Breakdown of Monthly Demand into Weekly Buckets : **month_to_week()**
