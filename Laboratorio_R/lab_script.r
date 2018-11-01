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

# índice de la fila con el valor más alto en un campo particular 
# (recibe el índice del campo/ columna que se quiere revisar)
# retorna un vector con todos los índices de las filas que obtuvieron el máximo valor
getIndexOfRowsWithMaxValueInColumn <- function (columnIdx, df  ){
  print("**************************")
  print(paste(" getIndexOfRowsWithMaxValueInColumn   columnIdx: ", columnIdx ))
  column <- df[,columnIdx]
  maxValue <- .Machine$double.xmin
  rowIdx = 0
  rowsWithMaxValue  <- c()
  for(i in column){
    rowIdx = rowIdx + 1
    if (i>maxValue){
      maxValue = i
      rowsWithMaxValue <- c(rowIdx)    
      #print(paste(" val    ", i, " : ",  rowIdx  ))
    }else if (  i ==  maxValue ){
      rowsWithMaxValue <- c(rowsWithMaxValue, rowIdx)
      #print(paste(" val    ", i, " : ",  rowIdx  ))
      #print(rowsWithMaxValue)
    }
  }
  print("**************************")
  rowsWithMaxValue
}


######################################
# read data
######################################
print("**************************")
data <- read.table("datos.txt",  header = TRUE)
print(data )
print("**************************")
dataColumnsWithoutId = data[, 2 : length(data)  ]
print( dataColumnsWithoutId )
print("**************************")

######################################
# test
######################################


maxValue <- getMaxValueFromColumn(2, dataColumnsWithoutId)
print(paste("maxValue: ", maxValue ))
maxValue <- getMaxValueFromColumn(4, dataColumnsWithoutId)
print(paste("maxValue: ", maxValue ))

minValue <- getMinValueFromColumn(2, dataColumnsWithoutId)
print(paste("minValue: ", minValue ))
minValue <- getMinValueFromColumn(4, dataColumnsWithoutId)
print(paste("minValue: ", minValue ))

averageValue <- getAverageValueFromColumn(2, dataColumnsWithoutId)
print(paste("averageValue: ", averageValue ))
averageValue <- getAverageValueFromColumn(4, dataColumnsWithoutId)
print(paste("averageValue: ", averageValue ))




indexOfMaxAverage<- getIndexOfColumnWithMaxAverageValue(dataColumnsWithoutId)
print(paste("indexOfMaxAverage: ", indexOfMaxAverage ))



rowIdx <- getIndexOfRowsWithMaxValueInColumn(1, dataColumnsWithoutId)
print("rows with max value: ")
print(rowIdx )

rowIdx <- getIndexOfRowsWithMaxValueInColumn(5, dataColumnsWithoutId)
print("rows with max value: ")
print(rowIdx )

rowIdx <- getIndexOfRowsWithMaxValueInColumn(7, dataColumnsWithoutId)
print("rows with max value: ")
print(rowIdx )



print("**************************")
