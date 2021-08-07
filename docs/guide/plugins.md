# Plugins

The `leprechaun::scaffold()` functions generates a bare bone
application setup.

Leprechaun aims for low number of dependncies, hence the
aforementioned approach.

Though the basic setup should have all the features necessary
for most cases, it may lack some features that you may be after
for larger applications.

These can be added with the `plugin_*` family of functions.

<Note>
Please feel free to open issues or pull requests to
propose new plugins.

Given the structure of the code a plugin of yours does not 
necessarily have to be part of leprechaun itself, it can
be in your any other package.
</Note>

## Sass

You can easily include [sass](https://sass-lang.com/) to easily
style your applications.

```r
leprechaun::plugin_sass()
```

```
ℹ Creating scss
ℹ Creating inst/dev/sass.R
✔ Adding 'sass' to Suggests in DESCRIPTION
✔ Adding '^scss$' to '.Rbuildignore'
```

This creates a directory `scss` with two `.scss` files within it.
Importantly it adds a script to `inst/dev` to generate the CSS.
See [build](/guide/plugins#build) for more details.

## Packer

If you are using [packer](https://packer.john-coene.com/) then
there is a handy plugin to easily bring support for it in 
leprechaun.

```r
leprechaun::plugin_packer()
```

This adds a script to `inst/dev` so that the 
[build](/guide/plugins#build) process from leprechaun 
bundles the JavaScript.

## Config

If you want to make use of a config file there is a plugin
for it. It adds a basic config file and helper functions
to interact with it.

```r
leprechaun::plugin_config()
```

## Build

Some plugins may require a build step for compiling, transpiling,
minifiying, etc. Leprechaun places these scripts in the directory
`inst/dev`.

The leprechaun function `leprechaun::build()` can be used to run
those scripts.

<Note type="warning">
Do not call this function from within the app.
It helps build things, not run them.
</Note>
