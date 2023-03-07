# api: Student performance in California schools

# The Academic Performance Index is computed for all California  schools based on standardised testing of students. The data sets  contain information for all schools with at least 100 students and  for various probability samples of the data. Please see the following website for the columns definitions:
  # https://www.rdocumentation.org/packages/survey/versions/4.1-1/topics/api 

## Details

# "apipop" is the entire population, 
# "apisrs" is a simple random sample, 
# "apiclus1" is a cluster sample of school districts, 
# "apistrat" is a sample stratified by stype, and 
# "apiclus2" is a two-stage cluster sample of schools within districts. 
# The sampling weights in apiclus1 are incorrect (the weight should be 757/15) but are as obtained from UCLA.

# Assignment 4
# To use the "apipop" dataframe please run the following syntaxes. The dataframe for all parts is "apipop".
# ========================================================================
library(tidyverse)
library(survey)
data(api)

# ========================================================================

## Part a) 
# create a bar plot to show the number of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================
counts <- table(apipop$'stype')

ggplot(data = data.frame(counts), aes(x = Var1, y = counts)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  ggtitle("Number of Schools by School Type in California") +
  xlab("School Type") +
  ylab("Number of Schools")


# ========================================================================

## Part b) 
# create a bar plot to show the percentage of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================
counts <- prop.table(table(apipop$'stype')) * 100

# Create the bar plot
ggplot(data = data.frame(counts), aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  ggtitle("Percentage of Schools by School Type in California") +
  xlab("School Type") +
  ylab("Percentage of Schools")

# ========================================================================

## Part c) 
# create a bar plot to show the number of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  
# ========================================================================
counts <- table(apipop$'stype', apipop$'awards')

df_counts <- data.frame(counts)
colnames(df_counts) <- c("stype", "awards", "Count")

ggplot(data = df_counts, aes(x = stype, y = Count, fill = awards)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Number of Schools by Eligibility and School Type in California") +
  xlab("School Type") +
  ylab("Number of Schools") +
  scale_fill_discrete(name = "Eligible for awards program", labels = c("No", "Yes"))

# ========================================================================

## Part d) 
# create a bar plot to show the percentage of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  

# ========================================================================
counts <- prop.table(table(apipop$'stype', apipop$'awards'), margin = 1) * 100

df_counts <- data.frame(counts)
colnames(df_counts) <- c("stype", "awards", "Percentage")

ggplot(data = df_counts, aes(x = stype, y = Percentage, fill = awards)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("Percentage of Schools by Eligibility and School Type in California") +
  xlab("School Type") +
  ylab("Percentage of Schools") +
  scale_fill_discrete(name = "Eligible for awards program", labels = c("No", "Yes"))


# ========================================================================

## Part e) 
# use facet to create two histogram to show the distributions of the "number of students enrolled" in all school whether are "Eligible for awards program" or not (bins=30).
# ========================================================================
ggplot(data = apipop, aes(x = enroll, fill = awards)) +
  geom_histogram(binwidth = 30, alpha = 0.5, position = "identity") +
  ggtitle("Distribution of Number of Students Enrolled in California Schools") +
  xlab("Number of Students Enrolled") +
  ylab("Count") +
  facet_wrap(~ 'awards', ncol = 2)

# ========================================================================
