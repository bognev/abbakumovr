x = read.table("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_06_2/Albuquerque/Albuquerque Home Prices_data.txt", header=T, sep="")
print(summary(x))
x$AGE[x$AGE == -9999] = NA
x$TAX[x$TAX == -9999] = NA
print(summary(x))
print(names(x))
print(dim(x))
itog1 = lm(x$PRICE ~ x$SQFT + x$AGE + x$FEATS + x$NE + x$CUST + x$COR + x$TAX)
print(summary(itog1))
itog2 = lm(x$PRICE ~ x$SQFT + x$CUST+ x$TAX)
print(summary(itog2))
