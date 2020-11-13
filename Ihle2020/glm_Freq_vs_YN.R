#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#	 Malika IHLE      malika_ihle@hotmail.fr
#	 Preregistration manipulation color and unpalatability 
#     https://osf.io/f8uk9/?view_only=3943e7bb9c5f4effbf119ca5b062fe80
#     click to read about the design of this study
#  simulation of data to see whether planned analyses code works
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# purpose
#### we here want to see if running a glm on a contingency table of counts (poisson distribution)
#### provides the same results as running a glm with one line per observation, and the variable as Yes/No)(binomial distribution) 



rm(list = ls(all = TRUE))

# packages
library(pbapply) # to replicate a function / a simulation multiple time with a bar of progress (function pbreplicate instead of replicate)



# 1. sample sizes & 5. try different parameter values
nF <- 100 # number of females to be tested
pbrep <- 1000 # number of simulation replicates
probsnaive <- 0.5 # probability of attacking the bitter prey when never exposed to the bitter compound - needs to be 0.25 to always detect the effect
probswhenexposed <- 0.5 # probability of attacking the bitter prey when trained on the bitter compound - needs to be 0.05 to always detect the interaction (if previous is 0.25)


# two-by-two factorial design - 'fixed' data structure
FPriorExposure <- c(1,1,1,1,0,0,0,0)
FColorGroup <- c('Green','Green','Beige','Beige','Green','Green','Beige','Beige') # the color that will contain DB, the other color will contain water
TermiteEatenPalatability <- c('Water','DB','Water','DB','Water','DB','Water','DB') # in one test, either the DB termite or the water termite has to be attacked for the test to end
TermiteEatenColor <- c('Beige','Green','Green','Beige','Beige','Green','Green','Beige') # deduced from FcolorGroup and Termite Eaten




# 2. simulation of an effect of the bitter compound (say smell) onto that attack, 
# if the termite has the bitter compound, prob of attack is = probs defined in parameters



