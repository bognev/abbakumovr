set.seed(1234)
n_obs = 1000
sd_1 = 0.06
x1 = rnorm(n_obs, mean=0.2, sd = sd_1)
y1 = rnorm(n_obs, mean=0.38, sd = sd_1)

x2 = rnorm(n_obs, mean=0.49, sd = sd_1)
y2 = rnorm(n_obs, mean=0.25, sd = sd_1)

x3 = rnorm(n_obs, mean=0.62, sd = sd_1)
y3 = rnorm(n_obs, mean=0.42, sd = sd_1)

x4 = rnorm(n_obs, mean=0.42, sd = sd_1)
y4 = rnorm(n_obs, mean=0.78, sd = sd_1)

x5 = rnorm(n_obs, mean=0.85, sd = sd_1)
y5 = rnorm(n_obs, mean=0.75, sd = sd_1)

x_0 = c(x1, x2, x3, x4, x5)
y_0 = c(y1, y2, y3, y4, y5)
data_0 = cbind(x_0, y_0)

colnames(data_0) = c("x", "y")

x_start = c(0.5, 0.41, 0.43, 0.62, 0.38)
y_start = c(0.2, 0.22, 0.32, 0.36, 0.71)

centers_0 = cbind(x_start, y_start)

clus_1 = kmeans(data_0, centers=centers_0, iter.max = 1, algorithm = "Lloyd")
clus_2 = kmeans(data_0, centers=clus_1$centers, iter.max = 1, algorithm = "Lloyd")
clus_3 = kmeans(data_0, centers=clus_2$centers, iter.max = 1, algorithm = "Lloyd")

clus_4 = kmeans(data_0, centers=clus_3$centers, iter.max = 1, algorithm = "Lloyd")
clus_5 = kmeans(data_0, centers=clus_4$centers, iter.max = 1, algorithm = "Lloyd")
clus_6 = kmeans(data_0, centers=clus_5$centers, iter.max = 1, algorithm = "Lloyd")

clus_7 = kmeans(data_0, centers=clus_6$centers, iter.max = 1, algorithm = "Lloyd")
clus_8 = kmeans(data_0, centers=clus_7$centers, iter.max = 1, algorithm = "Lloyd")
clus_9 = kmeans(data_0, centers=clus_8$centers, iter.max = 1, algorithm = "Lloyd")
clus_10 = kmeans(data_0, centers=clus_9$centers, iter.max = 1, algorithm = "Lloyd")
clus_11 = kmeans(data_0, centers=clus_10$centers, iter.max = 1, algorithm = "Lloyd")
clus_12 = kmeans(data_0, centers=clus_11$centers, iter.max = 1, algorithm = "Lloyd")
clus_13 = kmeans(data_0, centers=clus_12$centers, iter.max = 1, algorithm = "Lloyd")
clus_14 = kmeans(data_0, centers=clus_13$centers, iter.max = 1, algorithm = "Lloyd")
clus_15 = kmeans(data_0, centers=clus_14$centers, iter.max = 1, algorithm = "Lloyd")

cex_1 = 0.2
col_1 = c("green", "blue", "cyan", "darkorchid", "darkgoldenrod")

plot(data_0, col="blue", pch=19, main = "Iteration 0", cex=cex_1)
points(x_start, y_start, col="red", cex=cex_1*9, pch=19)

plot(data_0, col="blue", pch=19, main = "Iteration 0", cex=cex_1)
plot(data_0, col=col_1[clus_1$cluster], pch=19, main = "Iteration 0", cex=cex_1)
points(x_start, y_start, col="red", cex=cex_1*9, pch=19)

plot(data_0, col="blue", pch=19, main = "Iteration 0", cex=cex_1)
plot(data_0, col=col_1[clus_15$cluster], pch=19, main = "Iteration 0", cex=cex_1)
points(clus_15$centers, col="red", cex=cex_1*9, pch=19)









