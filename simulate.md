# First real simulation: testing probability assumption

In most quantitative sciences we work with the statistical assumption "alpha = 0.05", which means that 5% of statistical tests should give a false positive result.  

If you draw from the same distribution twice, will the mean of the two samples differ significantly in 5% of the cases?  


***

**YOUR TURN:**  
Figure out how to do a t test in R  
Generate two vectors of 10 values drawn from N(0,1) and compare them with a t test  
Figure out how to extract the p-value from that object (use `str` and your subsetting skills)
Write a function simT that generates two vectors of `n` random normals, compare them with a t test and return the p-value  
Repeat with `nrep`=20 and draw a histogram for `n`=10  
Repeat with `nrep`=100 and draw a histogram for a `n`=10

***

**p-values of t tests comparing means from 20 or 100 sims N(0,1) with n=10**   
<br/>
<img src="./assets/ttest-changing-nrep.png" width="500">  
<br/>


In the first case, where `nrep` = 20, we expect 1 out of the 20 tests to be significant (5%). In my case, I got 2. How many did you get?    
In the second case, where `nrep` = 100, we expect 5 out of the 100 tests to be significant. In my case, I got 4. How many did you get?      
Are those deviations meaningful?  

***

**YOUR TURN:**  
Plot the output of the function simT with `nrep`=1000 and `n`=10  
Plot the output of the function simT with `nrep`=1000 and `n`=100

***


**p-values of t tests comparing means from 1000 sims N(0,1) with n=10 or n=100**   
<br/>
<img src="./assets/ttest-changing-n.png" width="500">  
<br/>

In both cases, we expect 50 out of the 1000 tests to be significant by chance (i.e. with a p value under 0.05). In my simulations, I get 59 and 48 false positive results, for `n`=10 and 100, respectively. How many did you get?  

These proportions are not signicantly different from 5%. 

`prop.test(59, 1000, p = 0.05, alternative = "two.sided", correct = TRUE)`  
1-sample proportions test with continuity correction  
data:  59 out of 1000, null probability 0.05  
X-squared = 1.5211, df = 1, p-value = 0.2175  

***

**YOUR TURN:**  
What happen if you use non-normally distributed data? e.g. Poisson distributed data?
What happen if you varie lambda?  

***

**p-values of t tests comparing means from 1000 sims Poisson(3) with n=10 or n=100**   
<br/>
<img src="./assets/ttest-poisson-changing-nrep.png" width="500">  
<br/>

**p-values of t tests comparing means from 1000 sims Poisson(3) with n=10 or n=100**   
<br/>
<img src="./assets/ttest-poisson-changing-n.png" width="500">  
<br/>

The proportion of false-positive results are all close to 5% of the tests performed, for this Poisson distribution I drew from (with a lambda of 3). Did you get similar results with different lambda?  

To generalize such observation, and assert that using t test for Poisson distributed data does not lead to more false positive than expected by chance, one would need to explore the entirety of the parameter space (i.e. test this for all possible lambda).  

Please note that I do not suggest you use t test to compare Poisson distributed data (such as counts). There may be other problems than creating false positive results that need consideration (and that perhaps other simulations could help us examinate).

***

[Previous](./dry-rule.md) | [Next](./general-structure.md)


