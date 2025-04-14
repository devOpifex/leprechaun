# JavaScript Utils

## Description

Add utility JavaScript function, e.g.: to hide or show
element in the DOM.

## Usage

```r
use_js_utils(overwrite = FALSE, quiet = FALSE)
```

## Arguments

* `overwrite`: Whether to overwrite existing files.
* `quiet`: Whether to print messages.

## Note

This requires [use_packer](use_packer).
Also, it will require using [build](build).

## Value

Invisibly returns a boolean indicating whether
the operation was successful.

## Examples

```r
use_js_utils()
```

