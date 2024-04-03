# A Hands-On Guide to Customer Churn Prediction with Survival Analysis in R ----
#
# Follow along our tutorial at https://masteringr.com/data-science/a-hands-on-guide-to-customer-churn-prediction-with-survival-analysis-in-r/ with this R script.
#
####################

# Install and loaf the packages ----

## Install ----
install.packages("survival")
install.packages("survminer")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("caret")
install.packages("tidyverse")

## Load ----
library(survival)
library(survminer)
library(dplyr)
library(ggplot2)
library(caret)
library(tidyverse)


# Load the Telco Customer Churn dataset ----
data <- read.csv("WA_Fn-UseC_-Telco-Customer-Churn.csv")

# Remove NA values ----
data <- data %>% filter(!is.na(TotalCharges))

# Create dummy variables for the categorical variables ----

# Create dummy variables using model.matrix()
dummies <-
  model.matrix(
    ~ gender + Partner + Dependents + PhoneService + MultipleLines + InternetService + OnlineSecurity + OnlineBackup + DeviceProtection + TechSupport + StreamingTV + StreamingMovies + Contract + PaperlessBilling + PaymentMethod - 1,
    data = data
  )

# Convert the matrix to a data frame and merge it with the original dataset
dummies_df <- as.data.frame(dummies)
data_with_dummies <- cbind(data, dummies_df)

# Replace white space in column names with _
colnames(data_with_dummies) <-
  gsub(" ", "_", colnames(data_with_dummies))

# Rename churn to Churn_Yes and make it a dummy variable too
data_with_dummies <- rename(data_with_dummies, Churn_Yes = Churn)
data_with_dummies <-
  data_with_dummies %>% mutate(Churn_Yes = if_else(Churn_Yes == "Yes", 1, 0))

# Normalization of numerical variables ----

# Apply min-max scaling to numeric features
data_with_dummies$tenure <-
  (data_with_dummies$tenure - min(data_with_dummies$tenure)) / (max(data_with_dummies$tenure) - min(data_with_dummies$tenure))
data_with_dummies$MonthlyCharges <-
  (data_with_dummies$MonthlyCharges - min(data_with_dummies$MonthlyCharges)) / (max(data_with_dummies$MonthlyCharges) - min(data_with_dummies$MonthlyCharges))
data_with_dummies$TotalCharges <-
  (data_with_dummies$TotalCharges - min(data_with_dummies$TotalCharges)) / (max(data_with_dummies$TotalCharges) - min(data_with_dummies$TotalCharges))

# Split data ----

# Create data partition
partition <- createDataPartition(data_with_dummies$Churn_Yes, p = 0.7, list = FALSE)

# Split data into training and testing sets
training_data <- data_with_dummies[partition, ]
testing_data <- data_with_dummies[-partition, ]

# Exploratory data analysis ----

## Monthly charges and churn rate ----

# Breaking down monthly charges by percentile
monthly_charges_vs_churn <-
  training_data %>%
  select(MonthlyCharges, Churn_Yes) %>%
  mutate(QuantileRank = ntile(MonthlyCharges, 10)) %>%
  group_by(QuantileRank) %>%
  summarise(ChurnRate = sum(Churn_Yes) / n()) %>%
  ungroup()

monthly_charges_vs_churn %>%
  ggplot(aes(x = QuantileRank, y = ChurnRate)) +
  geom_col(fill = "#dc322f") +
  #scale_x_continuous(labels = comma_format(1)) +
  #scale_y_continuous(labels = percent_format(1)) +
  theme_classic() 

# Amount of services
monthly_charges_vs_churn_plus_services <-
  training_data %>%
  mutate(
    QuantileRank = ntile(MonthlyCharges, 10),
    CountOfServices = StreamingMoviesYes + StreamingTVYes + TechSupportYes + DeviceProtectionYes + OnlineBackupYes + OnlineSecurityYes + MultipleLinesYes + PhoneServiceYes
  ) %>%
  select(MonthlyCharges, QuantileRank, CountOfServices, Churn_Yes) %>%
  group_by(QuantileRank, CountOfServices) %>%
  summarise(ChurnRate = sum(Churn_Yes) / n()) %>%
  ungroup()

