# Loading Libraries and data set
library(faraway) # load relevant library, some random data to test with, don't want to deal with 5 mil data lol.
data(happy) # load the data
mba<-happy; rm(happy) # rename the data ''mba''
attach(mba)

# Variable Selection
Model <- lm(happy~., data = mba)# start with a full model, "." here means include all predictors
Model2 <- step(Model, k=2, step = 100, direction = 'both', scope = list(lower = ~1, upper = ~.^2)) # k is the penalty coefficient, remain this for now. First argument is model which is the initial model we are trying to use. We can change the step to some random number later.
