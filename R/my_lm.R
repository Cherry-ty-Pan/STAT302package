#' \code{my_lm} Function
#'
#' This function fits a linear model in R.
#'
#' @param formula a \code{formula} class object.
#' @param data an input data frame.
#'
#' @keywords inference
#'
#' @return a \code{table} with rows for each coefficient and columns for the \code{Estimate},
#' \code{Std. Error}, \code{t value}, and \code{Pr(>|t|)}.
#'
#' @examples
#' my_lm(mpg ~ hp, data = mtcars)
#'
#' @export
# Create the my_lm function with formula and data inputs
my_lm <- function(formula, data) {
  # Get model matrix X with formula and data inputs
  X <- model.matrix(formula, data)
  # Get the model frame object with formula and data inputs and save as `frame`
  frame <- model.frame(formula, data)
  # Get the model response Y from `frame`
  Y <- model.response(frame)
  # Get the linear regression coefficients and save as `beta`
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  # Get the df which is equal sample size(rows of data) minus number of
  # covariates (columns of X)
  d_f <- nrow(data) - ncol(X)
  # Get the sigma square using formula and save as `sig_sqr`
  sig_sqr <- sum((Y - (X %*% beta)) ^ 2 / d_f)
  # Get the standard error for the coefficients using formula and save as
  # `se_beta`
  se_beta <- diag(sqrt(sig_sqr * solve(t(X) %*% X)))
  # Get the t value for the coefficients amd save as `t_obs`
  t_obs <- beta / se_beta
  # Get the p value and save as `t_obs`
  p_val <- 2 * pt(abs(t_obs), d_f, lower.tail = F)
  # Create a list containing `Estimate`, `Std. Error`, `t value`, and `Pr(>|t|)`
  result <- list("Estimate" = beta,
                 "Std. Error" = se_beta,
                 "t value" = t_obs,
                 "Pr(>|t|)" = p_val)
  # Return the list
  return(result)
}
