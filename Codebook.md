Creation of tidy data set from smartphone data

Introduction

The data presented here was assembled through cleaning a set of raw data collected through smartphone sensors by a team of scientists at the Smartlab - Non Linear Complex Systems Laboratory, in Genoa, Italy, and was obtained for the Coursera Getting and Cleaning Data class.
Thus, credtid for collecting and provinding the data to the public goes to Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto.
More details on the data used here are not of particular regard, but can be collected from reference one and the data_details file in the repo.

Cleaning the data set

1. Downloading and unzipping the files (step 1 in the code)
2. Loading and combining the files needed (step 2-4 in the code)
3. Sorting out variables not needed (step 6 in the code)
4. Cleaning and renaming varaibles and values (step 7&5 in the code)
5. Final processing and saving 

Format of the output data set

The dataset has been saved as a plain txt file, space separated, with a header of variable names in the first row. All observations are arranged as rows, grouped by subject id. 

Explanation of variable names
time for time domains; frequency for frequency domains
The next term, body or gravity, indicates from where the force was measured

Next is the type of force, acceleration or gyroscopic

The next terms in the variable names indicate the calculations performed by the authorsjerk , for jerk force and mag,  for Euclidean norm

The following terms indicate if the variable represents a mean (mean) or standard deviation (sd)
The final letter of some variable names show the axis of motion, x, y, or z

Variable names also listed in the data_details file in this repo
