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


# calcular frecuencias de las tipo category 

ff <- freqCalc(df2, keyVars=c('school', 'sex', 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob',
                              'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities',
                              'nursery', 'higher', 'internet', 'romantic', 
                              "Medu", "Fedu", "traveltime", 
                              "studytime", "failures", "famrel", "freetime",
                              "goout",  "Dalc" , "Walc" , "health") , w=35) 
print(cbind(df2,ff$fk,ff$Fk))

print(ff)
#--------------------------
#  395 obs. violate 2-anonymity 
#  395 obs. violate 3-anonymity 
#--------------------------



#calculo del riesgo

rk <- indivRisk(ff)$rk
print (cbind(df2, ff$fk, ff$Fk, rk ))

print (rk)



#Anonimización variables cartegóricas

#mjob
df2[,10] <- globalRecode(df2[ ,10] , breaks=c(  -1, 2, 4 ) , labels=c( 1 ,2 ))

#fjob
df2[,11] <- globalRecode(df2[ ,11] , breaks=c(  -1, 2, 4 ) , labels=c( 1 ,2 ))

#reason
df2[,12] <- globalRecode(df2[ ,12] , breaks=c(  -1, 1, 3 ) , labels=c( 1 ,2 ))

#guardian
df2[,13] <- globalRecode(df2[ ,13] , breaks=c(  -1, 0, 2 ) , labels=c( 1 ,2 ))



# calcular frecuencias de las tipo category después de anonimización

ff <- freqCalc(df2, keyVars=c('school', 'sex', 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob',
                              'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities',
                              'nursery', 'higher', 'internet', 'romantic', 
                              "Medu", "Fedu", "traveltime", 
                              "studytime", "failures", "famrel", "freetime",
                              "goout",  "Dalc" , "Walc" , "health") , w=35) 

print(cbind(df2,ff$fk,ff$Fk))

#calculo del riesgo después de anonimización

rk <- indivRisk(ff)$rk
print (cbind(df2, ff$fk, ff$Fk, rk ))

# Local Suppression To Obtain K-Anonymity
localsupx <- kAnon(df2, keyVars=c('school', 'sex', 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob',
                                  'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities',
                                  'nursery', 'higher', 'internet', 'romantic', 
                                  "Medu", "Fedu", "traveltime", 
                                  "studytime", "failures", "famrel", "freetime",
                                  "goout",  "Dalc" , "Walc" , "health"), k=2)
plot(localsupx)
print(localsupx$xAnon)

newX <- cbind(localsupx$xAnon, df2$w);
print(newX)
print ( grep("w", colnames(newX)) )
newff <- freqCalc(newX, keyVars=c('school', 'sex', 'address', 'famsize', 'Pstatus', 'Mjob', 'Fjob',
                                  'reason', 'guardian', 'schoolsup', 'famsup', 'paid', 'activities',
                                  'nursery', 'higher', 'internet', 'romantic', 
                                  "Medu", "Fedu", "traveltime", 
                                  "studytime", "failures", "famrel", "freetime",
                                  "goout",  "Dalc" , "Walc" , "health") , w=29) 
print(cbind(newX,newff$fk,newff$Fk))

print(newff)
#--------------------------
#  0 obs. violate 2-anonymity 
# 252 obs. violate 3-anonymity 
#--------------------------

newrk <- indivRisk( newff )$rk
print (cbind(newX, newff$fk , newff$Fk , newrk ))
print(newrk)

 
###########################################
#Anonimización variables numéricas

# rankSwap
numDf  <- rankSwap(df2, variables=c( "age" , "absences",
                       "G1","G2", "G3" ),  
                   TopPercent=20, BottomPercent=20, P = 15)
  
   
   

