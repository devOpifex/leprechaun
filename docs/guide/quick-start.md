# Quick Start

The "robustness" that leprechaun provides is thanks to 
R packages and the rigour they improse. Every leprechaun
application is _rooted in a package_.

## Setup

Therefore start from an R package. Create one whichever way
you are more comfortable with; using the RStudio IDE, manually,
or, as we do below, with the [usethis](http://usethis.r-lib.org/)
package.

```r
usethis::create_package("myapp")
```

This creates a package, if run from the RStudio IDE it should
automatically open the project.

If you are not using RStudio create the package and move the 
root of the package then open your editor of choice, e.g.: 
below with [VScode](https://code.visualstudio.com/).

```bash
Rscript -e "usethis::create_package('myapp')"
code myapp
```

Once done, from the root of the package, scaffold a leprechaun
application. This function accepts a single argument, `ui` to
specify whether one wants a `fluidPage` or `navbarPage` for the
UI, it defaults to the latter.

```r
leprechaun::scaffold()
```

```
── Scaffolding leprechaun app ───────────────────────────────────────

── Creating lock file ──

✔ Creating .leprechaun

── Adding dependencies ──

✔ Adding 'shiny' to Imports in DESCRIPTION
✔ Adding 'bslib' to Imports in DESCRIPTION
✔ Adding 'htmltools' to Imports in DESCRIPTION


── Generating code ──

✔ Creating R/ui.R
✔ Creating R/assets.R
✔ Creating R/run.R
✔ Creating R/server.R
✔ Creating R/leprechaun-utils.R
✔ Creating R/zzz.R

✔ Creating inst/dev
✔ Creating inst/assets
✔ Creating inst/img

── Ignoring files ──

✔ Adding '^\\.leprechaun$' to '.Rbuildignore'
```

This creates a few files containing code necessary to run the
application. To test it, document, and load the code, then
call the `run` function that is now part of the package.

```r
devtools::document()
devtools::load_all()
run()
```

That is it! Importantly leprechaun is not required to run the code
it generates, only two dependencies were added: `shiny`, 
and `bslib`. The former is added because, by default, shiny runs on
Bootstrap 3 which is 6 years out of date: using bslib to bump shiny
to Bootstrap 4 is highly recommended!

## Modules

Good practice has it that shiny code should be placed within 
"modules," they are easily reusable bundles of code, and are 
a great way to structure an application: compartmentalisation.

You can add modules with the function:

```r
leprechaun::add_module(name = "counter")
```

The above creates a `module_counter.R` file containing the code
for the module. The `name` is used to define the name of the
file and functions of the module.
