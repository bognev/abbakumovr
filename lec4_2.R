beverage = read.table("/home/zabolotsky/PycharmProjects/abbakumov/Shad_AD on Python_1_01/1_beverage/beverage_r.csv", header=T, sep=";", fileEncoding= "cp1251")
print(dim(beverage))
print(names(beverage))

summ1 = kmeans(beverage[,2:9], 3, iter.max = 100)
print(names(summ1))
print(t(summ1$centers))

wss = (nrow(beverage[,2:9])-1)*sum(apply(beverage[,2:9],2,var))

for(i in 2:15) {
  wss[i] = kmeans(beverage[,2:9], centers=i, nstart=500)$tot.withinss
}
plot(1:15, wss, type='b')

