#------------------------------------
# DMC Analysis
# -----------------------------------

# Gives (BOOL) whether we want to offer a customer a discount
#   trxn_rate: transaction rate for customer per timeframe
#   est_amt_trxn: estimated amount customer will spend
#                 in transactions in the given timeframe
#                 (regardless of whether transactions occur)
do_offer_coupon <- function(trxn_rate, est_amt_trxn){
  return (1.0 - exp(-trxn_rate) - exp(-trxn_rate) * trxn_rate/2.0 > 3.0/(0.1 * est_amt_trxn + 8.0))
}

find_trxn_rate <- function(customer_id){
  return (length(build_auth_m216_copy[build_auth_m216_copy$acct_id_code == customer_id, ]$acct_id_code) / 4.0)
}

# Raw Data
# setwd("C:\\Users\\office\\Desktop\\uwdmc2014_files")
build_auth_m216_raw = read.csv("build_auth_m216.csv",header = T, sep = ",")
customer_zip_raw = read.csv("customer_zip.csv",header = T, sep = ",")
merchant_metrics_raw = read.csv("merchant_metrics.csv",header = T, sep = ",")
validation_auth_raw = read.csv("validation_auth.csv",header = T, sep = ",")

# Data Copies
build_auth_m216_copy <- build_auth_m216_raw
build_auth_m216_copy <- build_auth_m216_copy[build_auth_m216_copy$merchant_code == "M216", ] #filter merchant m216
build_auth_m216_copy <- build_auth_m216_copy[build_auth_m216_copy$internet_trxn == "0", ] #filter non-internet trxns
build_auth_m216_copy$merchant_code <- gsub("M", "", build_auth_m216_copy$merchant_code) #strip M from merchant code
build_auth_m216_copy$trxn_date <- floor((as.Date(build_auth_m216_copy$trxn_date, "%d%b%Y") - as.Date("01JUN2010", "%d%b%Y"))/30.5) #convert dates
customer_zip_copy <- customer_zip_raw
merchant_metrics_copy <- merchant_metrics_raw
validation_auth_copy <- validation_auth_raw
View(build_auth_m216_copy)
View(merchant_metrics_copy)

# Categorized data rows according to Super Industry Name
super_ind_names <- merchant_metrics_copy$Super_Industry_Name
super_ind_names.unique <- unique(super_ind_names) # unique super industry names

super_ind_names.new <- data.frame(super_ind_index=numeric(3975))
for (i in 1:length(super_ind_names)) {
  super_ind_names.new$super_ind_index[i] = match(super_ind_names[i], super_ind_names.unique)
}
View(super_ind_names.new)
merchant_metrics_merge <- merge(merchant_metrics_copy, super_ind_names.new, all.y=T) # Right join (default)
View(merchant_metrics_merge)

#validation_auth_copy <- validation_auth_raw
