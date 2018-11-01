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
getMaxValueFromColumn <- function (index , df ) {
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

getMinValueFromColumn <- function (index , df ) {
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

getAverageValueFromColumn <- function (index , df ) {
  print("**************************")
  print(paste(" getAverageValueFromColumn   index: ", index ))
  column <- df[,index]
  #print(column)
  total <- 0
  for(i in column){
      total = total + i
    
  }
  #print(length(column))
  averageValue = total / length(column)
  print("**************************")
  averageValue
}

# índice de la columna con el valor promedio más alto
getIndexOfColumnWithMaxAverageValue <- function (df ) {
  print("*******************************************")
  print(" getIndexOfColumnWithMaxAverageValue   *")
  maxAverage = 0
  indexOfMaxAverage = 0
  for(i in 1:length(df)) {
    averageValue <- getAverageValueFromColumn(i, df)
    print(averageValue)
    if (averageValue >= maxAverage){
      maxAverage = averageValue
      indexOfMaxAverage = i
    }
  }
  print("*******************************************")
  indexOfMaxAverage
}

######################################
# read data
######################################
data <- read.table("datos.txt",  header = TRUE)
print(data )

######################################
# test
######################################


maxValue <- getMaxValueFromColumn(2, data)
print(paste("maxValue: ", maxValue ))
maxValue <- getMaxValueFromColumn(4, data)
print(paste("maxValue: ", maxValue ))

minValue <- getMinValueFromColumn(2, data)
print(paste("minValue: ", minValue ))
minValue <- getMinValueFromColumn(4, data)
print(paste("minValue: ", minValue ))

averageValue <- getAverageValueFromColumn(2, data)
print(paste("averageValue: ", averageValue ))
averageValue <- getAverageValueFromColumn(4, data)
print(paste("averageValue: ", averageValue ))


dataColumnsWithoutId = data[, 2 : length(data)  ]
print( dataColumnsWithoutId )

indexOfMaxAverage<- getIndexOfColumnWithMaxAverageValue(dataColumnsWithoutId)
print(paste("indexOfMaxAverage: ", indexOfMaxAverage ))



print("**************************")
