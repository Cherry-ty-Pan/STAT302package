#' \code{my_t.test} Function
#'
#' This function performs a one sample t-test in R.
#'
#' @param x Numeric vector of data.
#' @param mu Numeric input for a number indicating the null hypothesis value of the mean.
#' @param alternative A character string, either "two.sided", "less", or "greater", that specifies the alternative hypothesis.
#'
#' @keywords inference
#'
#' @return a \code{list} with elements:
#'
#' \code{test_stat}: the numeric test statistic;
#' \code{df}: the degrees of freedom;
#' \code{alternative}: the value of the parameter alternative;
#' \code{p_val}: the numeric p-value.
#'
#' @examples
#' my_t.test(rnorm(100), 0, "greater")
#' my_t.test(rnorm(100), 0, "two.sided")
#'
#' @export
my_t.test <- function(x, mu, alternative) {
  # Get the estimate of the x values by taking the mean
  est <- mean(x)
  # Get the df of the values
  d_f <- length(x) - 1
  # Get the se of the values
  se <- sd(x) / sqrt(length(x))
  # Get the t_obs value for the x values
  t_obs <- (est - mu) / se
  # Generate the p value if the alternative hypothesis is E(x) != mu.
  if (alternative == "two.sided") {
    p_val <- 2 * pt(abs(t_obs), d_f, lower.tail = FALSE)
    # Generate the p value if the alternative hypothesis is E(x) < H0.
  } else if (alternative == "less") {
    p_val <- 1 - pt(t_obs, d_f, lower.tail = FALSE)
    # Generate the p value if the alternative hypothesis is E(x) > H0.
  } else if (alternative == "greater") {
    p_val <- pt(t_obs, d_f, lower.tail = FALSE)
    # Report error when alternative is not stated
  } else {
    return("Please specify alternative hypothesis")
  }
  # Generate a list with the elements
  result <- list("test_stat" = t_obs,
                 "df"=d_f,
                 "alternative" = alternative,
                 "p_val" = p_val)
  # Return the list
  return(result)
}
