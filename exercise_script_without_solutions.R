###############################################################################################################
# This R script contains                                                                                      #
#  - the examples shown in the step-by-step workshop pages                                                    #
#    (for you to run line-by-line to observe the outcome, or to modify and play with)                         #
#  - space called 'YOUR TURN' for you to write your own code to answer the exercises from the workshop pages  #
###############################################################################################################

#~~~~~~~~~ Random Numbers Generators and sampling theory -----

# sample 

## x is a sequence
x <- 1:10
x
?sample # default: replace = FALSE
sample(x)
sample(x, replace = TRUE)
sample(letters, size = 10)
sample(x, size = 100, replace = TRUE)

## x is a vector of combined values
x <- c(1,5,8)
x
sample(x, size = 6, replace = TRUE)


# YOUR TURN: generate random numbers
## Sample 100 values between 3 and 103 with replacement



# random number generator drawing from specific distributions

?runif  # runif(n, min, max) 
?rpois  # rpois(n, lambda) 
?rnorm  # rnorm(n, mean, sd) 
?rbinom # rbinom(n, prob)	

# YOUR TURN: generate random numbers
## Draw 100 values from a normal distribution with a mean of 0 and a sd of 1


## Draw 50 values from a normal distribution with a mean of 10 and sd of 5


## Draw 1000 values from a poisson distribution with a lambda of 50


## Draw 30 values from a uniform distribution between 0 and 10




# repeat 

?replicate # replicate(n, expression)
rnorm(10)
mean(rnorm(10))
replicate(10,rnorm(10))
replicate(10, mean(rnorm(100)))
hist(replicate(10, mean(rnorm(100))))

# YOUR TURN: generate random numbers, repeat, and plot
## Replicate 1000 times the mean of 10 values drawn from a uniform distribution between 0 and 10  


## Replicate 100 times the mean of 50 values drawn from a normal distribution of mean 10 and standard deviation 5  




# set seed

hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))


# defining sample size within a replication (n) and the number of simulation/repeats/replication (nrep)
## single random sample of normal distribution N(0,1) with n = 10
set.seed(10)
x <- rnorm(10) # mean = 0, sd = 1 are the defaults
hist(x, breaks = 10, col = "grey", xlim = c(-4,4))
abline(v = 0, col = "red", lty = 2, lwd = 2)
abline(v = mean(x), col = "blue", lwd = 2)
par(xpd = TRUE) # turn off clipping of legend
# where a function has a long list of arguments, we can put them on a new line each
legend(
  0.9, 
  y = 1.5, 
  legend = c("mean(x)", "0"), 
  lty = c(1, 2), 
  col = c("blue","red")
)

## 24 sims of same distribution N(0,1) with n = 10
set.seed(10)
x24 <- replicate(24, rnorm(10))
par(mfrow = c(3,8), mar = c(0,0,0,0))
# apply is complicated because it takes a function as one of its arguments
x24Plot <- apply(
  x24,
  2,
  function(x) {
    # for fairly simple functions with lots of arguments, we sometimes just cram them all on the same line.
    # it's not great practice but it stops the script getting super long when dealing with graphical objects
    hist(x, col = "grey", xlim = c(-5,5), ylim = c(0,7), breaks = c(-5:5),
         main = "", ylab = "", xlab = "", xaxt = "n", yaxt = "n")
    abline(v = mean(x), col = "blue", lwd = 2)
    abline(v = 0, col = "red", lty = 2, lwd = 2)
  }
)

## distribution of means and SDs from 24 sims N(0,1) with n = 10
par(mfrow = c(1,2), mar = c(5,5,1,1))
hist(apply(x24, 2, mean), main = "Mean", col = "grey", xlim = c(-1,1))
abline(v = 0, col = "red", lty = 2, lwd = 2)
hist(apply(x24, 2, sd), main = "SD",col = "grey", xlim = c(0.6,1.4))
abline(v = 1, col = "red", lty = 2, lwd = 2)

