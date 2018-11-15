library(sdcMicro)


df2 <- read.table("/Users/ivanmatis/Downloads/University/security/mine4204/lab_divulgaciondatos/data4agr.txt", header=TRUE) 
print(df2)
dataAgregado <- groupAndRename(df2, var = "condicion", 
                                    before=c("neumonia","gripa"), after = c("respiratoria") ) 
print("************")
print(dataAgregado)

ffagr <- freqCalc(dataAgregado, keyVars=c(2,3,4))   
print("************")
print(ffagr$fk)

