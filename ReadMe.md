#Course Project
* Getting and Cleaning Data
* 25 July 2015

## Purpose
The purpose of this project was to merge, aggregate and tidy data captured in the "Human Activity Recognition Using Smartphones Dataset" experiment for further analysis. To this end, an R script was created and run. The outputs of the project are:

1. run_analysis.R -- the R script.
2. project1.txt -- the output file. 
3. Readme.md -- this file.
4. CodeBook.md -- the data dictionary for the output file. 

Some notes on the merging and tidying follow

## Data merging and selection
Data was uploaded, selected and tidied through a series of passes by the run_analysis.R script. In order to execute the script, the data files must be in their original table structure with the "UCI HAR Dataset" folder in the working directory. 

## Data labelling 
Columns were left labelled using the exact syntax used in features.txt rather than replacing them with more syntactically English labels. I did this not merely because I am lazy, but also to remove any ambiguity as to what the columns mean. A user looking at both the original data set and the tidied data set will have no problem mapping one to the other. 

## Testing
The project1.txt file can be loaded into RStudio with the following command:

>x <- read.table("./assignment1.txt")