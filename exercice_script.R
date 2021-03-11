###############################################################################################################
# This R script contains                                                                                      #
#  - the examples shown in the step-by-step workshop pages                                                    #
#    (for you to run line-by-line to observe the outcome, or to modify and play with)                         #
#  - space called 'YOUR TURN' for you to write your own code to answer the exercises from the workshop pages  #
#  - a possible solution to those exercises (indented)                                                        #
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









    ### possible solutions
    x <- 3:103
    sample(x, 100, replace=TRUE)



# random number generator drawing from specific distributions
?runif  # runif(n, min, max) 
?rpois  # rpois(n, lambda) 
?rnorm  # rnorm(n, mean, sd) 
?rbinom # rbinom(n, prob)	



# YOUR TURN: generate random numbers
## Draw 100 values from a normal distribution with a mean of 0 and a sd of 1


    
    
    
    
    
    

    ### possible solutions
    rnorm(n=100, mean=0, sd=1)
    rnorm(100,0,1) # you do not need to label the arguments if you provide them in their default order
    rnorm(100) # if you sample from a normal distribution with a mean of 0 and a sd of 1, you do not need to provide them, they are the defaults

## Draw 50 values from a normal distribution with a mean of 10 and sd of 5


    
    
    
    
    
    

    ### possible solutions
    rnorm(50, 10, 5) 
    rnorm(sd=5, mean=10, n=50) # if you do not know what order is the default, label your arguments and input them in the order you want!

## Draw 1000 values from a poisson distribution with a lambda of 50


    
    
    
    
    
    

    ### possible solutions
    rpois(n=1000, lambda=50)
    rpois(1000, 50)

## Draw 30 values from a uniform distribution between 0 and 10


    
    
    
    


    ### possible solutions
    runif(n=30, min=0, max=10)
    runif(30, 0, 10)




# repeat 
?replicate # replicate(n, expression)
rnorm(10)
mean(rnorm(10))
replicate(10,rnorm(10))
replicate(10, mean(rnorm(100)))
hist(replicate(10, mean(rnorm(100))))

# YOUR TURN: generate random numbers, repeat, and plot
## Replicate 1000 times the mean of 10 values drawn from a unifrom distribution between 0 and 10  









    ### possible solutions
    replicate (1000, mean(runif(10, 0, 10)))
    hist(replicate (1000, mean(runif(10, 0, 10))))


## Replicate 100 times the mean of 50 values drawn from a normal distribution of mean 10 and standard deviation 5  




    
    
    
    
    
    
    ### possible solutions
    replicate (100, mean(rnorm(50, 10, 5)))
    hist(replicate (100, mean(rnorm(50, 10, 5))))



# set seed
hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))

set.seed(10)
hist(replicate(100, mean(rnorm(10))))


# defining sample size within a replication (n) and the number of simulation/repeats/replication (nrep)
## single random sample of normal distribution N(0,1) with n=10
set.seed(10)
x <- rnorm(10, mean=0, sd=1)
hist(x, breaks=10, col="grey", xlim=c(-4,4))
abline(v=0, col="red", lty=2, lwd=2)
abline(v=mean(x), col="blue", lwd=2)
par(xpd=TRUE) # turn off clipping of legend
legend(0.9,1.5, c("mean(x)", "0"), 
       lty=c(1, 2), 
       col=c("blue","red"))

## 24 sims of same distribution N(0,1) with n=10
set.seed(10)
x24 <- replicate(24, rnorm(10,0,1))
par(mfrow=c(3,8), mar=c(0,0,0,0))
x24Plot <- apply(x24,2,function(x){
               hist(x, col="grey", xlim=c(-5,5), ylim=c(0,7), breaks=c(-5:5),
                    main="", ylab="", xlab="", xaxt="n", yaxt="n")
               abline(v=mean(x), col="blue", lwd=2)
               abline(v=0, col="red", lty=2, lwd=2)
                })

## distribution of mu and sd from 24 sims N(0,1) with n=10
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x24, 2, mean), main="Mean",col="grey", xlim=c(-1,1))
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x24, 2, sd), main="SD",col="grey", xlim=c(0.6,1.4))
abline(v=1, col="red", lty=2, lwd=2)

