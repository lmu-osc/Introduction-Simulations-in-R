#Answering a novel question about mediation analysis

#This simulation will generate mediational datasets with three variables, 
#X, M, and Y, and will calculate Sobel z-tests for two competing mediation
#models in each dataset: the first mediation model proposing that M mediates the 
#relationship between X and Y (X-M-Y mediation model), the second mediation 
#model poposes that Y mediates the relationship between X and M (X-Y-M 
#mediation model).

#Note this simulation may take 10-45 minutes to complete, depending on computer speed

#Data characteristics specified by researcher -- edit these as needed
N_list = c(100,300) 			#Values for N (number of participants in sample)
a_list = c(-.3, 0, .3) 	#values for the "a" effect (regression coefficient for X->M path)
b_list = c(-.3, 0, .3) 	#values for the "b" effect (regression coefficient for M->Y path after X is controlled)
cp_list = c(-.2, 0, .2)	#values for the "c-prime" effect (regression coefficient for X->Y after M is controlled)
reps = 1000 			#number of datasets to be generated in each condition

#Set starting seed for random number generator, this is not necessary but allows
#results to be replicated exactly each time the simulation is run.
set.seed(192)

#Create a function for estimating Sobel z-test of mediation effects
sobel_test <- function(X, M, Y){
	M_X = lm(M ~ X) 									#regression model for M predicted by X
	Y_XM = lm(Y ~ X + M) 								#regression model for Y predicted by X and M
	a = coefficients(M_X)[2] 							#extracts the estimated "a" effect
	b = coefficients(Y_XM)[3] 							#extracts the estimated "b" effect
	stdera = summary(M_X)$coefficients[2,2] 			#extracts the standard error of the "a" effect
	stderb = summary(Y_XM)$coefficients[3,2] 			#extracts the standard error of the "b" effect
	sobelz = a*b / sqrt(b^2 * stdera^2 + a^2 * stderb^2)	#computes the Sobel z-test statistic 
	return(sobelz) 										#return the Sobel z-test statistic when this function is called
}

#run simulation
d = NULL #start with an empty dataset
for (N in N_list){					#loop through all of the "N" sizes specified above
	for (a in a_list){ 				#loop through all of the "a" effects specified above
		for (b in b_list){ 			#loop through all of the "b" effects specified above
			for (cp in cp_list){ 	#loop through all of the "c-prime" effects specified above
				for (i in 1:reps){ 					#loop to replicate simulated datasets within each condition
					#Generate mediation based on MacKinnon, Fairchild, & Fritz (2007) equations for mediation.  This data is set-up so that X, M, and Y are conformed to be the idealized mediators
					X = rnorm(N, 0, 1) 				#generate random variable X that has N observations, mean = 0, sd = 1
					M = a*X + rnorm(N, 0, 1) 		#generate random varible M that inclues the "a" effect due to X and random error with mean = 0, sd = 1
					Y = cp*X + b*M + rnorm(N, 0, 1) #generate random variable Y that includes "b" and "c-prime" effects and random error with mean = 0, sd = 1
					#Compute Sobel z-statistic for two mediation analyses
					d = rbind(d, c(i, a, b, cp, N, 1, sobel_test(X, M, Y)))	#Compute Sobel z-test statistic for X-M-Y mediation and save parameter information to dtemp
					d = rbind(d, c(i, a, b, cp, N, 2, sobel_test(X, Y, M))) #Compute Sobel z-test statistic for M-Y-X mediation and save parameter information to dtemp
				}
			}
		}
	}
}
#add column names to matrix "d" and convert to data.frame
colnames(d) = c("iteration", "a", "b", "cp", "N", "model", "Sobel_z") 
d = data.frame(d)

#save data frame "d" as a CSV file
#MUST REPLACE ... WITH APPROPRIATE FILE PATH
write.table(d, "C:\\..\\novel_question_output.csv", sep=",", row.names=FALSE)

#save raw data from last iteration to data.set to illustrate bootstrapping example
d_raw = cbind(X, M, Y)
#MUST REPLACE ... WITH APPROPRIATE FILE PATH
write.table(d_raw, "C:\\...\\mediation_raw_data.csv", sep=",", row.names=FALSE)

#Make a boxplot of X-M-Y and X-Y-M models when a=0.3, b=0.3, c' = 0.2, N = 300, and when a=0.3, b=0.3, c'=0, N = 300.
boxplot(d$Sobel_z[d$a == 0.3 & d$b == 0.3 & d$cp == 0.2 & d$model == 1 & d$N == 300], 
	d$Sobel_z[d$a == 0.3 & d$b == 0.3 & d$cp == 0.2 & d$model == 2 & d$N == 300],
	d$Sobel_z[d$a == 0.3 & d$b == 0.3 & d$cp == 0 & d$model == 1 & d$N == 300], 
	d$Sobel_z[d$a == 0.3 & d$b == 0.3 & d$cp == 0 & d$model == 2 & d$N == 300],
	ylab="Sobel z-statistic",
	xaxt = 'n',
	tick=FALSE)	#suppress x-axis labels
#Add labels to x-axis
axis(1,at=c(1:4),labels=c("X-M-Y model\n(a=0.3, b=0.3, c'=0.2)", "X-Y-M model\n(a=0.3, b=0.3, c'=0.2)", "X-M-Y model\n(a=0.3, b=0.3, c'=0)", "X-Y-M model\n(a=0.3, b=0.3, c'=0)"),tick=FALSE)
