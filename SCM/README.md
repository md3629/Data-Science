<img src="/SCM/pic/planr.png" align="right" width="10%" />

# Supply Chain Management (SCM)

**Supply chain management** (SCM) is the process of managing the flow of goods and services to and from a business, including every step involved in turning raw materials and components into final products and getting them to the ultimate customer.

Modelling various reports can be done with BI using DAX or R.

The [**planr** package](https://github.com/nguyennico/planr) in R provides tools for generating and manipulating schedules and timelines. It can be useful for various applications such as project management, resource allocation, and capacity planning. 

There are currently 3 groups of functions :

-   Calculation & Analysis of projected inventories : **light_proj_inv()** / **proj_inv()** / **const_dmd()**

-   Calculation of Replenishment Plan (also called DRP) : **drp()**

-   Breakdown of Monthly Demand into Weekly Buckets : **month_to_week()**
