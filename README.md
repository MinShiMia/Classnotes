# EPPS 7V81 Advanced Data Programming_Final Project

This is the web page to show my final project for course EPPS 7V81.

In this project, I will explore the impact of the US-China trade war on US economy. This paper is formulated as a data science 
research using the data programming skills and modeling methods I have learned in classes.

The dataset for this paper is generated from multiple sources. The timeline of the dataset is from January 2018 to February 2020.
You could find the datasets in the data file.

To replicate the results, you could refer to the python and R code in codes files. With python, I use pandas and NumPy packages 
to import the multiple datasets into one Jupyter notebook, clean datasets separately, then merge the six datasets into one dataset 
for further research. Then, I use matplotlib package to visualize the tendency of the nine DVs following the timeline, then use scatter 
plots with regression lines to show the relationships among the DVs and independents variables. With RStudio, I use VIF values to 
test whether there is multicollinearity between the two independent variables (IVs).  Since there does exist multicollinearity 
between these two IVs, I build linear regression models for the two IVs separately to find if there is linear relationship existed, 
then I build ridge regression models to further interpret the accurate relationships. In the last process, I will combine both the 
tables gotten in RStudio and graphs gotten via python to testify the hypotheses.

The hypotheses in this paper are as follows:
        Hypothesis 1:  The US-China trade war could reduce the US trade deficit.
        Hypothesis 2:  The US-China trade war could harm US economic development generally.


The variables are as follows:
Independent Variables -- US Trade Tariff, China Trade Tariff
Dependent Variables -- US International Exports in Goods and Services, US International Imports in Goods and Services, US International Trade Balance in Goods and Services,
US Exports with China, US Imports with China, US Trade Balance with China, US Gross Domestic Product (GDP), US Unemployment Rate, 
and US Consumer Price Index (CPI).

