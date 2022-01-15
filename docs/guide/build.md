# Build

Some features may require a build step. Those are indicated by a warning when adding the feature to your project.

This is because some features or additional features may require
actions such as compiling, or transpiling. For instance, when
using sass, one will want to recompile the CSS from the sass 
code after changes were made.

<Note type="warning">
Do not call this function from within the app.
It helps build things, not run them.
</Note>

Some features will essentially add scripts to perform said 
actions in the directory `inst/dev`. 

## Manual

The function `leprechaun::build()` can then be used to 
run those scripts.

## Roclet

You can also use a roxygen2 "roclet" (recommended) to run 
`leprechaun::build()` when the package is documented 
(with e.g.: `devtools::document`).
To use the roclet edit the `DESCRIPTION`:

```
Roxygen: list(markdown = TRUE, roclets = c("namespace", "collate", "rd", "leprechaun::build_roclet"))
```
