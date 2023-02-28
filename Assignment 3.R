# Clear out Console and Environment
rm(list=ls(all=TRUE))
cat("\014")

library(tidyverse)

# ========================================================================
#                             German Credit Data, german_credit_data.csv
# ========================================================================
# When a bank receives a loan application the bank has to make a decision
# regarding whether to go ahead with the loan approval or not.
# The bank makes a decision on the loan based on the applicant’s profile.
# Two types of risks are associated with the bank’s decision –
#
# 1) If the applicant is a good credit risk, i.e. is likely to repay the loan,
# then not approving the loan to the person results in a loss of business to the bank
# 2) If the applicant is a bad credit risk, i.e. is not likely to repay the loan,
# then approving the loan to the person results in a financial loss to the bank\

# The objective of the German Credit Data is to minimize the chances of issuing
# risky loans to applicants while maximizing the chances of profiting from
# good loans. An applicant’s demographic and socio-economic profiles are
# considered by loan managers before a decision is taken regarding his/her loan application.

# The German Credit Data contains data on 20 variables and the classification
# whether an applicant is considered a Good or a Bad credit risk
# for 1000 loan applicants.
# Age (numeric)
# Sex (string: male, female)
# Job (numeric: 0 — unskilled and non-resident, 1 — unskilled and resident, 2 — skilled, 3 — highly skilled)
# Housing (string: own, rent, or free)
# Saving accounts (string — little, moderate, quite rich, rich)
# Checking account (string — little, moderate, rich)
# Credit amount (numeric, in DM — Deutschmark)
# Duration (numeric, in months)
# Purpose (text: car, furniture/equipment, radio/TV, domestic appliances, repairs, education, business, vacation/others)
# Risk (string — good, bad)
# ========================================================================
#                              Assignment 4
# ========================================================================

# Part a) create a scatter plot with Credit Amount on y-axis, 
# Duration of Credit on x-axis, and pass the factor 'Type of Housing' as facet. Place your code into the box below.
# ========================================================================

library(ggplot2)

df <- read.csv("/Users/drewmorse/Git Kraken /Intro-to-R-2ed/BIS-244-Spring-2023-MorseAndrew/gc.csv")
print(colnames(df))
my_plot <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(~ Housing)

plot(my_plot)


                            
# ========================================================================



# Part b) create a scatter plot with Credit Amount on y-axis, 
# Duration of Credit on x-axis, and pass the factor 'job' as facet. 
# Place your code into the box below.
# ========================================================================

my_plot2 <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(~ job)


# ========================================================================

# Part c) create a scatter plot with Credit Amount on y-axis, 
# Duration of Credit on x-axis, and pass the factors 'risk' and 'hosuing' as facets. Place your code into the box below.
# ========================================================================

my_plot3 <- ggplot(df, aes(x=Duration, y = Credit.amount)) + geom_point() + facet_wrap(risk ~ Housing)



# ========================================================================
