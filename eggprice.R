require("readr")
require("ggplot2")

setwd('~/Downloads/Dhrumil R class')

egg_df = read_csv('US_Food_Price.csv')


ggplot(egg_df) +
  aes(x = Date, y = Price, 
      group = Item, 
      color = Item == "Eggs") + 
  geom_line(size = 1.5) +
  scale_color_manual(
    name = "Food Items",
    values = c("TRUE" = "orange", "FALSE" = "grey"),
    labels = c("TRUE" = "Eggs", "FALSE" = "Other food")
  ) +
  scale_x_date(limits = c(as.Date("2014-01-01"), NA)) +  
  labs(
    title = "Egg-streme Price Swings: The Wild Ride of Egg Prices",
    subtitle = "Average prices of staple foods in the US (in USD) over the past decade",
    y = "US dollars ($)",
    x = "",
    caption = "Source: USDA Economic Research Service |Data from 2014 - Present"
    ) + 
  theme_minimal() +
  theme (
    plot.title = element_text(size = 16, face = 'bold', family = 'Avenir', color = 'black'),
    plot.subtitle = element_text(size = 12, family = 'Avenir', color ='darkgrey'),
    plot.caption = element_text(hjust=0, size = 10, family = 'Avenir'),
    legend.title = element_text(size = 10, family = 'Avenir', color='black'),
    legend.text = element_text(size = 10, family = 'Avenir', color='black')
    )



