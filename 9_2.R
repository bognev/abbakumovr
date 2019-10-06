library(class)
sales = read.table("/home/bognev/abbakumovr/R_8_1_knn/DISCRIM_0_new_R.txt", header=F, sep=";")
colnames(sales) = c("respond", "produc1", "product2", "product3", "product4", "level")
print(head(sales))
print(dim(sales))
print(summary(sales))
#set.seed(42)
test_num = sample(1:nrow(sales), 0.2*nrow(sales), replace=FALSE)
test = sales[test_num, 2:5]
train = sales[-test_num, 2:5]
cl = sales$level[-test_num]
z = knn(train, test, cl, k=3)
print(table(sales$level[test_num]))
print(table(z, sales$level[test_num]))
a = rep(0, 15)
for(i in 1:15){
  z = knn(train, test, cl, k=i)
  a[i] = sum(z != sales$level[test_num])
}
print(a)
