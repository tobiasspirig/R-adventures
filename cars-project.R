library(tidyverse)

data()
View(mpg)
glimpse(mpg)
filter(mpg, cty >= 20)

mpg_efficient <- filter(mpg, cty >= 20)
View(mpg_efficient)

mpg_ford <- filter(mpg, manufacturer == "ford")
View(mpg_ford)
mpg_metric <- mutate(mpg, cty_metric = cty*0.425144)
glimpse(mpg_metric)

mpg_metric <- mpg %>%
  mutate(cty_metric = cty*0.425144)

mpg %>% 
  group_by(class) %>% 
  summarise(mean(cty), 
            median(cty))


#Data viz with ggplot2

ggplot(mpg, aes(x=cty)) +
  geom_freqpoly() +
  labs(x = "City Mileage")

ggplot(mpg, aes(x=cty)) +
  geom_freqpoly() +
  geom_freqpoly() +
  labs(x = "City Mileage")

ggplot(mpg, aes(x = cty,
                y = hwy,
                color = class)) +
  geom_point() +
  scale_color_brewer(palette = "Dark2")
  