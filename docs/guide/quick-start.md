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

This create a package, if run from the RStudio IDE it should
automatically open in a new window.

If you are not using RStudio create the package and move the 
root of the package then open your editor of choice, e.g.: 
below with [VScode](https://code.visualstudio.com/).

```bash
Rscript -e "usethis::create_package('myapp')"
code myapp
```

Once done, from the root of the package, scaffold a leprechaun
application.

```r
leprechaun::scaffold()
```

```
── Scaffolding leprechaun app ─────────────────────────────────────────────────────────

── Creating lock file ──

ℹ Creating .leprechaun

── Adding dependencies ──

✔ Setting active project to '/home/jp/Projects/test'
✔ Adding 'shiny' to Imports field in DESCRIPTION
✔ Adding 'bslib' to Imports field in DESCRIPTION

── Generating code ──

ℹ Creating R/ui.R
ℹ Creating R/assets.R
ℹ Creating R/run.R
ℹ Creating R/server.R
ℹ Creating R/leprechaun-utils.R
ℹ Creating R/zzz.R

ℹ Creating inst/dev
ℹ Creating inst/assets
ℹ Creating inst/img

── Ignoring files ──

✔ Adding '^\\.leprechaun$' to '.Rbuildignore'
```

This creates a few files containing code necessary to run the
application. To test it, document, and load the code, then
call the `run` function.

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
"modules," they make shiny easily code reusable and are a great
way to structure an application: compartmentalisation.

You can add modules with the function:

```r
leprechaun::add_module(name = "counter")
```

The above creates a `module_counter.R` file containing the code
for the module. The `name` is used to define the name of the
file and functions of the module.
