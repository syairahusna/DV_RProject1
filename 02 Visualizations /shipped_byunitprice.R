source("/DV_RProject1/01 Data/allcombine_df.R", echo = TRUE)

#create new subset   ORDER_DATE - SHIPPED_DATE - UNIT_PRICE - CUSTOMER_STATE
shipped_byunitprice <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "UNIT_PRICE", "CUSTOMER_STATE")]
shipped_byunitprice$ORDER_DATE <- as.Date(shipped_byunitprice$ORDER_DATE, format="%Y-%m-%d")
shipped_byunitprice$SHIPPED_DATE <- as.Date(shipped_byunitprice$SHIPPED_DATE, format="%Y-%m-%d")
shipped_byunitprice$UNIT_PRICE <- as.factor(shipped_byunitprice$UNIT_PRICE)
