names_list_file   <- './features.txt'
test_X_data_file  <- './test/X_test.txt'
train_X_data_file <- './test/X_test.txt'
test_y_data_file  <- './test/y_test.txt'
train_y_data_file <- './test/y_test.txt'

source('data.loader.R')

test_data <- data.loader(test_X_data_file ,names_list_file,headers_col=2,test_y_data_file ,row_names_col=1)
train_data <- data.loader(train_X_data_file,names_list_file,headers_col=2,train_y_data_file,row_names_col=1)
