library(ggplot2)

ggplot(items_df, aes(x = ARTIST, y = UNIT_PRICE)) + geom_point()