set.seed(110)

sims = 1000
match.prob <- function(n){
  v <- 365:(365-n+1)
  return(1-(prod(v)/365^n))
}

people = 10:50

p.match = rep(NA, length(people))
for(j in 1:length(people)){
  matches = rep(0, sims)
  for(i in 1:sims){
    bdays = sample(1:365, people[j], replace=TRUE)
    if(length(unique(bdays)) < people[j]){
      matches[i] = 1
    }
  }
  p.match[j] = mean(matches)
}
plot(1:100, sapply(1:100, function(x) match.prob(x)),
     main = "P(at least one match) vs. n",
     xlab = "n", ylab = "P(at least one match)",
     col = "firebrick3", type = "l",
     lwd = 4)

abline(h=1/2, col = "black")
lines(people, p.match, col = "dodgerblue4",
      lwd = 4, type = "p", pch = 16)

#add a legend
legend("bottomright", legend = c("Empirical Result", "Analytical Result"),
       lty=c(2,1), lwd=c(2.5,2.5),
       col=c("dodgerblue4", "firebrick3"))
