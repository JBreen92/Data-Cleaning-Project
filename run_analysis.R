library(dplyr)
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subjects_test <- read.table("./test/subject_test.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subjects_train <- read.table("./train/subject_train.txt")
column_names <- read.table("features.txt")
column_names <- as.vector(column_names$V2)
test_df <- cbind(subjects_test, y_test, x_test)
train_df <- cbind(subjects_train, y_train, x_train)
full_df <- rbind(test_df, train_df)
full_df <- setNames(full_df, c("subject", "activity", column_names))
full_df$activity <- as.factor(full_df$activity)
full_df$activity <- factor(full_df$activity, levels = c(1, 2, 3, 4, 5, 6), labels = c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying"))
full_df <- full_df %>% select(subject, activity, matches("mean\\(\\)"), matches("std\\(\\)"))
full_df_avg <- full_df %>% group_by(subject, activity) %>% summarise(across(everything(), mean))
new_column_names <- colnames(full_df_avg)[3:68]
new_column_names <- paste("avg", new_column_names, sep = "_")
full_df_avg <- setNames(full_df_avg, c("subject", "activity", new_column_names))