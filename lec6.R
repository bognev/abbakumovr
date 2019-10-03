albuquerque = read.table("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_06_2/Albuquerque/Albuquerque Home Prices_data.txt", header=T, sep="")
print(summary(albuquerque))
albuquerque$AGE[albuquerque$AGE == -9999] = NA
albuquerque$TAX[albuquerque$TAX == -9999] = NA
print(summary(albuquerque))
x1 = albuquerque$PRICE[albuquerque$NE == 1]
x2 = albuquerque$PRICE[albuquerque$NE == 0]
#Mood's median test
m = median(c(x1, x2))
f11 = sum(x1 > m)
f12 = sum(x2 > m)
f21 = sum(x1 <= m)
f22 = sum(x2 <= m)
table = matrix(c(f11,f12,f21,f22), nrow=2, ncol=2)
print(chisq.test(table))
print(wilcox.test(x1,x2, alternative="two.sided", paired=FALSE, exact=TRUE, correct=FALSE))
print(cor(albuquerque$PRICE, albuquerque$SQFT))
albuquerque = na.omit(albuquerque)
print(cor(albuquerque$AGE, albuquerque$TAX))
print(cor.test(albuquerque$AGE, albuquerque$TAX, method="pearson"))
