# Use

The basic scaffold is minimal, though will suit most use cases.

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
ℹ Creating scss
ℹ Creating inst/dev/sass.R
✔ Adding 'sass' to Suggests in DESCRIPTION
✔ Adding '^scss$' to '.Rbuildignore'
! This requires `leprechaun::build()`
```

This creates a directory `scss` with two `.scss` files within it.
Importantly it adds a script to `inst/dev` to generate the CSS.

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>

Dependencies:

- [sass](https://github.com/rstudio/sass)

## Packer

If you are using [packer](https://packer.john-coene.com/) then
there is a handy plugin to easily bring support for it in 
leprechaun.

```r
leprechaun::use_packer()
```

```
✔ Creating inst/dev/packer.R
✔ Adding 'packer' to Suggests in DESCRIPTION
! This requires `leprechaun::build()`
```

This adds a script to `inst/dev` so that the 
[build](/guide/plugins#build) process from leprechaun 
bundles the JavaScript.

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>

Dependencies:

- [packer](https://packer.john-coene.com)

## Config

If you want to make use of a config file there is a plugin
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

## JavaScript

The function `leprechaun::use_js_utils()` adds useful 
JavaScript functions to your projects.

<Note type="warning">
Requires a packer scaffold in place.
</Note>

These include function show or hide an element from the DOM 
and more.

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

Dependencies:

- [packer](https://packer.john-coene.com)

## HTML

You can add HTML utility functions with `use_html_utils`.

This includes functions to create columns, badges, etc.

```r
fluidRow(
	col4(badge("hello")),
	col8("world")
)
```

Dependencies:

- [htmltools](https://github.com/rstudio/htmltools)

## Enpoints

There is also a set of functions to help set up 
session-dependend endpoints.

These can be added with:

```r
leprechaun::use_endpoint_utils()
```

This adds a file with utility functions to generate endpoints.

Dependencies:

- [jsonlite](https://github.com/jeroen/jsonlite)
