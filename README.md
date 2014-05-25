MarkDown file for get and clearing data project
========================================================

This is an R Markdown document for documenting and explain the final project for get ans clearing data project.

The project was implemented using **Reference Classes** and divided in 3 files:
* run_analysis.R: script calling the "object merger" that creates the output.txt file uploaded to project page in coursera.org page.
* data.loader.R: contains the Classes for loading and aggregating the data from all the files needed to construct the tidy data table with all crude data.
* data.merger.R: contains a class that performs the reading of the train and test data, using the class loader. Performs the concatenation of the tables, select the needed data (means and standard-deviations features), and average calculations.

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r fig.width=7, fig.height=6}
plot(cars)
```

