#Estimating power of a mediation test

#read simulated dataset
#MUST REPLACE ... WITH APPROPRIATE FILE PATH
d = read.csv("C:\\...\\novel_question_output.csv", header=TRUE, sep=",")

#Example where a = 0.3, b=0.3, c'=0.2, N = 300
#extract Sobel z-statistic from the condition of interest
z_dist = d$Sobel_z[d$a==0.3 & d$b==0.3 & d$cp==0.2 & d$N==300 & d$model==1]

#identify which z-values are large enough to give p-value < 0.05
significant = abs(z_dist) > 1.96

#identify the proportion of z-values with p-value < 0.05.  The proportion of
#values that are TRUE is equal to the proportion of times the null hypothesis
#of no indirect effect is rejected and is equivalent to power.
table(significant)/length(significant)


#Example where a = 0.3, b=0.3, c'=0.2, N = 100
#extract Sobel z-statistic from the condition of interest
z_dist = d$Sobel_z[d$a==0.3 & d$b==0.3 & d$cp==0.2 & d$N==100 & d$model==1]

#identify which z-values are large enough to give p-value < 0.05
significant = abs(z_dist) > 1.96

#identify the proportion of z-values with p-value < 0.05.  The proportion of
#values that are TRUE is equal to the proportion of times the null hypothesis
#of no indirect effect is rejected and is equivalent to power.
table(significant)/length(significant)


#Other example where a = 0.3, b=0, c'=0.2, N = 300
#extract Sobel z-statistic from the condition of interest
z_dist = d$Sobel_z[d$a==0.3 & d$b==0 & d$cp==0.2 & d$N==300 & d$model==1]

#identify which z-values are large enough to give p-value < 0.05
significant = abs(z_dist) > 1.96

#identify the proportion of z-values with p-value < 0.05.  The proportion of
#values that are TRUE is equal to the proportion of times the null hypothesis
#of no indirect effect is rejected and is equivalent to power.
table(significant)/length(significant)




