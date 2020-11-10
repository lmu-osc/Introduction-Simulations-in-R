#Bootstrapping a 95% CI for mediation test

#Create a function for bootstrapping
mediation_bootstrap <- function(X, M, Y, reps){
	ab_vector = NULL 							#remove any data that is stored under the variable ab_vector
	for (i in 1:reps){ 							#loop the number of times specified by the reps parameter
		s = sample(1:length(X), replace=TRUE) 	#sample cases N cases WITH replacement
		Xs = X[s] 								#extract X variable for the sampled cases indexed by s
		Ys = Y[s] 								#extract Y variable for the sampled cases indexed by s
		Ms = M[s] 								#extract M variable for the sampled cases indexed by s
		M_Xs = lm(Ms ~ Xs) 						#perform a regression model of M predicted by X
		Y_XMs = lm(Ys ~ Xs + Ms) 				#perform a regression model of Y predicted by X and M
		a = M_Xs$coefficients[2] 				#extract beta coefficient for magnitude of X->M relationship
		b = Y_XMs$coefficients[3] 				#extract beta coefficient for magnitude of M->Y relationship (with X covaried)
		ab = a*b 								#compute product of coefficients
		ab_vector = c(ab_vector, ab) 			#save each computed product of coefficients to vector called ab_vector
	}
	bootlim = c(quantile(ab_vector, 0.025), quantile(ab_vector, 0.975)) #identify ab values at 2.5 and 97.5 percentile, representing 95% CI
	hist(ab_vector)
	segments(bootlim, y0=0, y1=1000, lty=2)
	text(bootlim, y=1100, labels=c("2.5 %ile", "97.5 %ile"))
	return(bootlim) #return the 95% CI
}

#Set starting seed for random number generator, this is not necessary but allows
#results to be replicated exactly each time the simulation is run.
set.seed(192)

#import raw data for bootstrapping
#MUST REPLACE ... WITH APPROPRIATE FILE PATH
d_raw = read.csv("C:\\...\\mediation_raw_data.csv", header=TRUE, sep=",")

#identify 95% confidence interval for indirect effect in X-M-Y mediation model
mediation_bootstrap(d_raw$X, d_raw$M, d_raw$Y, 1000)

