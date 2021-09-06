# Random number generators

R contains several functions to generate random numbers.  
Type *`?function`* in your consol to get information on the function's arguments (i.e. the values that must be provided to obtain the function's result).  

The function  
* `sample(x, n, replace=FALSE)` draws `n` values from a given vector `x` without replacement (by default) . 

Sampling without replacement means that when you repeatedly draw e.g. 1 item from a pool of items, any item selected during the first draw is not available for selection during the second draw, and the first and second selected items are not in the pool to select from during the third draw, etc. Sampling with replacement means that all the original options are available at each draw.  

***
**YOUR TURN:**  
Sample 100 values between 3 and 103 with replacement.    
For this, open the file `./exercise_script.R` from the root of your local repository (with or without answers), review the examples if needed, complete the exercise, and check out the proposed answer.

***

The following functions draw `n` values from distributions with the specified parameters  
* `runif(n, min, max)` draws `n` values from a *uniform* distribution with the specified `min` and `max`  
* `rpois(n, lambda)` draws `n` values from a *poisson* distribution with the specified `lambda`  
* `rnorm(n, mean, sd)` draws `n` values from a *normal* distribution with the specified `mean` and `standard deviation`  
* `rbinom(n, prob)`	draws `n` values from a	*binomial* distribution with the specified `probability`  

***
**YOUR TURN:**    
Draw 100 values from a normal distribution with a mean of 0 and a sd of 1.  
Draw 50 values from a normal distribution with a mean of 10 and sd of 5.  
Draw 1000 values from a poisson distribution with a lambda of 50.  
Draw 30 values from a uniform distribution between 0 and 10.  

Try it out in your local exercise script.

***

[Previous](./basic-principles.md) | [Next](./repeat.md)  

 


