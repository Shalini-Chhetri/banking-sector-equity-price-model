# Predicting Equity Prices in the Banking Industry

**Robust Regression Modeling | Financial Ratio Analysis | Cross-Sectional Study**

This project develops a statistical model to predict the equity prices of banks using firm-level financial data from the year 2022. The analysis applies robust linear regression using R to evaluate how Earnings Per Share (EPS), Book Value Per Share (BVPS), Current Ratio (CR), and Debt-to-Asset Ratio (DTA) influence stock price. The project is based on a cross-sectional dataset of 104 publicly listed banks.

---

## Project Objective

To identify key financial ratios that explain the variation in stock prices across banks and develop a predictive model to quantify their effects.

---

## Tools and Technologies Used

- **Programming Language**: R
- **R Packages**: dplyr, ggplot2, tidyverse, readxl, robustbase, broom, quantmod, moments
- **Statistical Techniques**:
  - Histogram and scatterplot visualization
  - Descriptive statistics
  - Correlation matrix
  - Robust linear regression modeling
  - Residual diagnostics

---

## Methodology

- **Data Source**: Secondary financial data for 104 U.S. banks (2022)
- **Variables**:
  - `Price`: Stock price (dependent variable)
  - `EPS`: Earnings per share
  - `BVPS`: Book value per share
  - `CR`: Current ratio
  - `DTA`: Debt-to-asset ratio
- **Model Specification**:
  - Equation:  
    `Price = 4.452 + 4.604 * EPS + 0.623 * BVPS + 1.825 * CR - 0.409 * DTA`
  - R² (adjusted): 0.55 (55% of variation in stock prices explained by the model)

---

## Key Findings

- **EPS and BVPS** are strongly and positively correlated with price, and both are statistically significant predictors.
- **DTA** has a moderate negative relationship with price and is also statistically significant.
- **CR** shows a weak positive relationship and is not a strong predictor in this model.
- **Residuals** are centered around zero and roughly normally distributed, indicating that the model is a reasonable fit.

---

## Visualizations Included

- Histograms for all variables
- Scatterplots of each independent variable vs. price
- Residual histogram and predicted vs. actual price plot

---

## Repository Contents

- `Banking_Industry_Equity_Model.pdf` – Full report with methodology, results, and interpretation
- `README.md` – Project overview and documentation
- `Banking_Industry_Equity_Model.R` – R script used to perform the analysis 
---

## License and Usage

This project is shared for academic and portfolio purposes only.  
Please do not copy, reuse, or distribute any portion of this work without permission.

---

## About

**Shalini Chhetri**  
MS in Business Analytics  
The Tobin College of Business,St John's University
,Queens, NY
