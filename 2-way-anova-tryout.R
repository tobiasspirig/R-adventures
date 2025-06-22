#install.packages("car")

# Load package
library(car)

# Create the full dataset
Condition <- factor(rep(c("water", "PBS", "sucrose"), each = 9))
Hydrogel <- factor(rep(c("A", "A", "A", "B", "B", "B", "C", "C", "C"), times = 3))
Swelling <- c(
  0.12, 0.14, 0.2, 0.1, 0.07, 0.11, 0.9, 1.1, 1.2,        # water
  0.001, 0.001, 0.002, 0.001, 0.005, 0.004, 0.001, 0.006, 0.003,  # PBS
  0.14, 0.17, 0.19, 0.09, 0.07, 0.01, 1.1, 1.5, 2.3        # sucrose
)

# Create data frame
data_all <- data.frame(Condition, Hydrogel, Swelling)

# Step 2: Run two-way ANOVA with interaction
anova_two_way <- aov(Swelling ~ Condition * Hydrogel, data = data_all)
summary(anova_two_way)

# Step 3: Tukey HSD post-hoc test (for main effects and interaction)
TukeyHSD(anova_two_way)

# Step 4: Assumptions Checking
# Residuals vs Fitted (homoscedasticity)
plot(anova_two_way, which = 1)

# Q-Q Plot (normality)
plot(anova_two_way, which = 2)

# Levene’s Test for equal variances
leveneTest(Swelling ~ Condition * Hydrogel, data = data_all)
