library(tidyverse)
library(modeldata)
View(crickets)

#Basic chart

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) +  
  geom_point()+
  labs(x = "Temperature",
       y = "Chirp Rate",
       title = "Cricket Chrips",
       color = "Species",
       caption = "source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2")
  
#Modifying basic properties of the plot

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) + 
geom_point(color = "red", size = 5, alpha = .3, shape = "square")+
  labs(x = "Temperature",
       y = "Chirp Rate",
       title = "Cricket Chrips",
       color = "Species",
       caption = "source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2")


#Adding another layer

ggplot(crickets, aes(x = temp, 
                     y = rate)) +  
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Temperature",
       y = "Chirp Rate",
       title = "Cricket Chrips",
       caption = "source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2")

ggplot(crickets, aes(x = temp, 
                     y = rate,
                     color = species)) +  
  geom_smooth(method = "lm", se = FALSE)+
  geom_point()+
  labs(x = "Temperature",
       y = "Chirp Rate",
       title = "Cricket Chrips",
       color = "Species",
       caption = "source: McDonald (2009)") +
  scale_color_brewer(palette = "Dark2")


#Other

ggplot(crickets, aes(x=rate)) +
  geom_histogram(bins = 15) #one quantitative

ggplot(crickets, aes(x=rate)) +
  geom_freqpoly(bins = 15) #one quantitative

ggplot(crickets, aes(x = species)) + geom_bar(color = "black",fill = "lightblue")

ggplot(crickets, aes(x=species, fill = species)) +
  geom_bar(show.legend = FALSE) +
  scale_fill_brewer()

#One quantitative and one categorical label

ggplot(crickets, aes(x = species,
                     y = rate,
                     color = species)) +
  geom_boxplot(show.legend = F) + scale_color_brewer(palette = "Dark2")+
  theme_minimal()

#faceting

ggplot(crickets, aes(x=rate,
                     fill = species)) +
  geom_histogram(bins = 15) +
  scale_fill_brewer(palette = "Dark2")

ggplot(crickets, aes(x=rate,
                     fill = species)) + 
  geom_histogram(bins = 15, show.legend = F) +
  facet_wrap(~species,
             ncol = 1)
  scale_fill_brewer(palette = "Dark2")
  

