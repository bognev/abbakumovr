#set.seed(110)
sims = 1000

green=sample(1:6, sims, replace=TRUE)
red=sample(1:6, sims, replace=TRUE)
S=green+red

#set subplots
par(mfrow = c(1,2))
hist(green, main='Green', xlab='Roll', freq=FALSE, col=rgb(1,0,0,1/4))
hist(red, main='Red', xlab='Roll', freq=FALSE, col=rgb(0,1,0,1/4))

par(mfrow = c(1,1))
par(mfrow = c(1,2))
hist(green, main='Green', xlab='Roll', freq=FALSE, col=rgb(1,0,0,1/4))
hist(green[red==3 & S==6], main='Red', xlab='Roll', freq=FALSE, breaks = 1:6, col=rgb(0,1,0,1/4))
par(mfrow = c(1,1))
