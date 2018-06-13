## This project created to build predictors for image analysis
## Chosen dataset is the MNIST handwriting dataset, will use a decision tree to start
## then possibly move onto test some different predictive models
## first thing, load up tidyverse, as I am sure it will come in handy
library(tidyverse)
## get decision tree package
library(rpart)
## load up mnist training data, remember there are no column names
mnist_train <- read_delim("../datasets/MNIST/mnist_train.csv", delim = ",", col_names = FALSE)
## change column name of column with labels to something sensible...
colnames(mnist_train)[1] <- "number"
## grow tree
fit <- rpart(number ~ ., data = mnist_train, method = "class")
## have a quick look
summary(fit)
## load up test data
mnist_test <- read_delim("../datasets/MNIST/mnist_test.csv", delim = ",", col_names = FALSE)
## and change label column name to something sensible
colnames(mnist_test)[1] <- "number"
## check columns are identical
all.equal(colnames(mnist_train), colnames(mnist_test))
## use model to predict number
predicted <- predict(fit, mnist_test)
## look at predictions
summary(predicted)
predicted
