#------------------------------------
# DMC Analysis
# -----------------------------------

# Raw Data
build_auth_m216_raw = read.csv("build_auth_m216.csv",header = T, sep = ",")
customer_zip_raw = read.csv("customer_zip.csv",header = T, sep = ",")
merchant_metrics_raw = read.csv("merchant_metrics.csv",header = T, sep = ",")
validation_auth_raw = read.csv("validation_auth.csv",header = T, sep = ",")

# Data Copies
build_auth_m216_copy <- build_auth_m216_raw
customer_zip_copy <- customer_zip_raw
merchant_metrics_copy <- merchant_metrics_raw
validation_auth_copy <- validation_auth_raw