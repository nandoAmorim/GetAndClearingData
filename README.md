MarkDown file for get and clearing data project
========================================================

This is an R Markdown document for documenting and explain the final project for get ans clearing data project.

The project was implemented using **Reference Classes** and divided in 3 files:
* run_analysis.R: script calling the "object merger" that creates the output.txt file uploaded to project page in coursera.org page.
* data.loader.R: contains the Classes for loading and aggregating the data from all the files needed to construct the tidy data table with all crude data.
* data.merger.R: contains a class that performs the reading of the train and test data, using the class loader. Performs the concatenation of the tables, select the needed data (means and standard-deviations features), and average calculations.

## The run_analysis.R explained:

Loads **data.loader.R** and **data.merger.R** files to memory and prepares the object calls.
As needed to the project, initialize a variable "selections" to auxiliate in features separation to result data set to the tidy result file.
Called a merger class to construct an object that executes the activities to load, calculate and export the data sets.

## The data.loader.R explained
The constructor retrieves the source, the index to headers column data from the file, the the paste function concatenates strings to compose the file names for tha files read with the read.table() function.
At constructor method of loader class used read.table to retrieve the data to a data.frame. Called a class composed to read the headers (built in file) from the file and assigned to the dataframe using the names(df) method. Used another class (built in file) to read the lables file and added to data.frame. Other classes reads the subjects and lable names files. The subject datawas addes directly in data.frame structure. To correspond a label to an "activity" name used the merge function with the two data sets, creating an "activity" column that corresponds a name to a label. 
The crude data was assigned to the field "data" of the class data.loader.

## The data.merger.R explained
The constructor retrieves an dataframe with the 'train' data and other with 'test' data, concatenates the two dataframes with rbind function. For memory keeping altered the values of auxiliar variables to an integer. Then cled the output method to build the output text file.
The output method uses the auxiliar method "selection" to apply the constraints to column names. As needed for the task, the selection was made comparing the names(df) method substrings to the substrings 'mean()' and 'std()', using the grepl function on the names of df I could get a boolean vector for na names containing the match to the two paterns and used an logic OR to select the names. The logic OR was used to add the 'activity' and 'subject' to the output data.frame.
Then the dataframe is coerced into an data.table (library - data.table) to use the better memory efficiency method and application of function mean by the columns 'activity' and 'subjects'.
The write.scv function was used to produce the text file for the solution.

```{r}
DT <- data.table(df)
DT[, lapply(.SD, sum), by = c('activity','subject')]
```