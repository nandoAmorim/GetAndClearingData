
data.loader <- setRefClass(Class = "data.loader",
                  fields = list(data = 'data.frame')
)

data.loader$methods(
      initialize=function(data_path,file_of_headers,headers_col=1,file_of_row_names,row_names_col=1){
            file_name <- data_path
            data  <<- read.table(file=file_name,header=F)
            headers   <- data.headers(file_of_headers,headers_col)
            names(data) <<- headers$name_list
            rows   <- data.rowNames(file_of_row_names,row_names_col)
            data[,'label'] <<- rows$name_list
            
      }
)

data.headers <- setRefClass(Class = "data.headers",
                   fields = list(name_list = "character")             
)
data.headers$methods(
     initialize=function(file_of_headers,column=1){
           hdr <- read.table(file=file_of_headers,header=F)
           name_list <<- as.vector(hdr[,column])
     }
)

data.rowNames <- setRefClass(Class = "data.rowNames",
                            fields = list(name_list = "character")             
)
data.rowNames$methods(
  initialize=function(file_of_row_names,col=1){
    hdr <- read.table(file=file_of_row_names,header=F)
    name_list <<- as.character(as.vector(hdr[,col]))
  }
)