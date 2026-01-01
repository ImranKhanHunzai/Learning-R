# This R script loads quarterly sales data (Q1, Q2, Q3, Q4) from CSV files, combines them into a 
# single dataset, and performs basic data processing for analysis. Each CSV contains Customer_ID 
# and Sales_Amount values. The script uses read.csv() to import files and rbind() to append rows 
# from all four quarters into one consolidated sales dataset. It then applies a conditional check 
# using ifelse() to categorize sales performance by labeling records as "High Values" for sales 
# above 2000 and "Regular" for all others. Finally, head() is used to preview the top records. 
# This program is useful for data analysis, reporting, business intelligence, and financial 
# insights, especially when working with multiple period-based datasets in R.

# load sales files into  variables
Q1 = read.csv("Q1_Sales.csv")
Q2 = read.csv("Q2_Sales.csv")
Q3 = read.csv("Q3_Sales.csv")
Q4 = read.csv("Q4_Sales.csv")

#append rows of quarterly sales.
total_sales = rbind(Q1, Q2, Q3, Q4)
head(total_sales) #sh0w top 5 rows using Head function
total_sales$Value <- ifelse(total_sales$Sales_Amount>2000,"High Values", "Regular")
head(total_sales)
