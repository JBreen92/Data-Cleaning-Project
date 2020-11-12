# Data-Cleaning-Project

## Script Explanation

The script starts by loading the dplyr package which I use later for some of the data manipulation.

This is followed by a series of read.csv functions that load in the required data for the project. They are in the script just to showcase my process, but have been commented out as they might not work for somebody else that has their working directory set up differently. Adjustments will need to be made depending on the person. 

Since column_names were loaded in as a dataframe instead of as a vector like I wanted, the next line extracts the column of names from this dataframe and turns it into a vector of the name to make it easier to work with.

The test and train datasets are then merged together through cbinds, creating two dataframes - test_df for the test data and train_df for the train data. These two dataframes are finally merged together with an rbind into the full_df dataframe.

Once the dataframes are merged the script then assigns new names to full_df with a setNames function. The names are changed to "subject", "activity", and then the column_names vector (which contains the names that were extracted earlier) is used to assign variable names to the remaining columns. 

The activity column is then turned into a factor using the as.factor function and given the labels listed in the activity_labels.txt by the factor() function. 

To extract only the desired columns a select function is used to pull the subject and activity columns. Inside the select function a mathces function was also used to find columns that contained only the mean or std for every variable. Since these columns contained metacharacters the escape character "\" had to be used to properly search through the results.

To find the average of every variable for each subject and activity pairing a group_by function was used to group the data by subject id and activity name. Then a summarise function was used along an across function to take the mean over every remaining column outside of the grouped ones. This is saved to full_df_avg.

As a finishing touch the script extracts the column names from full_df_avg (leaving out subject and activity) and uses a paste to add "avg_" to every name. This is done to appropriately label the new summarised columns. The changed names are then added back to full_df_avg using the setNames function. 
