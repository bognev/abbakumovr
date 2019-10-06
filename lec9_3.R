wines = read.table("/home/bognev/abbakumovr/R_data_set/wine_classification/Wine.txt", header=T, sep="")
print(summary(wines))
print(names(wines))
print(dim(wines))
test_num = sample(1:nrow(wines), 0.2*nrow(wines), replace=FALSE)
test = wines[test_num,1:13]
train = wines[-test_num,1:13]
cl = wines$Desired1.3.[-test_num]
library(class)
z = knn(train, test, cl, k=7)
print(table(z, wines$Desired1.3.[test_num]))
a = rep(0, 15)
for(i in 1:15){
  set.seed(42)
  z = knn(train, test, cl, k=i,prob=TRUE)
  a[i] = (sum(z != wines$Desired1.3.[test_num])*100)/length(test_num)
}
print(a)
