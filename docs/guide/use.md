# Use

The basic scaffold is minimal, though will suit most use cases.

If more features are needed one can use the `use_*` family 
of functions.

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

## HTML

You can add HTML utility functions with `use_html_utils`.

This includes functions to create columns, badges, etc.

```r
fluidRow(
	col4(badge("hello")),
	col8("world")
)
```
