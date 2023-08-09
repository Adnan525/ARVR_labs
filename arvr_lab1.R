View(flights)

df <- flights

df$combinedDest <- sprintf("%.2f:%.2f", df$dest_lat, df$dest_long)

library(dplyr)
q2 <- df %>% 
  group_by(combinedDest) %>% 
  summarise(total_count = n())

q2 <- arrange(q2, desc(total_count))

top10 <- q2[1:10, ]

# test
testArr <- top10$combinedDest
#df[df["origin_lat"].str.contains]

q5 <- filter(df, combinedDest %in% testArr)
q5 <- q5[,-5]

globejs(lat = q5$dest_lat, long = q5$dest_long, arcs = q5)

