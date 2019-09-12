set.seed(110)

sims = 1000

monty = rep(NA, sims)
car = rep(NA, sims)

for(i in 1:sims){
  doors = sample(c(1,0,0))
  car[i] = which(doors == 1)
  if(car[i] == 1){
    monty[i]=sample(c(2,3),1)
  }
  if(car[i] != 1){
    doors[1] = 1
    monty[i] = which(doors == 0)
  }
}

print(length(car[car==1 & monty == 2])/length(car[monty == 2]))
print(length(car[car==3 & monty == 2])/length(car[monty == 2]))

