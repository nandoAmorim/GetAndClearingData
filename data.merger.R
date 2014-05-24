data.merger <- setRefClass(Class = "data.merger",
                           fields = list(data = 'data.frame')
)

data.merger$methods(
  initialize=function(){  
     train_data  <- data.loader('train', headers_col=2, row_names_col=1)
     test_data <- data.loader('test',headers_col=2, row_names_col=1)
     data <<- rbind(train_data$data, test_data$data)
     train_data <- 0
     test_data  <- 0
  },
  output=function(fields){
     sel <- selection(fields)
     result <- data[sel]
     return(result)
  },
  selection=function(fields){
      result <- as.vector(rep(F,length(names(data))))
      for(field in fields){
         result <- result |grepl(field,names(data),fixed=T)
      }
      result <- result |grepl('activity',names(data),fixed=T)
      print(result)
      return(result)
  }
)