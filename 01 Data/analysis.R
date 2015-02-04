require(RCurl)
require(ggplot2)

# create data frame
customer_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT * FROM customers"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

items_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT * FROM items"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

order_details_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT * FROM order_details"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

orders_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="SELECT * FROM orders"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# displaying the details about each data frame - vectors, levels etc.

head(customer_df)

head(items_df)

head(order_details_df)

head(orders_df)

#check details of items_df's column "Title" - see all it's levels
class(items_df[[2]])

items_df[[2]]

#produce plot for each data frame

#customer_df  - state-city relationship - Fairfield exists in IA and NJ
ggplot(customer_df, aes(x = CUSTOMER_STATE, y = CUSTOMER_CITY)) + geom_point() 

#items_df
#ggplot(items_df, aes(x = UNIT_PRICE, y = TITLE)) + geom_point()

#ggplot(items_df, aes(x = ARTIST, y = TITLE)) + geom_point()

ggplot(items_df, aes(x = ARTIST, y = UNIT_PRICE)) + geom_point()

#order_details_df 
#count of each items ordered (name of items are unknown)
ggplot(order_details_df) + geom_histogram(aes(x = ITEM_ID), binwidth = 1, colour = "purple", fill = "white" )

# How many different items ordered by each Order_ID 
#ggplot(order_details_df, aes(x = ORDER_ID, y = ITEM_ID)) + geom_point()

#orders_df 
#no need aes(color=CUSTOMER_ID ) because each customer_id is unique, non-continuous
head(orders_df)
ggplot(orders_df, aes(x = CUSTOMER_ID, y = ORDER_ID)) + geom_point() + facet_wrap(~CUSTOMER_ID)


#orsh_customerID <- orders_df[,c("ORDER_DATE", "SHIPPED_DATE", "CUSTOMER_ID")]
#orsh_customerID$ORDER_DATE <- as.Date(orsh_customerID$ORDER_DATE, format="%Y-%m-%d")
#orsh_customerID$SHIPPED_DATE <- as.Date(orsh_customerID$SHIPPED_DATE, format="%Y-%m-%d")
#head(orsh_customerID)

#ggplot(orsh_customerID, aes(x = ORDER_DATE, y = SHIPPED_DATE)) + geom_point() + facet_wrap(~CUSTOMER_ID)




# Create a data frame for the entire data set.
combine_df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders o join customers c on o.customer_id = c.customer_id join order_details d on o.order_id = d.order_id join items i on d.item_id = i.item_id"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))


#create new subset   ORDER_DATE - SHIPPED_DATE - UNIT_PRICE - CUSTOMER_STATE
shipped_byunitprice <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "UNIT_PRICE", "CUSTOMER_STATE")]
shipped_byunitprice$ORDER_DATE <- as.Date(shipped_byunitprice$ORDER_DATE, format="%Y-%m-%d")
shipped_byunitprice$SHIPPED_DATE <- as.Date(shipped_byunitprice$SHIPPED_DATE, format="%Y-%m-%d")
shipped_byunitprice$UNIT_PRICE <- as.factor(shipped_byunitprice$UNIT_PRICE)

ggplot(shipped_byunitprice, aes(x=ORDER_DATE, y= SHIPPED_DATE)) + geom_point(aes(color=UNIT_PRICE)) + facet_wrap(~CUSTOMER_STATE)

#create new subset   ORDER_DATE - SHIPPED_DATE - TITLE - CUSTOMER_STATE
shipped_bytitle <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "TITLE", "CUSTOMER_STATE")]
shipped_bytitle$ORDER_DATE <- as.Date(shipped_bytitle$ORDER_DATE, format="%Y-%m-%d")
shipped_bytitle$SHIPPED_DATE <- as.Date(shipped_bytitle$SHIPPED_DATE, format="%Y-%m-%d")

ggplot(shipped_bytitle, aes(x=ORDER_DATE, y= SHIPPED_DATE)) + geom_point(aes(color=TITLE)) + facet_wrap(~CUSTOMER_STATE)



#create new subset   ORDER_DATE - SHIPPED_DATE - ARTIST - CUSTOMER_STATE
shipped_byartist <- combine_df[,c("ORDER_DATE", "SHIPPED_DATE", "ARTIST", "CUSTOMER_STATE")]
shipped_byartist$ORDER_DATE <- as.Date(shipped_byartist$ORDER_DATE, format="%Y-%m-%d")
shipped_byartist$SHIPPED_DATE <- as.Date(shipped_byartist$SHIPPED_DATE, format="%Y-%m-%d")
class(shipped_byartist$ARTIST)

ggplot(shipped_byartist, aes(x=ORDER_DATE, y= SHIPPED_DATE)) + geom_point(aes(color=ARTIST)) + facet_wrap(~CUSTOMER_STATE)











