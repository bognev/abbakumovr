setwd("/home/zabolotsky/PycharmProjects/abbakumov/Shad_Python_01_2/town_1959_2")
town = read.table("town_1959_2.csv", header=T, sep=",", fileEncoding= "cp1251")
print(summary(town))
print(summary(town[3:1004,3]))
hist(town[,3])
hist(log(town[,3]), breaks=44)
#check normality of data
shapiro.test(log(town[,3]))
#if p < alpha - deny hypothesis
#if p > alpha - accept hypothesis
#p - p-value; alpha - statistical significanse usually 0.05, 0.005, 0.001
