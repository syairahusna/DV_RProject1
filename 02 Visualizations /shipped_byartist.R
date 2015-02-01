source("/DV_RProject1/01 Data/allcombine_df.R", echo = TRUE)

#create new subset   ORDER_DATE - SHIPPED_DATE - ARTIST - CUSTOMER_STATE
shipped_byartist <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "ARTIST", "CUSTOMER_STATE")]
shipped_byartist$ORDER_DATE <- as.Date(shipped_byartist$ORDER_DATE, format="%Y-%m-%d")
shipped_byartist$SHIPPED_DATE <- as.Date(shipped_byartist$SHIPPED_DATE, format="%Y-%m-%d")
class(shipped_byartist$ARTIST)

ggplot(shipped_byartist, aes(x=ORDER_DATE, y= SHIPPED_DATE)) + geom_point(aes(color=ARTIST)) + facet_wrap(~CUSTOMER_STATE)
