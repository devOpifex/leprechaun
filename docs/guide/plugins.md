# Plugins

The `leprechaun::scaffold()` functions generates a bare bone
application setup.

Leprechaun aims for low number of dependencies, hence the
aforementioned approach.

Though the basic setup should have all the features necessary
for most cases, it may lack some features that you may be after
for larger applications.

These can be added with the `plugin_*` family of functions.

<Note>
Plugins are meant to facilitate making shiny work 
with <i>other packages</i> and thus bring additional
dependencies.
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
! This requires `leprechaun::build()`
```

This creates a directory `scss` with two `.scss` files within it.
Importantly it adds a script to `inst/dev` to generate the CSS.

<Note type="tip">
Requires running <code>leprechaun::build()</code>
</Note>

## Packer

If you are using [packer](https://packer.john-coene.com/) then
there is a handy plugin to easily bring support for it in 
leprechaun.

```r
leprechaun::plugin_packer()
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

## Config

If you want to make use of a config file there is a plugin
for it. It adds a basic config file and helper functions
to interact with it.

```r
leprechaun::plugin_config()
```

```
✔ Creating inst/config.R
✔ Creating inst/config.yml
✔ Adding 'yaml' to Imports in DESCRIPTION
```
