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

```r
library(shiny)

ui <- fluidPage(
	actionButton("show", "Show"),
	p(id = "element", "Hello", style = "display:none;")	
)

server <- function(input, output, session){
	observeEvent(input$show, {
		show("element")
	})
}

shinyApp(ui, server)
```

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>
