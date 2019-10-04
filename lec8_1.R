x = read.table("/home/zabolotsky/abbakumov_r/R_занятие_06_регрессия/03_ts_graphs/brazil_econ_monthly.dat", header=F, sep=";")
colnames(x) = c("V1","V2","V3","year","month","date")
print(names(x))
print(head(x))
print(tail(x))
print(dim(x))
par(mfrow=c(3,1))
plot(x$V1, type="l")
plot(x$V2, type="l")
plot(x$V3, type="l")
plot(x$red, type="l")
log_red = log(x$red)
plot(log_red, type="l")
time_ = 1:(168+12)
time_2 = time_^2
month_01 = rep(c(1,0,0,0,0,0,0,0,0,0,0,0), (14 + 1))
month_02 = rep(c(0,1,0,0,0,0,0,0,0,0,0,0), (14 + 1))
month_03 = rep(c(0,0,1,0,0,0,0,0,0,0,0,0), (14 + 1))
month_04 = rep(c(0,0,0,1,0,0,0,0,0,0,0,0), (14 + 1))
month_05 = rep(c(0,0,0,0,1,0,0,0,0,0,0,0), (14 + 1))
month_06 = rep(c(0,0,0,0,0,1,0,0,0,0,0,0), (14 + 1))
month_07 = rep(c(0,0,0,0,0,0,1,0,0,0,0,0), (14 + 1))
month_08 = rep(c(0,0,0,0,0,0,0,1,0,0,0,0), (14 + 1))
month_09 = rep(c(0,0,0,0,0,0,0,0,1,0,0,0), (14 + 1))
month_10 = rep(c(0,0,0,0,0,0,0,0,0,1,0,0), (14 + 1))
month_11 = rep(c(0,0,0,0,0,0,0,0,0,0,1,0), (14 + 1))
month_12 = rep(c(0,0,0,0,0,0,0,0,0,0,0,1), (14 + 1))
log_red[169:(168+12)] = NA
log_red_2 = data.frame(log_red, time_, time_2, month_01, month_02,
                       month_03, month_04, month_05, month_06,
                       month_07, month_08, month_09, month_10,
                       month_11, month_12)
res_01 = lm(log_red ~ time_ + time_2 + month_01 + month_02 +
              month_04 + month_05 + month_06 +
              month_07 + month_08 + month_09 + month_10 +
              month_11 + month_12, log_red_2)
print(res_01)
print(summary(res_01))
print(res_01$fitted.values)
plot(log_red_2$log_red, type="l", col="green")
lines(res_01$fitted.values, col="red")

log_predict = predict.lm(res_01, log_red_2)
plot(log_red_2$log_red, type="l", col="green")
lines(log_predict, col="red")

pred = exp(log_predict)
plot(pred, type="l", col="green")
lines(x$red, type="l", col="red")

plot(res_01)

hist(res_01$residuals)
hist(rstudent(res_01))
cook_d = cooks.distance(res_01)#calculate how strong will change estimate of y if we delete observation
plot(cook_d, ylab="Cooks distances")
abline(h=1, col="red")
abline(h=1/168, col="blue")
seas_2 = rep(1:12, 16)[1:168]
boxplot(rstudent(res_01)~seas_2)
print("Теорема Гаусса-Маркова - оценки параметров модели являются несмещенными,\n состоятельными и наиболее эффективными оценками")
#durbinWatsonTest
#H0: there is no correlation amomg residuals, they are indepentednt
#H1: residuals are autocorrelated
install.packages("car")
library("car")
durbinWatsonTest(res_01, method="normal")
