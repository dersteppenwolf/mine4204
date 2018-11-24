library(sdcMicro)

df2 <- read.table("/Users/ivanmatis/Downloads/University/security/mine4204/lab_divulgaciondatos/dataset_tarea.csv", header=TRUE, sep = ",") 

nrow(df2)
ncol(df2)

print(df2)

# indice de la columnas
print ( grep("w", colnames(df2)) )

print ( grep("school", colnames(df2)) )
print ( grep("sex", colnames(df2)) )
print ( grep("address", colnames(df2)) )

#ff <- freqCalc(df2, keyVars=c(2,3,5) , w=35) 
#print(cbind(df2,ff$fk,ff$Fk))

# calcular frecuencias de las tipo category 

ff <- freqCalc(df2, keyVars=c('school', 'sex', 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob',
                              'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities',
                              'nursery', 'higher', 'internet', 'romantic') , w=35) 
print(cbind(df2,ff$fk,ff$Fk))


