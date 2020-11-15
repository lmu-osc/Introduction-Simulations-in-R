# **D**o not **R**epeat **Y**ourself - DRY rule

## *vs.* **W**rite **E**verything **T**wice - WET rule

<br/>
Following the WET rule will:  

* Increase the difficulty of change  
* Decrease clarity  
* Leads to opportunities for inconsistency  
<br/>
To prevent duplication and follow the DRY rule, we can write custom functions.

* `AwesomeFunctionName <- function(argument1, argument2,…){  
do stuff here  
}`

To build up a function, start by writing the "`stuff`" to test that it works outside the function.

***

**YOUR TURN:**  
Create a function that draws a histogram of `nrep` mean(rnorm(100))  
Modify your function to draw a histogram of `nrep` mean(rnorm(`n`))


***

[Previous](./sample-size-nrep.md) | [Next](./simulate.md)
