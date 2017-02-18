# Getting and Cleaning Data Course Project
___

#### This project is based on the research of [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#### The script transforms the original dataset into tidy dataset with 66 measurements of 6 activities from 30 subjects for later analysis.

## run_analysis.R
___

#### run_analysis.R is the main R script which performs analysis as follows:
- loads the original data set
- merges train and test data
- subsets only the variables of mean and standard deviation
- labels descriptive activity and variable names.

#### The script has two outputs:
- data frame **data_full** : 66 measurements for each activity and subject, with total 10000+ observations.
- data frame **data_tidy** : the average of 66 measurements for each activity and each subject. written into file analysis.txt.

## Codebook.md  
___
#### Codebook.md describes the variables, the data, and the transformations performed to clean up the data.