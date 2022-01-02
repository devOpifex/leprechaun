# `scaffold`

Scaffold Leprechaun


## Description

Scaffolds a leprechaun project.
 This must be run from within a package
 and should only be run once per project.


## Usage

```r
scaffold(
  ui = c("navbarPage", "fluidPage"),
  bs_version = bootstrap_version(),
  overwrite = FALSE
)
```


## Arguments

Argument      |Description
------------- |----------------
`ui`     |     Type of UI to use.
`bs_version`     |     Bootstrap version to use. If shiny > 1.6 is installed defaults to version 5, otherwise version 4.
`overwrite`     |     Whether to force overwrite all files. This is not recommended, make sure you have save and/or committed and checked that the files that will be overwritten can be before proceeding with this option.


