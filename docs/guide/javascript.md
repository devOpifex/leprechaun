# JavaScript

To include JavaScript in the application you can technically
just place `.js` files within the `inst/assets` directory.

However, a more robust way is probably to use 
[packer](https://packer.john-coene.com/), it allows building
R project with webpack to minify JavaScript, scope CSS, and much
more, visit the official website for more information.

## Example

Create a package and scaffold a leprechaun application from
within it.

```r
usethis::create_package("myapp")
leprechaun::scaffold()
```

Once this done you can use scaffold (almost) any of the scaffolds
that packer provides, though there is a scaffold dedicated to 
leprechaun.

```r
packer::scaffold_leprechaun()
```

```
── Scaffolding leprechaun ─────────────────────────────────────────────────── 
✔ Initialiased npm
✔ webpack, webpack-cli, webpack-merge installed with scope "dev…
✔ Added npm scripts
✔ Created srcjs directory
✔ Created srcjs/config directory
✔ Created webpack config files

── Adding files to .gitignore and .Rbuildignore ──

✔ Setting active project to '/home/jp/Projects/test'
✔ Adding '^srcjs$' to '.Rbuildignore'
✔ Adding '^node_modules$' to '.Rbuildignore'
✔ Adding '^package\\.json$' to '.Rbuildignore'
✔ Adding '^package-lock\\.json$' to '.Rbuildignore'
✔ Adding '^webpack\\.dev\\.js$' to '.Rbuildignore'
✔ Adding '^webpack\\.prod\\.js$' to '.Rbuildignore'
✔ Adding '^webpack\\.common\\.js$' to '.Rbuildignore'
✔ Adding 'node_modules' to '.gitignore'

── Scaffold built ──

ℹ Run `bundle` to build the JavaScript files
ℹ Run `leprechaun::use_packer()`
```

One of the last messages reminds us to run the `use_` function
for packer, let's go ahead and do that.

```r
leprechaun::use_packer()
```

The packer scaffold created, amongst other files, a `srcjs`
directory where the JavaScript code lives.

The basic template includes a simple handler for the `show-packer`
message, it expects a `text` variable as part of the message. 
This message is then simply displayed in an alert.

If we modify the `server` function to use `send_message` to 
send `text` to the `show-packer` message handler.

```r
server <- function(input, output, session){
	send_message <- make_send_message(session)	
	home_server('id')

	send_message("show-packer", text = "Hello leprechaun!")
}
```

This will make it such that loading the application will send the
message to the front-end and display the alert.

But first, we need to bundle the JavaScript, thanks to the packer 
feature this can be done with the `leprechaun::build` function.

```r
leprechaun::build()
```

You can then generate the documentation, load the package and run
the app.

```r
devtools::document()
devtools::load_all()
run()
```
