library(ggplot2)

ggplot(orders_df, aes(x = CUSTOMER_ID, y = ORDER_ID)) + geom_point() + facet_wrap(~CUSTOMER_ID)
