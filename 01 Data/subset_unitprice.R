#create new subset   ORDER_DATE - SHIPPED_DATE - UNIT_PRICE - CUSTOMER_STATE
shipped_byunitprice <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "UNIT_PRICE", "CUSTOMER_STATE")]