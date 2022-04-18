###Example R file to practice 

#Simulate some data
set.seed(1256)                            #Set seed
cage_movies = runif(n=20, min=1, max=30)  #Number of Nicolas Cage movies made each year
slope = 4                  #Parameter that describes how many drownings occur for each Nicolas Cage move made in one year
int = 50                   #Number of pool drownings IF Nicolas Cage made 0 movies in one year (like that will ever happen)
error = rnorm(n=20, mean=0, sd=15) 
drownings = int + slope * cage_movies + error  #drownings predicted by number of Nick Cage movies in one year.

#Plot data, linear?
plot(drownings~cage_movies)

#Normality?
shapiro.test(drownings)

#Regression
cage_mod = lm(drownings~cage_movies)
summary(cage_mod)

#Check resids vs predicted
plot(resid(cage_mod)~predict(cage_mod))
abline(h=0)
