# General structure of a simulation
<br/>

1. **define** what type of data and variables need to be simulated, i.e. their **distribution**, their class (e.g. factor vs numerical value), **sample sizes** (within a dataset, and number of replicates), what will need to vary (e.g. the strength of relationship, two alternative for one scenario)  

2. **generate data**, random data or data including an effect (e.g. an impose correlation between two variables)  

3. **run the statistical test** you think is most ideal, check that the results are random (significant in only 5% of the case) or picking up the effect imposed/simulated in 80% of the cases (power), and **save the parameter estimate of interest for that iteration**  

4. **replicate** step 2 and 3 to get the distribution of the parameter estimates  

5. try out different parameter sets (**explore the parameter space** for which results are similar)  

6. **analyze and interpret the combine results of many simulations** within each set of parameters  