## 24 sims of same distribution N(0,1) with n = 1000
set.seed(10)
x24b <- replicate(24, rnorm(1000))
par(mfrow = c(3,8), mar = c(0,0,0,0))
x24bPlot <- apply(
  x24b,
  2,
  function(x){
    hist(x, col = "grey", xlim = c(-5,5), ylim = c(0,500), breaks = c(-5:5),
         main = "", ylab = "", xlab = "", xaxt = "n", yaxt = "n")
    abline(v = mean(x), col = "blue", lwd = 2)
    abline(v = 0, col = "red", lty = 2, lwd = 2)
  }
)

## distribution of means and SDs from 24 sims N(0,1) with n = 1000
par(mfrow = c(1,2), mar = c(5,5,1,1))
hist(apply(x24b, 2, mean), main = "Mean",col = "grey", xlim = c(-1,1))
abline(v = 0, col = "red", lty = 2, lwd = 2)
hist(apply(x24b, 2, sd), main = "SD",col = "grey", xlim = c(0.6,1.4))
abline(v = 1, col = "red", lty = 2, lwd = 2)

## distribution of means and SDs from 1000 sims N(0,1) with n = 10
set.seed(10)
x1000 <- replicate(1000, rnorm(10))
par(mfrow = c(1,2), mar = c(5,5,1,1))
hist(apply(x1000, 2, mean), main = "Mean",col = "grey")
abline(v = 0, col = "red", lty = 2, lwd = 2)
hist(apply(x1000, 2, sd), main = "SD",col = "grey")
abline(v = 1, col = "red", lty = 2, lwd = 2)


#~~~~~~~~~ Functions -----

# writing a function
## function syntax:
## AwesomeFunctionName <- function(argument1, argument2,…){
##                                                         do stuff here
##                                                        }
## The last thing that appears in the 'do stuff here' section is the function's 
## "return value"

# YOUR TURN: write a function that takes input "nrep", replicates '(mean(rnorm(100)))'
# nrep times, and draws a histogram of the results



# YOUR TURN: modify your function
## to draw a histogram of nrep mean(rnorm(n)), where n is another input




#~~~~~~~~~ Simulating no effect and check alpha -----

# YOUR TURN: draw from the same normal distribution twice 
## and see if the sample differ from each other
## will they differ significantly in 5% of the nrep?
### Figure out how to do a t.test in R  
### Generate two vectors of 10 values drawn from N(0,1) and compare them with a t test  
### Figure out how to extract the p-value from that object (HINT use `str` or `names`)
### Write a function simT that generates two vectors of n random normals, compare them with a t test and return the p-value  
### Repeat with nrep = 20 and draw a histogram for n = 10
### Repeat with nrep = 100 and draw a histogram for n = 10    






##########################

#### repeat function for nrep = 1000 and various n (e.g. 10 and 100)







#~~~~~~~~~ Simulating an effect and check power -----

# we can calculate the power of a t.test for a given sample size using:
power.t.test(n = NULL, delta = 0.5, sd = 1, sig.level = 0.05, power = 0.8)
# the required sample size is 64 per group.

# YOUR TURN: Use your simulation skills to work out the power of a t-test for a given sample size through simulation.
## Write a function which:
### 1. Draws n values from a random normal distribution with mean 1, and another n values from a normal distribution with mean 2
### 2. Compares the means of these two samples with a t.test and extracts the p.value
## Then, use that function to replicate the function 1000 times using the parameters used in the power calculation above (that used the power.t.test function).
## Calculate the proportion of p-values that are <0.05




#~~~~~~~~~ Simulating for a preregistration  -----

# YOUR TURN: 
## Try to make a dataset that looks like this, using the 
## functions `data.frame()`, `sample()`, and `rnorm()`    

# smoking_status lung_cancer sex      age
# 1            Yes          No   M 12.67918
# 2            Yes         Yes   F 23.71397
# 3             No          No   M 28.87786
# 4            Yes          No   F 28.99327
# 5            Yes         Yes   F 30.41415
# 6             No          No   M 44.60615





# YOUR TURN:
## Run a logistic regression on the data with lung cancer as the outcome and
## adjusting for the other variables. 
## You could try something like:
## glm(lung_cancer ~ smoking_status, sex, age, family = binomial(link = "logit"), data = df)
## Why doesn't it work? Try to trouble shoot and get the code to work!

## HINT: are the variables the correct data type?
## HINT: once the model works, use summary() to look at the results



