olivia = read.table("/home/bognev/abbakumovr/R_data_set/08_Olive Oils/olive.txt", header=T, sep=",")
print(names(olivia))
print(dim(olivia))
test_num = sample(1:nrow(olivia), 0.2*nrow(olivia), replace=FALSE)
test = olives[test_num,4:ncol(olives)]
train = olives[-test_num,4:ncol(olives)]
cl = olivia$region[-test_num]
library(class)
z = knn(train, test, cl, k=3)
print(table(z, olivia$region[test_num]))
