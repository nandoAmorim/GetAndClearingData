library(data.table)
data.merger <- setRefClass(Class = "data.merger",
                           fields = list(data   = 'data.frame',
                                         data_output = 'data.table'     
                                    )
)

data.merger$methods(
  initialize=function(){  
     train_data  <- data.loader('train', headers_col=2, row_names_col=1)
     test_data <- data.loader('test',headers_col=2, row_names_col=1)
     data <<- rbind(train_data$data, test_data$data)
     train_data <- 0
     test_data  <- 0
     output(selections)
     
  },
  output=function(fields){
     sel <- selection(fields)
     result <- data[sel]
     data_output <<- data.table(result)
     data_output <<- data_output[,lapply(.SD, mean), by=c('activity','subject')]
     write.csv(data_output,file='output.txt',sep=',',row.names=F)
  },
  selection=function(fields){
      result <- as.vector(rep(F,length(names(data))))
      for(field in fields){
         result <- result |grepl(field,names(data),fixed=T)
      }
      result <- result |grepl('activity',names(data),fixed=T)
      result <- result |grepl('subject',names(data),fixed=T)
      return(result)
  }
)