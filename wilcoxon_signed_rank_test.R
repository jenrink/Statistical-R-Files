# Wilcoxon Test in RStudio

# Two data samples are matched if they come from repeated observations of the same subject. Using the Wilcoxon Signed-Rank Test, we can decide whether the corresponding data population distributions are identical without assuming them to follow the normal distribution.

# In the built-in data set named immer, the barley yield in years 1931 and 1932 of the same field are recorded. The yield data are presented in the data frame columns Y1 and Y2.

library(MASS)       #load the MASS package

head(immer)

#   Loc Var    Y1    Y2
# 1  UF   M  81.0  80.7
# 2  UF   S 105.4  82.3
# 3  UF   V 119.7  80.4
# 4  UF   T 109.7  87.2
# 5  UF   P  98.3  84.2
# 6   W   M 146.6 100.4

# PROBLEM: Without assuming the data to have normal distribution, test at .05 significance level if the barley yields of 1931 and 1932 in data set immer have identical data distributions.

wilcox.test(immer$Y1, immer$Y2, paired=TRUE)

# Wilcoxon signed rank test with continuity correction
# 
# data:  immer$Y1 and immer$Y2
# V = 368.5, p-value = 0.005318
# alternative hypothesis: true location shift is not equal to 0
# 
# Warning message:
#   In wilcox.test.default(immer$Y1, immer$Y2, paired = TRUE) :
#   cannot compute exact p-value with ties


# ANSWER: At .05 significance level, we conclude that the barley yields of 1931 and 1932 from the data set immer are nonidentical populations.