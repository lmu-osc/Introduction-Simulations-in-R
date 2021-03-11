# Setting the seed

* `set.seed()`

Computers in general, and R specifically, can, in fact, only provide *pseudo* random number generators.  

They generate numbers according to an algorithm, and, given the same 'seed', it will output the same numbers, i.e. repeat exactly the same simulation.  

This is useful for sharing code and reproduce simulations, as well as for debugging code.

***

**YOUR TURN:**  
In your local exercise script:  
Play around with the function `set.seed()` by running and modifying the examples provided (e.g. compare outputs with and without seeds, change the seed number)
 
***

You can set the seed at the beginning of a script, and if things are ran in the exact same order they will provide the same output in subsequent runs.  

***

[Previous](./repeat.md) | [Next](./sample-size-n.md)  
