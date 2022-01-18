# `use_js_utils`

JavaScript Utils


## Description

Add utility JavaScript function, e.g.: to hide or show
 element in the DOM.


## Usage

```r
use_js_utils(overwrite = FALSE, quiet = FALSE)
```


## Arguments

Argument      |Description
------------- |----------------
`overwrite`     |     Whether to overwrite existing files.
`quiet`     |     Whether to print messages.


## Value

Invisibly returns a boolean indicating whether
 the operation was successful.


## Note

This requires [use_packer](#usepacker) .
 Also, it will require using [build](#build) .


## Examples

```r
use_js_utils()
```


