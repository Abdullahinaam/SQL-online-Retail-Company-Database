# EDA and Feature Engineering

A hands-on project covering **Exploratory Data Analysis (EDA)** and **Feature Engineering** — the essential steps for turning raw, messy data into a clean, model-ready dataset.

## 📋 Overview

This repository walks through the process of understanding a dataset, identifying patterns and issues, and transforming raw features into useful inputs for machine learning models. It's intended both as a learning resource and as a reusable reference workflow.

## 🔍 What's Covered

- **Data Loading & Inspection** — reading the dataset and understanding its structure, shape, and data types
- **Exploratory Data Analysis (EDA)**
  - Summary statistics and measures of central tendency
  - Univariate, bivariate, and multivariate analysis
  - Data visualization (histograms, box plots, scatter plots, correlation heatmaps, etc.)
  - Identifying missing values, duplicates, and inconsistencies
- **Feature Engineering**
  - Handling missing data (imputation strategies)
  - Outlier detection and treatment
  - Encoding categorical variables (One-Hot Encoding, Label Encoding, etc.)
  - Feature scaling (Standardization, Normalization)
  - Creating new features from existing ones
  - Feature selection techniques

## 🛠️ Tech Stack

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn





## 🚀 Getting Started

### Prerequisites

Make sure you have Python 3.x installed, then install the required libraries:

```bash
pip install -r requirements.txt
```

Or install manually:

```bash
pip install pandas numpy matplotlib seaborn scikit-learn jupyter
```

### Usage

1. Clone the repository
   ```bash
   git clone https://github.com/Abdullahinaam/EDA-and-Feature-Engineering.git
   cd EDA-and-Feature-Engineering
   ```
2. Launch Jupyter Notebook
   ```bash
   jupyter notebook
   ```
3. Open the notebook(s) and run the cells step by step.

# 1: 📊 Dataset

- IN FLIGHT PRICE ANALYSIS we used flight_price.xlsx  data set avaliable on kaggles official website.

## 📈 Key Insights
The aim of our study is to answer the below research questions:
a) Does price vary with Airlines?
b) How is the price affected when tickets are bought in just 1 or 2 days before departure?
c) Does ticket price change based on the departure time and arrival time?
d) How the price changes with change in Source and Destination?
e) How does the ticket price vary between Economy and Business class?

The various features of the cleaned dataset are explained below:
1) Airline: The name of the airline company is stored in the airline column. It is a categorical feature having 6 different airlines.
2) Flight: Flight stores information regarding the plane's flight code. It is a categorical feature.
3) Source City: City from which the flight takes off. It is a categorical feature having 6 unique cities.
4) Departure Time: This is a derived categorical feature obtained created by grouping time periods into bins. It stores information about the departure time and have 6 unique time labels.
5) Stops: A categorical feature with 3 distinct values that stores the number of stops between the source and destination cities.
6) Arrival Time: This is a derived categorical feature created by grouping time intervals into bins. It has six distinct time labels and keeps information about the arrival time.
7) Destination City: City where the flight will land. It is a categorical feature having 6 unique cities.
8) Class: A categorical feature that contains information on seat class; it has two distinct values: Business and Economy.
9) Duration: A continuous feature that displays the overall amount of time it takes to travel between cities in hours.
10)Days Left: This is a derived characteristic that is calculated by subtracting the trip date by the booking date.
11) Price: Target variable stores information of the ticket price.


# 2: 📊 Dataset
- In 2nd project we used google playstore  dataset
link: https://raw.githubusercontent.com/krishnaik06/playstore-Dataset/main/googleplaystore.csv

## 📈 Key Insights

Performed EDA and feature engineering on 10,841 records with 20 features, including data cleaning and missing-value treatment.
Analyzed app categories, ratings, reviews, and installations to identify key trends and patterns.
Answered business-driven questions such as most popular categories, top-rated apps, and most-installed apps.
Created visualizations using bar charts, pie charts, histograms, KDE plots, and distribution plots to communicate insights.

# 3: Dataset 
-In 2nd project we used wine quality   dataset
Data Set Information:

link: https://archive.ics.uci.edu/dataset/186/wine+quality
 -> UCI machine learning repository

This dataset is related to red variant of the Portuguese "Vinho Verde" wine.  Due to privacy and logistic issues, only physicochemical (inputs) and sensory (the output) variables are available (e.g. there is no data about grape types, wine brand, wine selling price, etc.).

These datasets can be viewed as classification or regression tasks. The classes are ordered and not balanced (e.g. there are many more normal wines than excellent or poor ones). Outlier detection algorithms could be used to detect the few excellent or poor wines. Also, we are not sure if all input variables are relevant. So it could be interesting to test feature selection methods.


Attribute Information:

Input variables (based on physicochemical tests):
- 1 - fixed acidity
- 2 - volatile acidity
- 3 - citric acid
- 4 - residual sugar
- 5 - chlorides
- 6 - free sulfur dioxide
- 7 - total sulfur dioxide
- 8 - density
- 9 - pH
- 10 - sulphates
- 11 - alcohol

Output variable (based on sensory data):
- 12 - quality (score between 0 and 10)

**Abdullah Inaam**
GitHub: [@Abdullahinaam](https://github.com/Abdullahinaam)
