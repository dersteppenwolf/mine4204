library(sdcMicro)


df2 <- read.table("/Users/ivanmatis/Downloads/University/security/mine4204/lab_divulgaciondatos/data4swap.txt", header=TRUE) 
print(df2)

print("**************************")
print("**************************")

df2Swap <- rankSwap(df2, variables=c("tarea5","tarea7"),
                          TopPercent=20, BottomPercent=20, P = 15)

print(df2Swap)

print("**************************")
print("microagregacion")
print("**************************")

df3 <- francdat[,c(2,4,5,6)]
print(df3)
df3Resultado <- microaggregation(df3, method ="single",aggr = 3) 

print(df3Resultado$mx)

print("microagregacion mdav")
print("**************************")
df3Resultadomdav <- microaggregation(df3, method ="mdav",aggr = 3) 
print(df3Resultadomdav$mx)



print("**************************")
print("ruido")
print("**************************")
df4 <- francdat[,c(1,3,7)]
print(df4)
df4Resultado <- addNoise(df4,method="additive") 
print(df4Resultado$xm)

df4Resultadomdav <- microaggregation(df4, method ="mdav",aggr = 3) 
print(df4Resultadomdav$mx)

dfNivelPerdida <- dUtility(obj=df4, xm=df4Resultado$xm, method="IL1")
print(dfNivelPerdida)

dfNivelPerdida2 <- dUtility(obj=df4, xm=df4Resultadomdav$mx, method="IL1")
print(dfNivelPerdida2)
