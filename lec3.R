setwd("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_01_2/town_1959_2")
town.1959 = read.table("town_1959_2.csv", header=T, sep=",", fileEncoding= "cp1251")
print(summary(town.1959))
print(summary(town.1959[3:1004,3]))
print(sum(town.1959[,3]<52.93)*100/1004)
hist(town.1959[,3], breaks=44)
hist(log(town.1959[,3]), breaks=44)
#методы определения типичного значения
#лучше медиана чем среднее арифметическое
#усеченное среднее
#если распределения данных примерно колоколообразны подойдет среднее арифметическое
#если распределения данных не симметрично, то лучше медиана
print(mean(town.1959[,3]))
print(median(town.1959[,3]))
print(mean(town.1959[,3]), trim = 0.025)


