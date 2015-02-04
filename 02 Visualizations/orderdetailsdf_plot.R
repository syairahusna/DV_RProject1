library(ggplot2)

#count of each items ordered (name of items are unknown)
ggplot(order_details_df) + geom_histogram(aes(x = ITEM_ID), binwidth = 1, colour = "purple", fill = "white" )