# Use

The basic scaffold is minimal, though it will suit most use cases.

If more features are needed one can use the `use_*` family 
of functions. 
These functions add features but often dependencies too.

## Sass

You can easily include [sass](https://sass-lang.com/) to easily
style your applications.

```r
leprechaun::use_sass()
```

```
✔ Creating scss
✔ Creating inst/dev/sass.R
✔ Adding 'sass' to Suggests in DESCRIPTION
✔ Adding '^scss$' to '.Rbuildignore'
! This requires `leprechaun::build()`
```

This creates a directory `scss` with two `.scss` files within it.
Importantly it adds a script to `inst/dev` to generate the CSS.

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>

Suggests:

- [sass](https://github.com/rstudio/sass)

## Config

If you want to make use of a config file there is a feature
for it. It adds a basic config file and helper functions
to interact with it.

```r
leprechaun::use_config()
```

```
✔ Creating inst/config.R
✔ Creating inst/config.yml
✔ Adding 'yaml' to Imports in DESCRIPTION
```

Imports:

- [yaml](https://CRAN.R-project.org/package=yaml)

## Packer

The function `leprechaun::use_js_utils()` adds useful 
JavaScript functions to your projects.

<Note type="warning">
Requires a packer scaffold in place.
</Note>

These include function show or hide an element from the DOM 
and more.

```r
leprechaun::use_packer()
```

```
✔ Creating inst/dev/packer.R
✔ Adding 'packer' to Suggests in DESCRIPTION
! This requires `leprechaun::build()`
```

This will add functions such as `show`, `hide`, and `toggle`
to control the visibility of elements.

```r
library(shiny)

ui <- fluidPage(
	actionButton("toggle", "Toggle"),
	p(id = "element", "Hello", style = "display:none;")	
)

server <- function(input, output, session){
	observeEvent(input$toggle, {
		toggle("element")
	})
}

shinyApp(ui, server)
```

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>

Suggests:

- [packer](https://packer.john-coene.com)

## JavaScript

<Note type="warning">
Requires a packer scaffold in place and `leprechaun::use_packer()`
</Note>

This adds JavaScript utility functions to, for example, show/hide
an element from the R server.

```r
packer::scaffold_leprechaun(edit = FALSE)
use_packer()
use_js_utils()
```

## HTML

You can add HTML utility functions with `use_html_utils`.

```r
leprechaun::use_html_utils()
```

```
✔ Adding 'htmltools' to Imports in DESCRIPTION
✔ Creating R/html-utils.R
```

This includes functions to create columns, badges, etc.

```r
fluidRow(
	col4(badge("hello")),
	col8("world")
)
```

Imports:

- [htmltools](https://github.com/rstudio/htmltools)

## Endpoints

There is also a set of functions to help set up 
session-dependent endpoints.

```r
leprechaun::use_endpoints_utils()
```

```
✔ Adding 'jsonlite' to Imports in DESCRIPTION
✔ Creating R/endpoint-utils.R
```

This adds a file with utility functions to generate endpoints.

Imports:

- [jsonlite](https://github.com/jeroen/jsonlite)
