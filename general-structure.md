# General structure of a simulation

1. **define** what type of data and variables need to be simulated, i.e. their **distribution**, their class (e.g. factor vs numerical value), **sample sizes** (within a dataset, and number of replicates), what will need to vary (e.g. the strength of relationship)  

2. **generate data**, random data or data including an effect (e.g. an impose correlation between two variables)  

3. **run the statistical test** you think is appropriate, and record the relevant statistic (e.g. p-value) 

4. **replicate** step 2 and 3 to get the distribution of the statistic of interest  

5. **check you get the results** you expect after many iterations: e.g. you only get a significant result with no effect in 5% of simulation (if `alpha = 0.05`) and you detect the simulated effect according to the power you want (e.g. 80%)

6. try out different parameter sets (**explore the parameter space** for which results are similar)  

7. **analyze and interpret the combined results of many simulations** within each set of parameters  

***

[Previous](./simulate.md) | [Next](./limitations.md)
