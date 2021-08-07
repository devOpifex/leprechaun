# Leprechaun

Code generator for _lean_ shiny applications as packages.

## Get it

It's not yet on CRAN, get it from Github.

```r
# install.packages("remotes")
remotes::install_github("devOpifex/leprechaun")
```

## Example

Create a package, then from its root, scaffold a leprechaun
app.

```r
usethis::create_package("myapp")
leprechaun::scaffold()
```

## The elephant in the room

Leprechaun is indeed very similar to 
[golem](https://golemverse.org/) but it differs in some ways.
Namely, it's much smaller, hence the name "leprechaun".

Golem is a great package, which, like probably most of you,
I have used to build dozens of apps. However,

1. It comes with numerous features I rarely use.
2. It comes as a dependency to my application.

The two points above increase the size of applications and 
make them more fragile.

The idea of leprechaun is to allow building applications that
do not required it to run, and where the features we include in
the application are optional.

Therefore, leprechaun generates code that it places 
in the package/app
you build, therefore it does note require importing 
external dependencies, other than 
[shiny](https://shiny.rstudio.com) and 
[bslib](https://rstudio.github.io/bslib/).

Leprechaun, like [packer](https://packer.john-coene.com/),
sees itself as a developer dependency, it is required to
develop the app but should not be required to run the 
application. 
