# Multinomial Distribution Notes

# dmultinom(x=c(), prob=c())

dmultinom(x=c(1,6,8), prob=c(0.5,0.4,0.1))

# where x is a vector that represents the frequency of each outcome
# and prob is a vector that represents the probability of each outcome (the sum must be 1)

# Example 1 : In a three way election for mayor, Candidate A receives 10% of the votes, Cadidate B receives 40% of the votes, and Candidate C receives 50% of the votes.
# If we select a random sample of 10 votes, what is the probability that 2 voted for Candidate A, 4 voted for Candidate B, and 4 voted for Candidate C?

dmultinom(x=c(2,4,4), prob=c(0.1,0.4,0.5))

# Therefore the probability that 2 voted for Candidate A, 4 voted for Candidate B, and 4 voted for Candidate C is 5.4%


# Contingency Tables

# First, let's get some data. 
library(MASS)
Cars93$Type

# the table function tells us how many of each type of car we have:
table(Cars93$Type)
# prop.table converts it into fractions
prop.table(table(Cars93$Type))

# this is the same with the origin of cars :
table(Cars93$Origin)
prop.table(table(Cars93$Origin))

# Make a table using the table function with two arguments this time: the first will become the row variable, and the second will become the column variable

table(Cars93$Type, Cars93$Origin)


# Getting Marginals Form - Contingency Table
# use rowSums and colSums

tab1 <- table(Cars93$Type, Cars93$Origin)

rowSums(tab1)

# Compact   Large Midsize   Small  Sporty     Van 
# 16      11      22      21      14       9

colSums(tab1)

# USA non-USA 
# 48      45 

# Getting Percents from Contingency Table
# use prop.table nested with table

prop.table(table(Cars93$Type, Cars93$Origin))

# USA    non-USA
# Compact 0.07526882 0.09677419
# Large   0.11827957 0.00000000
# Midsize 0.10752688 0.12903226
# Small   0.07526882 0.15053763
# Sporty  0.08602151 0.06451613
# Van     0.05376344 0.04301075

# Conversion to Percents is just multiplication by 100:

prop.table(table(Cars93$Type, Cars93$Origin))*100

# USA   non-USA
# Compact  7.526882  9.677419
# Large   11.827957  0.000000
# Midsize 10.752688 12.903226
# Small    7.526882 15.053763
# Sporty   8.602151  6.451613
# Van      5.376344  4.301075


# Chi-Squared Test
# Are the row and column variables independent?
# Run a Chi-Squared Test!

chisq.test(Cars93$Type, Cars93$Origin)

# Warning message:
#   In chisq.test(Cars93$Type, Cars93$Origin) :
#   Chi-squared approximation may be incorrect