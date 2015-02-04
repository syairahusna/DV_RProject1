ggplot(shipped_byartist, aes(x=as.Date(ORDER_DATE, "%Y-%m-%d"), y= as.Date(SHIPPED_DATE, "%Y-%m-%d"))) + geom_point(aes(color=as.factor(ARTIST))) + facet_wrap(~CUSTOMER_STATE)
