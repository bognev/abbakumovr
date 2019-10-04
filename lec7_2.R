x = read.table("/home/zabolotsky/abbakumov_r/R_занятие_06_регрессия/03_ts_graphs/wine_Austral.dat", header=T, sep="\t")
print(names(x))
print(head(x))
plot(x$sweet, type="l")
x = read.table("/home/zabolotsky/abbakumov_r/R_занятие_06_регрессия/04_series_g/series_g.csv", header=T, sep=";")
par(mfrow=c(1,2))
plot(x$series_g, type="l")
log_series_g = log(x$series_g)
plot(log_series_g, type="l")
time_ = 1:(144+12)
month_01 = rep(c(1,0,0,0,0,0,0,0,0,0,0,0), (12 + 1))
month_02 = rep(c(0,1,0,0,0,0,0,0,0,0,0,0), (12 + 1))
month_03 = rep(c(0,0,1,0,0,0,0,0,0,0,0,0), (12 + 1))
month_04 = rep(c(0,0,0,1,0,0,0,0,0,0,0,0), (12 + 1))
month_05 = rep(c(0,0,0,0,1,0,0,0,0,0,0,0), (12 + 1))
month_06 = rep(c(0,0,0,0,0,1,0,0,0,0,0,0), (12 + 1))
month_07 = rep(c(0,0,0,0,0,0,1,0,0,0,0,0), (12 + 1))
month_08 = rep(c(0,0,0,0,0,0,0,1,0,0,0,0), (12 + 1))
month_09 = rep(c(0,0,0,0,0,0,0,0,1,0,0,0), (12 + 1))
month_10 = rep(c(0,0,0,0,0,0,0,0,0,1,0,0), (12 + 1))
month_11 = rep(c(0,0,0,0,0,0,0,0,0,0,1,0), (12 + 1))
month_12 = rep(c(0,0,0,0,0,0,0,0,0,0,0,1), (12 + 1))
log_series_g[145:(144+12)] = NA
log_ser_g2 = data.frame(log_series_g, time_, month_01, month_02,
                        month_03, month_04, month_05, month_06,
                        month_07, month_08, month_09, month_10,
                        month_11, month_12)
res_01 = lm(log_series_g ~ time_ + month_01 + month_02 +
            month_04 + month_05 + month_06 +
            month_07 + month_08 + month_09 + month_10 +
            month_11 + month_12, log_ser_g2)
print(res_01)
print(summary(res_01))
print(res_01$fitted.values)
plot(log_ser_g2$log_series_g, type="l", col="green")
lines(res_01$fitted.values, col="red")

log_predict = predict.lm(res_01, log_ser_g2)
plot(log_ser_g2$log_series_g, type="l", col="green")
lines(log_predict, col="red")

pred = exp(log_predict)
plot(pred, type="l", col="green")
lines(x$series_g, type="l", col="red")
