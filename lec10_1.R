wines = read.table("/home/bognev/abbakumovr/R_data_set/wine_classification/Wine.txt", header=T, sep="")
print(summary(wines))
print(names(wines))
print(dim(wines))
test_num = sample(1:nrow(wines), 0.2*nrow(wines), replace=FALSE)
test = wines[test_num,1:13]
train = wines[-test_num,1:13]
cl = wines$Desired1.3.[-test_num]
library(rpart)
wines_res = rpart(Desired1.3. ~ ., data=wines[-test_num,], method="class", control=rpart.control(minsplit=10,
                                                                                   minbucket=5,
                                                                                   maxdepth=6), 
                  model=FALSE)
print(wines_res, digits=2)
library(rpart.plot)
rpart.plot(wines_res, type=1)
print(table(wines[,1], predict(wines_res, wines[, -1], type="class")))
print(table(wines[,1]))
