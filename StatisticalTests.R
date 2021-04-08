summary(league.table)

table(league.table$City)

table(league.table$Club)

table(league.table$Club, league.table$City)

# Chi Squared Test on Club and City
# Null Hypothesis: The variables are dependent
summary(table(league.table$Club, league.table$City))
# p-value > 0.05 : Fails to provide any evidence


# Quantile for number of goals scored with 5% probablity
quantile(league.table$GF, .05)

# Quantile for number of goals scored with 5% and 95% probablity
quantile(league.table$GF, c(.05, .95))

# Quantile for number of goals scored with an interval of 25% in the probabilties
quantile(league.table$GF)

# Converting Points to Z-Scores
scale(league.table$Pts)

# Using the t.test and asking if the mean of points can be 40
t.test(league.table$Pts, mu = 40)
# p-value <  0.05 so it's unlikely that mean is 40
# null hypothesis is rejected

# Using the t.test and asking if the mean of points can be 40 with a confidence level of 99%
t.test(league.table$Pts, conf.level = 0.99, mu = 40)
# p-value <  0.05 so it's unlikely that mean is 40
# null hypothesis is rejected

# Calculating the confidence interval for the median of points using the Wilcox Test
wilcox.test(league.table$Pts, conf.int = TRUE)

# Using the Shapiro Test for normality
shapiro.test(league.table$Pts)
# p-value > 0.05 so it's normally distributed

# Checking if the correlation between points and the number of wins is significant
cor.test(league.table$Pts, league.table$W)
# p-value < 0.05 so a significant correlation exists

# Checking if the correlation between points and the number of yellow cards is significant
cor.test(league.table$Pts, league.table$YC)
# p-value > 0.05 so a significant correlation does not exist

