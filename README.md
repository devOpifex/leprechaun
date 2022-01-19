<div align="center">

<!-- badges: start -->
![](https://img.shields.io/badge/license-Apache%202-blue)
[![R-CMD-check](https://github.com/devOpifex/leprechaun/workflows/R-CMD-check/badge.svg)](https://github.com/devOpifex/leprechaun/actions)
[![Codecov test coverage](https://codecov.io/gh/devOpifex/leprechaun/branch/master/graph/badge.svg)](https://app.codecov.io/gh/devOpifex/leprechaun?branch=master)
<!-- badges: end -->

<img src="docs/_assets/leprechaun.png" height=200>

[Quick Start](https://leprechaun.opifex.org/#/guide/quick-start) | [Docs](https://leprechaun.opifex.org)

Leprechaun allows you to generate _lean_ and _robust_ 
[shiny](https://shiny.rstudio.com/) applications.

</div>

## Get it

__Stable__

``` r
install.packages("leprechaun")
```

__Development__

``` r
# install.packages("remotes")
remotes::install_github("devOpifex/leprechaun")
```

## Basics

From the root of a package scaffold a leprechaun application.

``` r
usethis::create_package("myApp")
leprechaun::scaffold()
```

This effectively generates code within the package to run a 
shiny application within a package: leprechaun _does not_ 
become a dependency to your project.
