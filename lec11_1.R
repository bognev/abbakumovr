library(gbm)
wine = read.table("/home/zabolotsky/abbakumov_r/R_data_set/04_Классификация вин/Wine.txt", header=T, sep="", dec=".")
names(wine) = c("Alcohol","Malic acid","Ash","Alcalinity","Magnesium","Total phenols","Flavanoids",
                "Nonflavanoid","Proanthocyanins","Color","Hue","OD280","Proline", "Sort")
print(tail(wine))
test_num = sample(1:nrow(wine), 0.2*nrow(wine), replace=FALSE)
test = wine[test_num,]
train = wine[-test_num,]
y = wine$Sort[-test_num]
y1 = as.factor(y)
print(table(y))
#set.seed(1237)
n.tree = 500
nodesize = 10
gbm_res = gbm(Sort~., data=train, distribution="gaussian", n.tree=n.tree, shrinkage = 0.05, 
              interaction.depth = 5, bag.fraction = 0.66, n.minobsinnode = nodesize,
              cv.folds = 0, keep.data = TRUE, verbose=TRUE)
y_pred_test = predict(gbm_res, newdata = test, n.trees = 80)
print(head(y_pred_test))
y_pred_test2 = rep(0, nrow(test))
y_pred_test2[(y_pred_test > 0.5 & y_pred_test < 1.5)] = 1
y_pred_test2[y_pred_test >= 1.5] = 2
print(table(test$Sort, y_pred_test2))
