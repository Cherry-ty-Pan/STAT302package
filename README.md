
# STAT302package

<!-- badges: start -->
[![R-CMD-check](https://github.com/Cherry-ty-Pan/STAT302package/workflows/R-CMD-check/badge.svg)](https://github.com/Cherry-ty-Pan/STAT302package/actions)
[![codecov](https://codecov.io/gh/Cherry-ty-Pan/STAT302package/branch/master/graph/badge.svg?token=JV3CIKE762)](https://codecov.io/gh/Cherry-ty-Pan/STAT302package)
<!-- badges: end -->

This is the final project for STAT302. A package called "STAT302package" is created, and it includes four functions: `my_t_test`, `my_lm`, `my_knn_cv`, and `my_rf_cv``.
package collaborators: Cherry Pan & Yi-Hsuan Wu.

## Installation

You can install the STAT302package using the following line:

```{r}
install.packages("STAT302package")
library(STAT302package)
```
Alternatively, you can install the development version directly from GitHub.

```
# install.packages("devtools")
devtools::install_github("Cherry-ty-Pan/STAT302package")
library(STAT302package)```
```
## Use

```{r}
library(STAT302package)
# Use this to view the vignette in the Demo HTML help
help(package = "STAT302package", help_type = "html")
# Use this to view the vignette as an isolated HTML file
utils::browseVignettes(package = "STAT302package")
```

