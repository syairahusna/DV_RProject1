source("/DV_RProject1/01 Data/allcombine_df.R", echo = TRUE)

#create new subset   ORDER_DATE - SHIPPED_DATE - TITLE - CUSTOMER_STATE
shipped_bytitle <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "TITLE", "CUSTOMER_STATE")]
shipped_bytitle$ORDER_DATE <- as.Date(shipped_bytitle$ORDER_DATE, format="%Y-%m-%d")
shipped_bytitle$SHIPPED_DATE <- as.Date(shipped_bytitle$SHIPPED_DATE, format="%Y-%m-%d")

ggplot(shipped_bytitle, aes(x=ORDER_DATE, y= SHIPPED_DATE)) + geom_point(aes(color=TITLE)) + facet_wrap(~CUSTOMER_STATE)