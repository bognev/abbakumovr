albuquerque = read.table("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_06_2/Albuquerque/Albuquerque Home Prices_data.txt", header=T, sep="")
print(summary(albuquerque))
albuquerque$AGE[albuquerque$AGE == -9999] = NA
albuquerque$TAX[albuquerque$TAX == -9999] = NA
print(summary(albuquerque))
#H0 EX = EY
#H1 EX < EY
fligner.test(PRICE~COR, data=albuquerque)
t.test(albuquerque$PRICE[albuquerque$COR==0], albuquerque$PRICE[albuquerque$COR==1],
       alternative = "greater", paired=FALSE, var.equal = TRUE)
