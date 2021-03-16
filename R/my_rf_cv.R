#' @title \code{my_rf_cv} Function
#'
#' This function will predict output \code{body_mass_g} using covariates \code{bill_length_mm},
#' \code{bill_depth_mm}, and \code{flipper_length_mm}.
#'
#' @param k number of folds.
#'
#' @keywords prediction
#'
#' @return a numeric average MSE across all k folds.
#'
#' @examples
#' my_rf_cv(5)
#'
#' @export
my_rf_cv <- function(k) {
  data(my_penguins)
  train <- my_penguins[,3:6]
  # Create fold
  fold <- sample(rep(1:k, length = nrow(train)))
  # Create the data set for model
  train <- data.frame("x" = train[,1:3],
                      "cl" = train[,4],
                      "split" = fold)
  # Remove NA value
  train <- na.omit(train)
  # Iteration through 1:k
  for (i in 1:k) {
    # Filter for train data
    train_data <- train %>%
      filter(split != i)
    # Filter for test data
    test_data <- train %>%
      filter(split == i)
    # Train a random forest model with 100 trees to predict body_mass_g using
    # covariates bill_length_mm, bill_depth_mm, and flipper_length_mm
    random_model <- randomForest(body_mass_g ~ x.bill_length_mm + x.bill_depth_mm + x.flipper_length_mm, data = train_data, ntree = 100)
    # predict the body_mass_g of the ith fold which was not used as training data
    prediction <- predict(random_model, test_data[, -4])
    # evaluate the MSE
    mse <- mean((prediction - test_data$body_mass_g)^2)
  }
  # Return the average MSE across all k folds
  mse <- mean(mse)
  return(mse)
}
