#create new subset   ORDER_DATE - SHIPPED_DATE - TITLE - CUSTOMER_STATE
shipped_bytitle <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "TITLE", "CUSTOMER_STATE")]