
data.loader <- setRefClass(Class = "data.loader",
                  fields = list(data = 'data.frame')
)

data.loader$methods(
      initialize=function(data_source, headers_col=1, row_names_col=1){
            file_name = eval(paste('./',data_source,'/X_',data_source,'.txt', sep=''))
            data <<- read.table(file=file_name,header=F)
            headers <- data.headers(data_source,headers_col)
            names(data) <<- headers$name_list
            labels <- data.activity.labels(data_source,row_names_col)
            data[,'label'] <<- labels$label_list
            subject <- data.subjects(data_source)
            data[,'subject'] <<- subject$subject_list
            factors <- data.activity.factors()
            names(factors$factor_list) <- c('label','activity')
            data <<- merge(data, factors$factor_list)
      }
)

data.headers <- setRefClass(Class = "data.headers",
                   fields = list(name_list = "character")             
)
data.headers$methods(
     initialize=function(data_source, column=1){
           file_of_headers <- './features.txt'
           hdr <- read.table(file=file_of_headers,header=F)
           name_list <<- as.vector(hdr[,column])
     }
)

data.activity.labels <- setRefClass(Class = "data.activity.labels",
                            fields = list(label_list = "character")             
)
data.activity.labels$methods(
  initialize=function(data_source, col=1){
    file_of_row_names <- eval(paste('./',data_source,'/y_',data_source,'.txt', sep=''))    
    hdr <- read.table(file=file_of_row_names,header=F)
    label_list <<- as.character(as.vector(hdr[,col]))
  }
)

data.activity.factors <- setRefClass(Class = "data.activity.factors",
                                    fields = list(factor_list = "data.frame")             
)
data.activity.factors$methods(
  initialize=function(){
    file_of_factors <- './activity_labels.txt'
    factor_list <<- read.table(file=file_of_factors,header=F)
  }
)

data.subjects <- setRefClass(Class = "data.subjects",
                                    fields = list(subject_list = "character")             
)
data.subjects$methods(
  initialize=function(data_source, col=1){
    file_name <- eval(paste('./',data_source,'/subject_',data_source,'.txt', sep=''))    
    hdr <- read.table(file=file_name,header=F)
    subject_list <<- as.character(as.vector(hdr[,col]))
  }
)
