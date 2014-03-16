# Reading and attach the data
Initial.raw = read.csv("build_auth_total_trxn_amt_group_by_industry.csv", header = T) # Change the file name accordingly
Initial.copy <- Initial.raw
attach(Initial.copy)

# Initial analysis based on super industry, month of the year,
# average transaction frequency of the merchant and average
# spending amount of the customers of the merchant
model1 = lm(total_amount ~ Super_Industry_Code + log(total_trxn_frequency) # Fitting Linear models, ask me if don't know how it works
#Summary
summary(model1)

# The summary shows that the month is not a significant predictor
# on how much the custormer will spend

# Some graphs
# Residual plot
plot(model1$resid)
qqnorm(model1$resid)
qqline(model1$resid)
