fish = table("/home/zabolotsky/abbakumov_r/factor_2015/stickleback/stickleback.csv", header=T, sep=";", dec=",")
#View(fish)
x = fish[,1:7]
print(names(x))
print(dim(x))
print(summary(x))
for(i in 1:ncol(x)){
  print(sd(x[,i]), 3)
}
print(round(cor(x), 2))
print(cor.test(x[,1], x[,3], alternative="two.sided", method="pearson", exact=NULL, conf.level = 0.95))
plot(x)
stick_fa = factanal(x, factor=2, method="mls", scores="regression")
print(stick_fa)
print(stick_fa$scores)
