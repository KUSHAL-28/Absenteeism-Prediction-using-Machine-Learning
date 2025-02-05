# Absenteeism Prediction using Machine Learning

## Abstract
This project utilizes the Absenteeism at work dataset for a courier company in Brazil with qualitative and quantitative attributes. The input data is preprocessed and predictive analysis is done using a Logistic Regression model. The predicted outputs are stored in a MySQL database, and a Dashboard is designed in Tableau for qualitative analysis on inferred outputs. The entire process is automated and stored as a Python module.

## Dataset
**Absenteeism at work Dataset**

The database was created with records of absenteeism at work from July 2007 to July 2010 at a courier company in Brazil.

**Input Attributes**: 11 | **Output Attributes**: 1

It contains attributes like identification ID, reason for absence (stratified into 21 + 5 categories), month of absence, day of the week (Monday (2), Tuesday (3), Wednesday (4), Thursday (5), Friday (6)), seasons (summer (1), autumn (2), winter (3), spring (4)), transportation expense, distance to work (kilometers),Age, Daily Work Load Average, hit target, disciplinary failure (yes=1; no=0), education (high school (1), graduate (2), postgraduate (3), master and doctor (4)), number of children, number of pets, Body mass index, absenteeism time in hours (target).


## Data Preprocessing
1. Dropped ID column
2. Generated encodings dataframe for reason of absence (`pd.get_dummies()`) considering only 1 reason provided & dropped 0th reason
3. Removed `reason_for_absence` column from initial dataset
4. Separated reasons into 4 groups
5. Concatenated grouped reasons with initial dataframe
6. Converted date to datetime format
7. Extracted month & weekday from date & dropped date column
8. Encoded education column

## Methodology
- Selected extreme absenteeism by extracting those values whose median absenteeism is > 3 hours as target.
- Dropped the output target variable, distance to work, daily workload average, and day of the week from dataframe.
- Scaled the column values except reasons & education (already encoded).
- Applied train-test split on input dataframe in 80:20 ratio.
- Applied Logistic Regression model and calculated intercepts and coefficients for each feature.

**Input dataframe**: Scaled dataframe excluding target output variable  
**Output**: Calculated absenteeism in hours of employees

## Processing
- Saved the model by pickling the model and scaler files

## Folder Structure
- Jupyter Notebook: Data Preprocessing & Machine Learning
- Model Snapshots: Model & Scaler Weights
- MySQL Database

## Python Module
- Consists of entire data preprocessing and prediction part for new test data
  - Class `CustomScaler`: Fit & transformed for scaling new test data
  - Class `AbsenteeismModel`: Loaded dataset for same preprocessing techniques as for train data, predicted absenteeism in hours

## Integration
- Loaded the python module and created an instance for model weights
- Passed the new test data to the python module and got the predictions
- Imported `pymysql` library to connect Python with the MySQL database
- Created database outline structure within the MySQL Workbench for different features with their datatype
- Executed all the SQL `INSERT INTO` statements to insert all the predicted values by Python module into the database using a FOR loop

## Tableau Visualization
- Connected the MySQL database with Tableau and extracted the stored database to Tableau workbench
- Plotted three important visualizations:
  - Age vs Probability
  - Reasons vs Probability
  - Transportation Expense vs Probability
<img width="493" alt="{71DD64BA-315A-496D-B938-847C82D480A0}" src="https://github.com/user-attachments/assets/e1b25f7c-f6f7-4d34-bf7d-42cfad46a108" />

