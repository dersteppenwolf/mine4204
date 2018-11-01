rm(list=ls())

######################################
# set path 
######################################
print("**************************")
print(getwd())
# print(regexpr( getwd(), "Laboratorio_R"   )  )
if ( !regexpr( getwd(), "Laboratorio_R"   )    ) {
  lab_path <- paste( getwd() , "/mine4204/Laboratorio_R" , sep="")
  print(lab_path)
  setwd(lab_path)
  print(getwd())
}

######################################
# functions for lab
######################################
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

getAverageValueFromColumn <- function (index ) {
  print("**************************")
  print(" getAverageValueFromColumn   *")
  #print(paste("index: ", index ))
  column <- df[,index]
  #print(column)
  total <- 0
  for(i in column){
      total = total + i
    
  }
  print(length(column))
  averageValue = total / length(column)
  print("**************************")
  averageValue
}

######################################
# read data
######################################
df <- read.table("datos.txt",  header = TRUE)
print(df)

######################################
# test
######################################


maxValue <- getMaxValueFromColumn(2)
print(paste("maxValue: ", maxValue ))
maxValue <- getMaxValueFromColumn(4)
print(paste("maxValue: ", maxValue ))

minValue <- getMinValueFromColumn(2)
print(paste("minValue: ", minValue ))
minValue <- getMinValueFromColumn(4)
print(paste("minValue: ", minValue ))

averageValue <- getAverageValueFromColumn(2)
print(paste("averageValue: ", averageValue ))
averageValue <- getAverageValueFromColumn(4)
print(paste("averageValue: ", averageValue ))






print("**************************")
