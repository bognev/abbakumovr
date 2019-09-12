setwd("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_01_2")
setwd("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_01_2/Swiss")

Swiss.01 = read.table("Swiss Bank Notes.dat", header=TRUE)
origin = c(rep(1,100), rep(0,100))
Swiss.02 = data.frame(Swiss.01, origin)
print(typeof(Swiss.02))

#rm(Swiss.02)
print(names(Swiss.02))
print(dim(Swiss.02))
print(nrow(Swiss.02))
print(ncol(Swiss.02))
print(str(Swiss.02))
print(summary(Swiss.02))

hist(Swiss.02$dist_up, breaks=18)
hist(Swiss.02$Diag, breaks=18, probability = TRUE)

barplot(VADeaths, beside=TRUE)

groupsizes = c(18, 30, 32, 10, 10)
labels = c("A", "B", "C", "D","E")
pie(groupsizes, labels)

x = c(1,2,3,4)
y = c(1,2,3,4,5,6,7)
#print(x+y)
print(y[c(T)])
print(y>6)
print(sum(y[y>3]))
print(y[3])
print(y[-3])
z.1 = 1:10+1
z.2 = 1:(10+1)
print(z.1)
print(z.2)

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3)
print(mdat)
print(mdat[1:2,1:2])
plot(Swiss.01$Length,Swiss.02$Diag, type='n')
points(Swiss.02$Length[Swiss.02$origin==TRUE],Swiss.02$Diag[Swiss.02$origin==TRUE], pch=3, col=3)
points(Swiss.02$Length[Swiss.02$origin==FALSE],Swiss.02$Diag[Swiss.02$origin==FALSE], pch=1, col=2)

plot(Swiss.02)
pairs(Swiss.02)#диаграмма рассеивания

Swiss.02$origin = as.factor(Swiss.02$origin)
print(is.factor(Swiss.02$origin))
print(class(Swiss.02$origin))

plot(Swiss.02$origin,Swiss.02$Diag)#ящик с усами

