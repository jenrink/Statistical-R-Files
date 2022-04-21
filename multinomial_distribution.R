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



# ----- Homework Chapter 5 Applications -----#

# 5.122 : The weights of a population of mice fed on a certain diet since birth are assumed to be normally distributed with μ = 100 and σ = 20 (measurement in grams). Suppose that a random sample of n = 4 mice is taken from this population. Find the probability that
# a) exactly two weigh between 80 and 100 grams and exactly one weighs more than 100 grams.
# b) all four mice weigh more than 100 grams.

pnorm(100, 100, 20)   # P(X > 100) = 0.5
pnorm(100, 100, 20) - pnorm(80, 100, 20)    # P(80 < X < 100) = 0.3413447
# P(X < 80) = 1-0.5-0.3413447 = 0.1586553
probabilities <- c(0.5, 0.3413447, 0.1586553)

dmultinom(x=c(1,2,1), prob=probabilities)
# 0.1109155

# Therefore, the probability that exactly two weigh between 80 and 100 grams and exactly one weighs more than 100 grams is 11.1%.


# 5.123 : The National Fire Incident Reporting Service stated that, among residential fires, 73% are in family homes, 20% are in apartments, and 7% are in other types of dwellings. If four residential fires are independently reported on a single day, what is the probability that two are in family homes, one is in an apartment, and one is in another type of dwelling?

probabilities2 <- c(0.73, 0.2, 0.07)

dmultinom(x=c(2,1,1), prob=probabilities2)
# 0.0895272

# Therefore, the probability that two are in family homes, one is in an apartment, and one is in another type of dwelling is 8.95%.