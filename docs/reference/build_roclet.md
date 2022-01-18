# `build_roclet`

Build Roclet


## Description

Roclet to run [`build()`](#build()) when documenting.
 Meant to be used in `DESCRIPTION` , e.g.:
 `Roxygen: list(markdown = TRUE, roclets = c("namespace", "collate", "rd", "leprechaun::build_roclet"))`


## Usage

```r
build_roclet()
```


## Value

An object of class `roclet` as expected
 by roxygen2.


