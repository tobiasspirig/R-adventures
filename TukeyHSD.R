
scratch1$swellingtime <- as.factor(scratch1$swellingtime)
table <- aov(scratch1$Sw ~ scratch1$swellingtime, data = scratch1)
summary(table)
TukeyHSD(table)

