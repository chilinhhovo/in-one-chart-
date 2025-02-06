require("readr")
require("ggplot2")

setwd('~/Downloads/Dhrumil R class/in one chart ')

egg_df = read_csv('US_Food_Price.csv')


ggplot(egg_df) +
  aes(x = Date, y = Price, 
      group = Item, 
      color = (Item == "Eggs"),
      alpha = factor(Item == "Eggs"))+ 
  geom_line(size = 1.5) +
  scale_color_manual(
    name = "Food Items",
    values = c("TRUE" = "orange", "FALSE" = "grey"),
    labels = c("TRUE" = "Eggs", "FALSE" = "Other food")
  ) +
  scale_alpha_manual(
    values = c("TRUE" = 1, "FALSE" = 0.3),
    guide = "none"
  ) +
  scale_x_date(limits = c(as.Date("2014-01-01"), NA)) + 
  scale_y_continuous(limits = c(0, 6)) + 
  labs(
    title = "Egg-streme Price Swings: The Wild Ride of Egg Prices",
    subtitle = "Average prices of staple foods in the US (in USD) over the past decade",
    y = "",
    x = "",
    caption = "Source: USDA Economic Research Service | Data from 2014 - Present"
    ) + 
  theme_minimal() +
  theme (
    plot.title = element_text(size = 16, face = 'bold', family = 'Avenir', color = 'black'),
    plot.subtitle = element_text(size = 12, family = 'Avenir', color ='darkgrey'),
    plot.caption = element_text(hjust=0, size = 10, family = 'Avenir'),
    legend.title = element_text(size = 10, family = 'Avenir', color='black'),
    legend.text = element_text(size = 10, family = 'Avenir', color='black')
    ) + 
  annotate(
    geom = "curve",
    x = as.Date("2014-09-01"), y = 3.5,  
    xend = as.Date("2015-08-01"), yend = 3.1, 
    curvature = -0.3,
    arrow = arrow(length = unit(2, "mm")),  
    color = "orange",
    size = 1.0
  ) + 
  annotate(
    geom = "curve",
    x = as.Date("2022-02-01"), y = 5.5,  
    xend = as.Date("2022-12-01"), yend = 5.0, 
    curvature = -0.3,
    arrow = arrow(length = unit(2, "mm")),  
    color = "orange",
    size = 1.0
  )



