#------------------------------------
# DMC Analysis
# -----------------------------------

# Raw Data
# setwd("C:\\Users\\office\\Desktop\\uwdmc2014_files")
build_auth_m216_raw = read.csv("build_auth_m216.csv",header = T, sep = ",")
customer_zip_raw = read.csv("customer_zip.csv",header = T, sep = ",")
merchant_metrics_raw = read.csv("merchant_metrics.csv",header = T, sep = ",")
validation_auth_raw = read.csv("validation_auth.csv",header = T, sep = ",")

# Data Copies
build_auth_m216_copy <- build_auth_m216_raw
customer_zip_copy <- customer_zip_raw
merchant_metrics_copy <- merchant_metrics_raw
validation_auth_copy <- validation_auth_raw

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
