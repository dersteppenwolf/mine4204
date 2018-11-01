rm(list=ls())

clc <- function() cat(rep("\n", 50))

#clc()

#' add(10,1) 
add <- function (x, y){
  x + y
} 

print(add(3,4))
# print(add(9,90))
print("**************************")
print(getwd())
# print(regexpr( getwd(), "Laboratorio_R"   )  )
if ( !regexpr( getwd(), "Laboratorio_R"   )    ) {
  lab_path <- paste( getwd() , "/mine4204/Laboratorio_R" , sep="")
  print(lab_path)
  setwd(lab_path)
  print(getwd())
}

getMaxValueFromColumn <- function (index ) {
  print("**************************")
  print(" getMaxValueFromColumn   *")
  #print(paste("index: ", index ))
  column <- df[,index]
  #print(column)
  maxValue <- .Machine$double.xmin
  for(i in column){
    #print(i)
    if (i>maxValue){
      maxValue = i
    }
  }
  print("**************************")
  maxValue
}

getMinValueFromColumn <- function (index ) {
  print("**************************")
  print(" getMinValueFromColumn   *")
  #print(paste("index: ", index ))
  column <- df[,index]
  #print(column)
  minValue <- .Machine$double.xmax
  for(i in column){
    #print(i)
    if (i<maxValue){
      minValue = i
    }
  }
  print("**************************")
  minValue
}

df <- read.table("datos.txt",  header = TRUE)
print(df)

getMaxValueFromColumn(2)
maxValue <- getMaxValueFromColumn(2)
print(paste("maxValue: ", maxValue ))
maxValue <- getMaxValueFromColumn(4)
print(paste("maxValue: ", maxValue ))

minValue <- getMinValueFromColumn(2)
print(paste("minValue: ", minValue ))
minValue <- getMinValueFromColumn(4)
print(paste("minValue: ", minValue ))






print("**************************")