## 24 sims of same distribution N(0,1) with n=1000
set.seed(10)
x24b <- replicate(24, rnorm(1000,0,1))
par(mfrow=c(3,8), mar=c(0,0,0,0))
x24bPlot <- apply(x24b,2,function(x){
               hist(x, col="grey", xlim=c(-5,5), ylim=c(0,500), breaks=c(-5:5),
                    main="", ylab="", xlab="", xaxt="n", yaxt="n")
               abline(v=mean(x), col="blue", lwd=2)
               abline(v=0, col="red", lty=2, lwd=2)
               })

## distribution of mu and sd from 24 sims N(0,1) with n=1000
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x24b, 2, mean), main="Mean",col="grey", xlim=c(-1,1))
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x24b, 2, sd), main="SD",col="grey", xlim=c(0.6,1.4))
abline(v=1, col="red", lty=2, lwd=2)

## distribution of mu and sd from 1000 sims N(0,1) with n=10
set.seed(10)
x1000 <- replicate(1000, rnorm(10,0,1))
par(mfrow=c(1,2), mar=c(5,5,1,1))
hist(apply(x1000, 2, mean), main="Mean",col="grey")
abline(v=0, col="red", lty=2, lwd=2)
hist(apply(x1000, 2, sd), main="SD",col="grey")
abline(v=1, col="red", lty=2, lwd=2)


#~~~~~~~~~ Functions -----

# writing a function
    ## function syntax:
    ## AwesomeFunctionName <- function(argument1, argument2,…){
    ##                                                         do stuff here
    ##                                                        }

# YOUR TURN: write a function that takes input "nrep", replicates '(mean(rnorm(100)))'
# nrep times, and draws a histogram of the results












    ### possible solutions
    #### step 1: the action
    mean(rnorm(100))
    #### step 2: replicate the action 1000 times
    replicate(1000, mean(rnorm(100)))
    #### step 3: plot the outcome of those simulations
    hist(replicate(1000, mean(rnorm(100))))
    #### step 4: replicate the action nrep time, with nrep defined outside the function
    nrep <- 1000
    replicate(nrep, mean(rnorm(100)))
    #### step 5: wrap it in a function:
    histrnorm100 <- function (nrep){
      hist(replicate(nrep, mean(rnorm(100))))
    }
    #### step 6: check that the function works
    histrnorm100(9)
    histrnorm100(1000)

    
# YOUR TURN: modify your function
## to draw a histogram of nrep mean(rnorm(n)), where n is another input






    
    
    
    
    
    
    

    
    
    ### possible solutions
    #### step 4: define parameters outside the function
    nrep <- 100
    n <- 10
    replicate(nrep, mean(rnorm(n)))
    #### step 5: wrap the action in a function:
    histrnorm_n <- function (nrep, n){
      hist(replicate(nrep, mean(rnorm(n))))
    }
    #### step 6: check that the function works
    histrnorm_n(10,10)
    histrnorm_n(10,100)
    histrnorm_n(100,100)
    histrnorm_n(1000,100)
    


#~~~~~~~~~ Simulating no effect and check alpha -----

# YOUR TURN: draw from the same normal distribution twice 
## and see if the sample differ from each other
## will they differ significantly in 5% of the nrep?
### Figure out how to do a t.test in R  
### Generate two vectors of 10 values drawn from N(0,1) and compare them with a t test  
### Figure out how to extract the p-value from that object (HINT use `str` or `names`)
### Write a function simT that generates two vectors of n random normals, compare them with a t test and return the p-value  
### Repeat with nrep=20 and draw a histogram for n=10
### Repeat with nrep=100 and draw a histogram for n=10    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    ### possible solutions
    #### Figure out how to do a t.test in R
    ?t.test
    #### Generate two vectors of 50  N(0,1) 
    x1 <- rnorm(50,0,1)
    x2 <- rnorm(50,0,1)
    #### Compare them with a t test
    t.test(x1,x2)
    #### extract p value
    str(t.test(x1,x2))
    t.test(x1,x2)$p.value
    #### write function 
    simT <- function(n){
    x1 <- rnorm(n,0,1)
    x2 <- rnorm(n,0,1)
    t.test(x1, x2)$p.value 
    }
    #### test function
    simT(50)
    
    #### repeat function for n = 10 and for different nrep and plot
    par(mfrow=c(1,2))
    simTRep <- replicate(20, simT(10))
    hist(simTRep, breaks=21, col=c('red',rep('grey',20)), main = "nrep=20, n=10", xlab="pvalue")

    simTRep2 <- replicate(100, simT(10))
    hist(simTRep2, breaks=21, col=c('red',rep('grey',20)), main = "nrep=100, n=10", xlab="pvalue")

    #### repeat function for nrep = 1000 and various n
    par(mfrow=c(1,2))
    simTRep <- replicate(1000, simT(10))
    hist(simTRep, breaks=21, col=c('red',rep('grey',20)), main = "nrep=1000, n=10", xlab="pvalue")
    
    simTRep2 <- replicate(1000, simT(100))
    hist(simTRep2, breaks=21, col=c('red',rep('grey',20)),  main = "nrep=1000, n=100", xlab="pvalue")
   

