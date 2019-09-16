setwd(".")
meat = read.table("/home/zabolotsky/PycharmProjects/abbakumov/Shad_AD on Python_1_01/3_Protein Consumption in Europe/Protein Consumption in Europe_data.txt", header=T, sep="")
print(dim(meat))
print(names(meat))

wss = (nrow(meat[,2:10])-1)*sum(apply(meat[,2:10],2,var))
for(i in 2:15) {
  wss[i] = kmeans(meat_dist, centers=i, iter.max = 10, nstart=10, algorithm = "Lloyd")$tot.withinss
}
plot(1:15, wss, type='b')
meat[,2:10] = scale(meat[,2:10])
meat_dist = dist(meat[,2:10])
clust = kmeans(meat_dist, centers=2, iter.max = 10, nstart=10, algorithm = "Lloyd")
print(clust)
print(meat[clust$cluster==1, 1])
print(meat[clust$cluster==2, 1])