monthly_charges_vs_churn_plus_services %>% 
        ggplot(aes(x = QuantileRank, y = CountOfServices, fill = ChurnRate)) +
        geom_raster() +
        #scale_x_continuous(labels = comma_format(1)) +
        #scale_y_continuous(labels = comma_format(1))+
        scale_fill_gradientn(colours = c("#268bd2", "#dc322f"), 
                             #labels = percent,
                             name = "Churn rate",) +
        guides(fill = guide_colorbar(barwidth = 25, title.position = "top")) +
        labs(x = "\nQuantiles of monthly charges\nfrom low to high", y = "Number of services\nsubscribed to\n",
             title = "Churn rate by monthly charges and number of services",
             subtitle = "For a given monthly charge, less services equals more churn.") +
        theme_classic()

# Implementing survival analysis in R: a practical approach ----

# Enhance training and testing data with the count of services (normalized)
training_data <- 
        training_data %>% 
        mutate(CountOfServices = StreamingMoviesYes + StreamingTVYes + TechSupportYes + DeviceProtectionYes + OnlineBackupYes + OnlineSecurityYes + MultipleLinesYes + PhoneServiceYes,
               CountOfServices = (CountOfServices - min(CountOfServices))/ (max(CountOfServices) - min(CountOfServices)))

testing_data <-
        testing_data %>% 
        mutate(CountOfServices = StreamingMoviesYes + StreamingTVYes + TechSupportYes + DeviceProtectionYes + OnlineBackupYes + OnlineSecurityYes + MultipleLinesYes + PhoneServiceYes,
               CountOfServices = (CountOfServices - min(CountOfServices))/ (max(CountOfServices) - min(CountOfServices)))

# Create a survival object
surv_obj <- with(training_data, Surv(tenure, Churn_Yes == 1))

# Fit the Kaplan-Meier estimator
km_fit <- survfit(surv_obj ~ 1, data = training_data)

ggsurvplot(
  km_fit,
  title = "Kaplan-Meier Survival Curve",
  xlab = "\nTenure (normalized)",
  ylab = "Survival probability\n",
  palette = "#dc322f",
  conf.int = TRUE,
  risk.table = FALSE,
  ggtheme = theme_minimal()
)

# Fit the Cox Proportional Hazards Model
cox_fit <-
  coxph(
    surv_obj ~ ContractOne_year + ContractTwo_year + MonthlyCharges + CountOfServices,
    data = training_data
  )

# Display the model output
summary(cox_fit)

# Evaluating and Improving Your Churn Prediction Model ----

## Concordance test ----

# Compute the predicted risk scores for the testing set
testing_risk_scores <- predict(cox_fit, newdata = testing_data, type = "risk")

# Create a survival object for the testing set
testing_surv_obj <- with(testing_data, Surv(tenure, Churn_Yes == 1))

# Look at the concordance of the predicted churn on the testing set
testing_concordance <- concordance(testing_surv_obj ~ testing_risk_scores, reverse = TRUE)

testing_concordance

## Log-rank test ----

# Predicted risk scores
risk_scores <- predict(cox_fit, newdata = testing_data)

# Define groups based on the median risk score
group <- ifelse(risk_scores > median(risk_scores), "High risk", "Low risk")

# Create a survival object for the testing data
surv_obj <- with(testing_data, Surv(tenure, Churn_Yes == 1))

# Perform the Log-Rank test
survdiff(surv_obj ~ group)


# Load the timeROC package
library(timeROC)

# Get predicted risks for testing set
predicted_risks <- predict(cox_fit, newdata = testing_data, type = "risk")

auc <- timeROC(
        T = testing_data$tenure, 
        delta = as.numeric(testing_data$Churn_Yes == 1), 
        marker = predicted_risks, 
        cause = 1, 
        times = seq(0.1,0.9,0.2)
)

auc

# Integrating churn predictions into your business strategy ----

## Identifying high risk customers ----

# Predict churn probabilities for the testing set using the Cox model 
predicted_churn_probs <- predict(cox_fit, newdata = testing_data, type = "risk")

# Add the predicted probabilities to the testing set
testing_data$predicted_churn_prob <- predicted_churn_probs

# Identify the top 10% of high-risk customers
threshold <- quantile(testing_data$predicted_churn_prob, 0.9)
high_risk_customers <- testing_data[testing_data$predicted_churn_prob >= threshold, ]

high_risk_customers$customerID
