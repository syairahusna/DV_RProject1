source("../01 Data/created_dataframe.R", echo = TRUE)

#produce plot for each data frame

#customer_df  - state-city relationship - Fairfield exists in IA and NJ
ggplot(customer_df, aes(x = CUSTOMER_STATE, y = CUSTOMER_CITY)) + geom_point() 

#items_df
ggplot(items_df, aes(x = UNIT_PRICE, y = TITLE)) + geom_point()

ggplot(items_df, aes(x = ARTIST, y = TITLE)) + geom_point()

#order_details_df 
#count of each items ordered (name of items are unknown)
ggplot(order_details_df) + geom_histogram(aes(x = ITEM_ID), binwidth = 1, colour = "purple", fill = "white" )

# How many different items ordered by each Order_ID 
ggplot(order_details_df, aes(x = ORDER_ID, y = ITEM_ID)) + geom_point()

#orders_df 
#no need aes(color=CUSTOMER_ID ) because each customer_id is unique, non-continuous
ggplot(orders_df, aes(x = CUSTOMER_ID, y = ORDER_ID)) + geom_point() + facet_wrap(~CUSTOMER_ID)
