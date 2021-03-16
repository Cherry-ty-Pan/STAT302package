#' \code{my_knn_cv} Function
#'
#' This function predict output class using covariates.
#'
#' @param train an input data frame.
#' @param cl true class value of the training data.
#' @param k_nn integer representing the number of neighbors.
#' @param k_cv integer representing the number of folds.
#'
#' @keywords prediction
#'
#' @return a \code{list} with objects:
#'
#' \code{class}: a vector of the predicted class \code{Y_hat} for all observations,
#' \code{cv_err}: a numeric with the cross-validation misclassification error.
#'
#' @examples
#' data(penguins)
#' my_knn_cv(penguins[,3:6], penguins$species, 1, 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  # Define fold
  fold <- sample(rep(1:k_cv, length = nrow(train)))
  # Create a data frame for x and split
  train <- data.frame("x" = train,
                      "y" = cl,
                      "split" = fold)
  # Remove any NA values from the input data
  train <- na.omit(train)
  predict_err <- rep(NA, k_cv)
  # Iteration through 1:k_cv
  for (i in 1:k_cv) {
    train_data <- train %>%
      filter(split != i)
    test_data <- train %>%
      filter(split == i)
    # Predict the class of the ith fold using all other folds as the training data.
    # Save as `class_k`
    class_k <- knn(train_data[,1:4], test_data[,1:4], train_data$y, k_nn)
    # record the prediction and the misclassification rate
    # Save as `cv_err`
    predict_err[i] <- sum(class_k != test_data$y)/nrow(test_data)
  }
  class <- knn(train[,1:4], train[,1:4], train$y, k_nn)
  # Create the list with `class` and `cv_err`
  outputlist <- list("class" = class,
                     "cv_err" = mean(predict_err))
  # Return the list
  return(outputlist)
}
