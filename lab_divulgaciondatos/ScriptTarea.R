library(sdcMicro)

df2 <- read.table("/Users/ivanmatis/Downloads/University/security/mine4204/lab_divulgaciondatos/dataset_tarea.csv", header=TRUE, sep = ",") 

nrow(df2)
ncol(df2)

print(df2)


ff <- freqCalc(df2, keyVars=c(1,2,3,4) , w=34) 
print(cbind(x,ff$fk,ff$Fk))

