#create new subset   ORDER_DATE - SHIPPED_DATE - ARTIST - CUSTOMER_STATE
shipped_byartist <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "ARTIST", "CUSTOMER_STATE")]