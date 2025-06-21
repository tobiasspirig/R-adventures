# Load necessary library
library(ggplot2)

# View the first few rows of the dataset
head(mtcars)

# Convert 'cyl' (number of cylinders) to a factor
mtcars$cyl <- as.factor(mtcars$cyl)

# Create a new variable: power-to-weight ratio
mtcars$power_weight <- mtcars$hp / mtcars$wt

# Summary statistics by cylinder group
summary_stats <- aggregate(power_weight ~ cyl, data = mtcars, FUN = mean)
print(summary_stats)

# Visualize the relationship between horsepower and mpg
ggplot(mtcars, aes(x = hp, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Horsepower vs. MPG by Cylinder Count",
    x = "Horsepower",
    y = "Miles per Gallon (MPG)"
  ) +
  theme_minimal()
