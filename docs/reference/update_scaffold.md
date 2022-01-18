# `update_scaffold`

Update


## Description

Update the scaffolded code to a new version of
 leprechaun.


## Usage

```r
update_scaffold(force = !interactive())
```


## Arguments

Argument      |Description
------------- |----------------
`force`     |     Force update, ignore safety checks.


## Details

This reads the content of the `.leprechaun` lock file
 and updates it too.


## Value

Invisibly returns a boolean indicating whether
 the scaffold was updated.


## Examples

```r
update_scaffold()
```


