# Introduction to Simulations in R

## About this work
This tutorial was created by [Malika Ihle](https://www.osc.uni-muenchen.de/about_us/coordinator/index.html) based on materials from [Joel Pick](https://joelpick.wixsite.com/research), [Hadley Wickham](https://www.yumpu.com/en/document/view/19077330/simulation-hadley-wickham), [Kevin Hallgren](https://doi.org/10.20982/tqmp.09.2.p043), and with contributions from [James Smith](https://github.com/worcjamessmith).   
It is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

## Prerequisites

* Have R and RStudio installed. If you don't, follow [these instructions](https://lmu-osc.github.io/Introduction-RStudio-Git-GitHub/installing_software.html)  
* Know some R basics (e.g. how to select a value in a data.frame, how to create a vector). If you don't, visit the tutorial: <a href="https://www.tutorialspoint.com/r/index.htm" target ="_blank">https://www.tutorialspoint.com/r/index.htm</a>  

## Prior to the session: optional preparation to get familiarised with the subject
1) Watch this [30 min introduction to credible research](https://osf.io/xtmek/), which contextualise the importance of simulations for reliable research. 

2) Read [Hallgren A. K. 2013. Conducting simulation studies in the R programming environment. Tutor Quant Methods Psychol. ; 9(2): 43–60](https://doi.org/10.20982/tqmp.09.2.p043).

## Self-paced workshop
### How it works
The self-paced tutorial (pages linked below) will alternate presentation of concepts and simple exercises for you to try to apply them in R. Each time you see written **YOUR TURN**, switch to your local copy of the exercise script (you can chose between a file <a href="https://github.com/lmu-osc/Introduction-Simulations-in-R/blob/main/exercise_script_with_solutions.R" target ="_blank">with</a> or <a href="https://github.com/lmu-osc/Introduction-Simulations-in-R/blob/main/exercise_script_without_solutions.R" target ="_blank">without</a> the solutions depending on e.g. your level of familiarity with R), review the examples if needed, complete the exercise, and check out the proposed answer (which often contains additional tips). Come back to the online tutorial and after finishing one page, you can click 'next' at the bottom to continue. The exercise script contains  code for all the exercises and code that generates the plots that appear in the online tutorial, all in order of appearance in the tutorial.  

It is necessary that you work through the sections of the tutorial in order. Please read the blurbs of each sections below to get an overview of this workshop. Then click on the first page 'Download the material' and follow along by clicking 'Next' at the bottom of each page! You can get back to this overview at any time by clicking on the title 'Introduction-Simulations-in-R' at the top of each page.
 

### Tutorial
* [Download the material](./tutorial_pages/download-repo.qmd) - Get this tutorial onto your machine
* [Definition](./tutorial_pages/definition.qmd) - what are simulations?
* [Purpose](./tutorial_pages/purpose.qmd) - what can we use simulations for?
* [Basic Principles](./tutorial_pages/basic-principles.qmd) - what do we need to create a simulation?
* [Random Number Generators](./tutorial_pages/random-numbers-generators.qmd) - how to generate random numbers in R?
* [Repeat](./tutorial_pages/repeat.qmd) - how to repeat the generation of random numbers multiple times?
* [Setting the seed](./tutorial_pages/seed.qmd) - how can you generate the same random numbers?
* [Sample size `n`](./tutorial_pages/sample-size-n.qmd) - how many values should you generate within a simulation?
* [Number of simulations `nrep`](./tutorial_pages/number-of-simulations-nrep.qmd) - how many repeats of a simulation should you run?
* [Dry rule](./tutorial_pages/dry-rule.qmd) - how to write your own functions?
* [Simulate to check alpha](./tutorial_pages/check-alpha.qmd) - write your first simulation and check the rate of false-positive findings.  
* [Simulate to check power](./tutorial_pages/check-power.qmd) - simulate data to perform a power analysis.  
* [Simulate to prepare a preregistration](./tutorial_pages/simulate-for-preregistration.qmd) - simulate data to test statistical analyses before preregistering them.  
* [General structure](./tutorial_pages/general-structure.qmd) - what is the general structure of a simulation?
* [Limitations](./tutorial_pages/limitations.qmd) - what are the limitations to simulations?
* [Real-life example](./tutorial_pages/real-life-example.qmd) - what are real life examples of simulations?
* [Additional resources](./tutorial_pages/resources.qmd) - what resource can help you write your own simulation?