#~~~~~~~~~ Simulating an effect and check power -----

# we can calculate the power of a t.test for a given sample size using:
power.t.test(n = NULL, delta = 0.5, sd = 1, sig.level = 0.05, power = 0.8)
# the required sample size is 64 per group.

# YOUR TURN: Use your simulation skills to work out the power of a t-test for a given sample size through simulation.
## Write a function which:
### 1. Draws from two random normal distributions with different means and a given sample size
### 2. Compares the means with a t.test and extracts the p.value
## Then, use that function to replicate the function 1000 times using the parameters used in the power calculation.
## Calculate the proportion of p-values that are <0.05











    ### possible solution
    #### write new function 
    simT2 <- function(n, m1, m2) {
      ##### n is sample size per group, m1 is mean of group 1, m2 is mean of group 2
      x1 <- rnorm(n, m1)
      x2 <- rnorm(n, m2)
      t.test(x1, x2)$p.value
    }
    
    ##### repeat the function 1000 times 
    ##### note that we are using a difference of 0.5 between means to match the "delta" 
    ##### used in the power calcution 
    set.seed(100)
    p <- replicate(1000, simT2(n = 64, m1 = 0, m2 = 0.5))
    
    #### plot the results
    par(mfrow=c(1,1))
    hist(p, breaks=21, col=c('red',rep('grey',20)), main="nrep = 1000, n=64, delta = 0.5", xlab ='pvalue')
    
    #### calculate the proportion "significant" 
    prop.table(table(p<0.05))
    #### power is the probability that the test correctly rejects the null. Since we
    #### know the population paramaters (as we set them in our simulation), we know
    #### that there really is a difference, and the null should be rejected. The power
    #### is therefore the proportion of p.values <0.05
    
    # compare that to calculating the "power" parameter using the function below with all the other parameters provided (including n)
    power.t.test(n = 64, delta = 0.5, sd = 1) # the results are similar

    
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
    
    
    
    
    
    
    
    
    
    
    
    
    #### Possible solution
    set.seed(1234)
    N <- 10 # size of your dataset 
    yes_no <- c("Yes", "No") # some options for the outcomes in the data
    
    # the dataframe() function let's us create a data frame
    # before the "=" is the column name. After "=" is the contents of the columm
    df <- data.frame(smoking_status = sample(yes_no, size = N, replace = T),
                     lung_cancer = sample(yes_no, size = N, replace = T), 
                     sex = sample(c("M", "F"), size = N, replace = T),
                     age = rnorm(N, 30, sd = 10))
    # run the parts after the "=" alone to make sure you understand what's going on
    sample(c("M", "F"), size = N, replace = T)
    
    head(df)

# YOUR TURN:
## Run a logistic regression on the data with lung cancer as the outcome and
## adjusting for the other variables. 
## You could try something like:
## glm(lung_cancer ~ smoking_status, sex, age, family = binomial(link = "logit"), data = df)
## Why doesn't it work? Try to trouble shoot and get the code to work!

## HINT: are the variables the correct data type?
## HINT: once the model works, use summary() to look at the results
    
    
    
    
    
    
    
    
    
    
    
    #### Possible solution 
    
    # This mysterious error message appears because the categorical variables
    # need to be factors for the model to run. So we are already learning
    # something about how the data need to be that you might not have known
    # before trying to run the code on a simulated dataset.
    
    # You can convert the relevant variables to factors
    df[1:3] <- lapply(df[1:3], as.factor)
    
    # You could also do this one variable at a time:
    # df$smoking_status <- as.factor(df$smoking_status)
    
    # Now we can rerun the model:
    
    m1 <- glm(lung_cancer ~ smoking_status + sex + age, 
              family = binomial(link = "logit"), 
              data = df)
    
    # and look at the results
    summary(m1)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

