---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# tricordr

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/tricordr)](https://CRAN.R-project.org/package=tricordr)
[![Travis build status](https://travis-ci.org/bvancil/tricordr.svg?branch=master)](https://travis-ci.org/bvancil/tricordr)
[![Codecov test coverage](https://codecov.io/gh/bvancil/tricordr/branch/master/graph/badge.svg)](https://codecov.io/gh/bvancil/tricordr?branch=master)
<!-- badges: end -->

The goal of tricordr is to integrate process provenance and instrumentation to pipelines of tidyverse primatives

## Installation

You can install the released version of tricordr from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tricordr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bvancil/tricordr")
```
## Example

Warning: None of this actually works yet.

Eventually, we want full provenance, but this is sort of what we're going for.

We'll start by creating some test data.


```r
library('dplyr')
library('tibble')
library('tricordr')

# Here's some test data
data_size <- 100L
test_data <- tibble::tibble(
  x = base::sample(c(0L, 1L), data_size, replace = TRUE),
  y = base::sample(base::seq(0L, 2L), data_size, replace = TRUE)
)
```

In our data pipeline, we want to track what happens to our
data. For instance, we might want to add another variable
and transform the others.


```r
final_data <- test_data %>% 
  dplyr::mutate(z = x * y, y1 = y, y = x, x = 2L - y1)
```

What happened? It will be tricky to figure out later.
Instead, we can use `tricordr` to decorate the
`dplyr::mutate` function so that we keep track.



```r
test_provenance <- tricordr::Provenance$new()
test <- test_provenance$wrap_operations()

# Now we change `dplyr::mutate` to `test$mutate`
final_data <- test_data %>% 
  test$mutate(z = x * y, y1 = y, y = x, x = 2L - y1)

print(test_provenance)
#> List of 4
#>  $ :List of 4
#>   ..$ input         : chr "x * y"
#>   ..$ output        : chr "z"
#>   ..$ transformation: chr "x * y"
#>   ..$ summary       : NULL
#>  $ :List of 4
#>   ..$ input         : chr "y"
#>   ..$ output        : chr "y1"
#>   ..$ transformation: chr "y"
#>   ..$ summary       : NULL
#>  $ :List of 4
#>   ..$ input         : chr "x"
#>   ..$ output        : chr "y"
#>   ..$ transformation: chr "x"
#>   ..$ summary       : NULL
#>  $ :List of 4
#>   ..$ input         : chr "2L - y1"
#>   ..$ output        : chr "x"
#>   ..$ transformation: chr "2L - y1"
#>   ..$ summary       : NULL
```

We can create difference provenances for different pipelines
and combine them later.

## Code of conduct

Please note that the 'tricordr' project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.
  
## Similar work

* [{tidylog}](https://github.com/elbersb/tidylog)
