# Data-Science

## Predictive Analytics under uncertainity using Monte Carlo simulation

Discussing process and experimenting with Monte Carlo

<h3></h3>
<p> The first part is a simple Service costing in R using Power BI. <br>
The Second part is Cost Volume Profit (CVP) Analysis.  
<br>
The next part is Financial budgeting under uncertainity<br>
The last part is the application of Real options and a simple example to illustrates the power of real options through the execution of an option to wait. <br>

 ### Service costing in R using Power BI

<img src="Predictive-Analytics/pic/MC-4.jpg" width="100%" />

### Cost Volume Profit (CVP) Analysis.

<img src="Predictive-Analytics/pic/MC-5.jpg" width="100%" />

### Financial budgeting under uncertainity

<img src="Predictive-Analytics/pic/MC-6.jpg" width="100%" />

 ### A simple example to illustrates the power of real options through the execution of an option to wait.		
			
Problem: Given a set of state variables and associated net cash flows for an investment project simulated through Monte Carlo simulation, solve for the real option value of a capital investment project through the least-squares Monte Carlo simulation (LSM) method.	

**Assumptions:**<br>	
Operating costs of the project are fixed	<br>
Revenues are dependent upon a stochastically evolving underlying asset that follows a GBM process	<br>
The project can be invested at the beginning of each month (i.e. dt = 1/12) of the year.	<br>
Cash flows are delivered at the end of each month. 	<br>
There is a construction time of 6 months considered in this investment project, which means there is 6 months between the initial capital investment and when net cash flows of the project are accrued. 	<br>
The initial capital investment cost also decreases exponentially at a rate of 1% p.a. to allow research and development into the project to reduce the cost of investment.	<br>
Initial price of asset: 36 <br>
Discrete time step = 1/12 (monthly) <br>
Project lifetime (in years) = 10<br>
Capital investement = 100,000 <br> 
**Results**<br>
'Real Option value': The value of the capital investment project considering flexibility in the timing of investment. **(1.2mil)**<br>
'Net Present Value': The value of the capital investment project considering immediate investment. **(1.0 mil)**<br>
'Waiting Option Value': The value of the option to delay initial investment, equal to the difference between the ROV and NPV **(0.2 mil)**

<img src="Predictive-Analytics/pic/NPV.jpeg" width="100%" />
	
