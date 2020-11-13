# Random number generators

R contains several functions to generate random numbers.  
Type *`?function`* in your consol to get information on the function's arguments.  

The function  
* `sample(x, n, replace=FALSE)` draws `n` values from a given vector `x` without replacement (by default)  

***
**YOUR TURN:**  
Sample 100 values between 3 and 103 with replacement.    
For this, open the file `./exercice_script.R` from the root of your local repository (i.e. after having forked and clone this GitHub repository), review the examples if needed, complete the exercice, and check out the proposed answer.

***

The following functions draw `n` values from distributions with the specified parameters  
* `runif(n, min, max)` draws `n` values from a *uniform* distribution with the specified `min` and `max`  
* `rpois(n, lambda)` draws `n` values from a *poisson* distribution with the specified `lambda`  
* `rnorm(n, mean, sd)` draws `n` values from a *normal* distribution with the specified `mean` and `standard deviation`  
* `rbinom(n, prob)`	draws `n` values from a	*binomial* distribution with the specified `probability`  

***
**YOUR TURN:**    
Sample 100 values from a normal distribution of mean 0 and sd 1.  
Draw 100 values from a normal distribution with a mean of 0 and a sd of 1.  
Draw 50 values from a normal distribution with a mean of 10 and sd of 5.  
Draw 1000 values from a poisson distribution with a lambda of 50.  
Draw 30 values from a uniform distribution between 0 and 10.  

Try it out in your local exercice script.

***

[Previous](./basic-principles.md) | [Next](./repeat.md)  

 


