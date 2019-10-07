library(randomForest)
wine = read.table("/home/zabolotsky/abbakumov_r/R_data_set/04_Классификация вин/Wine.txt", header=T, sep="", dec=".")
names(wine) = c("Alcohol","Malic acid","Ash","Alcalinity","Magnesium","Total phenols","Flavanoids",
                "Nonflavanoid","Proanthocyanins","Color","Hue","OD280","Proline", "Sort")
print(tail(wine))
test_num = sample(1:nrow(wine), 0.2*nrow(wine), replace=FALSE)
test = wine[test_num,1:13]
train = wine[-test_num,1:13]
y = wine$Sort[-test_num]
y1 = as.factor(y)
print(table(y))
#set.seed(1237)
ntree = 40
nodesize = 1
rf_res = randomForest(train, y1, ntree=ntree, mtry=floor(sqrt(ncol(wine))), 
                      replace=TRUE, nodesize = nodesize, 
                      importance=TRUE, localImp=FALSE,
                      proxomoty=FALSE, norm.votes = TRUE, 
                      do.trace = 1, keep.forest = TRUE, 
                      corr.bias = FALSE, keep.inbag=FALSE)
y_pred = predict(rf_res, newdata = train)
print(table(y_pred, wine$Sort[-test_num]))
y_pred = predict(rf_res, newdata = test)
print(table(y_pred, wine$Sort[test_num]))
varImpPlot(rf_res, sort=F)
varUsed(rf_res, by.tree=FALSE, count=TRUE)
