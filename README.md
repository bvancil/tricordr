
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tricordr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/tricordr)](https://CRAN.R-project.org/package=tricordr)
[![Travis build
status](https://travis-ci.org/bvancil/tricordr.svg?branch=master)](https://travis-ci.org/bvancil/tricordr)
[![Codecov test
coverage](https://codecov.io/gh/bvancil/tricordr/branch/master/graph/badge.svg)](https://codecov.io/gh/bvancil/tricordr?branch=master)
<!-- badges: end -->

The goal of tricordr is to integrate process provenance and
instrumentation to pipelines of tidyverse primatives

## Installation

You can install the released version of tricordr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("tricordr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bvancil/tricordr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tricordr)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!

## Code of conduct

Please note that the ‘tricordr’ project is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.

## Similar work

  - [{tidylog}](https://github.com/elbersb/tidylog)
