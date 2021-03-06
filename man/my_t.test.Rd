% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_t.test.R
\name{my_t.test}
\alias{my_t.test}
\title{\code{my_t.test} Function}
\usage{
my_t.test(x, mu, alternative)
}
\arguments{
\item{x}{Numeric vector of data.}

\item{mu}{Numeric input for a number indicating the null hypothesis value of the mean.}

\item{alternative}{A character string, either "two.sided", "less", or "greater", that specifies the alternative hypothesis.}
}
\value{
a \code{list} with elements:

\code{test_stat}: the numeric test statistic;
\code{df}: the degrees of freedom;
\code{alternative}: the value of the parameter alternative;
\code{p_val}: the numeric p-value.
}
\description{
This function performs a one sample t-test in R.
}
\examples{
my_t.test(rnorm(100), 0, "greater")
my_t.test(rnorm(100), 0, "two.sided")

}
\keyword{inference}
