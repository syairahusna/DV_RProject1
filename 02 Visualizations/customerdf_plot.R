library(ggplot2)

#customer_df  - state-city relationship - Fairfield exists in IA and NJ
ggplot(customer_df, aes(x = CUSTOMER_STATE, y = CUSTOMER_CITY)) + geom_point() 