## Function to check number of significant result by chance 
Simulate_and_analyse <-function(){  # DO NOT RUN IF WANT TO CREATE ONE EXAMPLE TABLE
  
  
  
  ## create a contingency table summarizing frequencies
  
  ### generate a number of spider attacking the DB termite, given the probability of attacking it
  GreenDBNoExp <- sum(sample(c(1,0),nF/4, prob = c(probsnaive, 1-probsnaive), replace=TRUE))
  BeigeDBNoExp <- sum(sample(c(1,0),nF/4, prob = c(probsnaive, 1-probsnaive), replace=TRUE))
  GreenDBExp <-sum(sample(c(1,0),nF/4, prob = c(probswhenexposed, 1-probswhenexposed),replace=TRUE))
  BeigeDBExp <-sum(sample(c(1,0),nF/4, prob = c(probswhenexposed, 1-probswhenexposed), replace=TRUE))
  
  ### the number of spiders attacking the water termite is the number of spider tested in the two-by-two group
  ### minus the number of spider that attacked the DB termite 
  Freq <- c(nF/4 - GreenDBExp,GreenDBExp, nF/4 - BeigeDBExp, BeigeDBExp, nF/4 - GreenDBNoExp,GreenDBNoExp, nF/4 - BeigeDBNoExp, BeigeDBNoExp)
  
  ### in contingency table, diagnals should sum up to nF/4, this count the number of spiders that attacked the termite from this category
  contingencytable <- xtabs(Freq~TermiteEatenColor+TermiteEatenPalatability+FPriorExposure)
  FreqTable <- as.data.frame.table(contingencytable)
  
  
  
  
  ## create a table with one line per termite group (i.e. two line per test: the DB termites, and the water termite, of opposite colors)
 
  ### use the same simulated data but reformat them
  AttackedPreyTable <-   FreqTable[rep(1:nrow(FreqTable), FreqTable[,4]),-4] # 1 line per test describing the attacked prey
  nrow(AttackedPreyTable) # nF
  AttackedPreyTable$AttackedYN <- 1
  AttackedPreyTable$FID <- 1:nF
  SecondLinePerTestTable <- AttackedPreyTable
  SecondLinePerTestTable$AttackedYN <- 0
  
  ### reverse color and palatability of that second termite
  for (i in 1:nrow(SecondLinePerTestTable)){
    
    if(SecondLinePerTestTable$TermiteEatenColor[i] == 'Beige' )
    {SecondLinePerTestTable$TermiteEatenColor[i]<- 'Green'}
    else {SecondLinePerTestTable$TermiteEatenColor[i]<- 'Beige'}
    
    if(SecondLinePerTestTable$TermiteEatenPalatability[i] == 'DB' )
    {SecondLinePerTestTable$TermiteEatenPalatability[i]<- 'Water'}
    else {SecondLinePerTestTable$TermiteEatenPalatability[i]<- 'DB'}}
  
  TwoLinePerTestTable <- rbind(AttackedPreyTable,SecondLinePerTestTable )
  TwoLinePerTestTable <- TwoLinePerTestTable[order(TwoLinePerTestTable$FID),]
  
  
  ### pick one line at random for each female 
  ### (since when we know one line (she attacked or did not attack that one), we know she attacked or did not attack the other one)
  
  FocalAttackTable <- do.call(rbind,lapply(split(TwoLinePerTestTable, TwoLinePerTestTable$FID),function(x){x[sample(nrow(x), 1), ]}))
      ####do not rename only for easy to combine both model outputs later on
      ####colnames(FocalAttackTable) <- c('FocalTermiteColor', 'FocalTermitePalatability', 'FPriorExposure', 'FocalTermiteAttackedYN', 'FID')
  
  
  
  
  
  ## 3. run statistical test: Poisson Model on contingency table
  modFreq0 <- glm(Freq ~ TermiteEatenColor+TermiteEatenPalatability+FPriorExposure, family = 'poisson', data = FreqTable)
  modFreq1 <- glm(Freq ~ TermiteEatenColor+TermiteEatenPalatability*FPriorExposure, family = 'poisson', data = FreqTable)
  summary(modFreq1)
  
  anova(modFreq0,modFreq1,test='Chi')
  

  
  ## 3. run statistical test: Binomial model on 'long table'
      ####should be named: glm (FocalTermiteAttackedYN ~ FocalTermiteColor+FocalTermitePalatability*FPriorExposure 
      ####but keep name similar as above to combine them more easily
  modBinom <- glm (AttackedYN ~ TermiteEatenColor +TermiteEatenPalatability*FPriorExposure, family = 'binomial', data = FocalAttackTable)
  summary(modBinom)
  

  
  
  ## 3. save parameter estimates for each iteration: extract p value
  modFreq1p <-  coef(summary(modFreq1))[-1, 4]
  modBinomp <- coef(summary(modBinom))[-1, 4]
  
  

  
  pees <- rbind(modFreq1p,modBinomp)
  return(list(pees))  # DO NOT RUN IF WANT TO CREATE ONE EXAMPLE TABLE
}  




OutputSimulation <- do.call(rbind, pbreplicate(pbrep,Simulate_and_analyse())) # collect all p values for both factors in the models
OutputSimulation <- OutputSimulation<0.05 # determine whether or not their are significant

OutputSimulationFreq <- OutputSimulation[rownames(OutputSimulation) == "modFreq1p",]
OutputSimulationBinom <- OutputSimulation[rownames(OutputSimulation) == "modBinomp",]

# analyse and interpret the results of simulations
## factors where no effect was simulated should have a percentage of false positive effect under 5%
## factors with simulated effect should detect an effect in at least more than 5% of the cases
data.frame(colSums(OutputSimulationFreq)/pbrep) # count the number of significant p values out of the number of simulation replicate. 
data.frame(colSums(OutputSimulationBinom)/pbrep) # count the number of significant p values out of the number of simulation replicate. 



# CONCLUSION: 
# glm on three-way contingency table with Poisson distribution does as good as 
# glm binomial with one line per test with the data on a focal termite

