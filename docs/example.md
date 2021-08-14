# Example

This is an example of using leprechaun to build a shiny 
application.

## Initialise

Create an R package and scaffold a leprechaun application.

```r
usethis::create_package('anApp')
leprechaun::scaffold()
```

## Sass

Add sass to style the app.

```r
leprechaun::use_sass()
```

We can then edit `scss/_core.scss` to style all `<h1>` tags.

```scss
$accent: #560bad;

html{
	h1 {
		color: $accent;
	}
}
```

This requires the `leprechaun::build()` step because the Sass
code must be compiled to CSS.

```r
leprechaun::build()
```

![](/_assets/scss.png)

Remember to always run `leprechaun::build()` to see changes made
to the Sass reflected to the CSS.

## JavaScript

JavaScript is better handled with 
[packer](https://packer.john-coene.com), 
we therefore create a packer scaffold. 

```r
packer::scaffold_leprechaun()
```

Then we add the packer plugin.

```r
leprechaun::use_packer()
```

This creates boiler plate code to use JavaScript with webpack,
by default packer creates a custom handler to display an alert.

Like for Sass, this requires the build step to convert the ES6
from `srcjs` to ES5 in the `inst`.

```r
leprechaun::build()
```

We can then use the convenience `send_message` function to
send data to the front-end and display the alert.

```r
# server.R
server <- function(input, output, session){
	send_message <- make_send_message(session)
	# send a message to show an alert
	send_message("show-packer", text = "HELLO!")	
}
```

![](/_assets/js.png)
