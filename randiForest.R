data(iris)

# Structure 
str(iris)

# Installing package
install.packages("caTools")	 # For sampling the dataset
install.packages("randomForest") # For implementing random forest algorithm

# Loading package
library(caTools)
library(randomForest)

# Splitting data in train and test data
split <- sample.split(iris, SplitRatio = 0.7)
split

train <- subset(iris, split == "TRUE")
test <- subset(iris, split == "FALSE")

# Fitting Random Forest to the train dataset
set.seed(120) # Setting seed
RF_classifier = randomForest(x = train[-5],
                             y = train$Species,
                             ntree = 500)

RF_classifier

# Predicting the Test set results
y_pred = predict(RF_classifier, newdata = test[-5])

# Confusion Matrix
confusion_mtx = table(test[, 5], y_pred)
confusion_mtx

# Plotting model
plot(RF_classifier)

# Importance plot
importance(RF_classifier)

# Variable importance plot
varImpPlot(RF_classifier)

