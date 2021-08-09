<img height="250" src="_assets/leprechaun.png" />

Code generator for _lean_ shiny applications as packages.

### Get it

It's not yet on CRAN, get it from Github.

```r
# install.packages("remotes")
remotes::install_github("devOpifex/leprechaun")
```

### How it works

From the root of a package, scaffold a leprechaun application.
This generates basic code for a shiny application within the 
package.

Then, if more features are needed, you can use the `use_*` family
of functions to selectively add them to your project. e.g.:
to add utility JavaScript functions to hide, show, etc. elements
in the DOM.
Also, you can use the "plugins," functions that ease and 
improve the integration of shiny with other packages, e.g.: to
make use of sass to style the application.

### The elephant in the room

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
do not require it to run, and where the features we include in
the application are entirely optional.

Therefore, leprechaun generates code that it places 
in the package/app you build, therefore it does note require importing  external dependencies, other than 
[shiny](https://shiny.rstudio.com) and 
[bslib](https://rstudio.github.io/bslib/).

Leprechaun, sees itself as a _developer dependency,_ it is 
required to develop the app but should not be required to run 
the application.

This allows keeping things small and efficient, leprechaun also
encourages that approach with regard to the JavaScript and CSS
via [packer](https://packer.john-coene.com), and 
[sass](https://github.com/rstudio/sass).
