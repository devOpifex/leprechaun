# Update

Since leprechaun generates code that is placed in the application
you build, to update it one has to update said generated code.

Leprechaun writes a `.leprechaun` lockfile in the root of the
application, this is used to track the components used, their
version, and more.

When a new version of leprechaun is released install it from
CRAN or Github.

```r
remotes::install_github("devOpifex/leprechaun")
```

Then, from the root of your application using leprechaun,
run `leprechaun::update_scaffold()`.

```
── Updating leprechaun application ─────────────────────────────

ℹ Will attempt to bump code from version 0.1.0 to 0.2.0

── R files ──

• R/ui.R
• R/assets.R
• R/run.R
• R/server.R
• R/leprechaun-utils.R
• R/zzz.R

── Uses ──

• packer
• config
• sass
• html-utils
• endpoint-utils

Do you want to proceed? (y/n) 
```

<Note type="danger">
Always back-up or commit your code before updating!
</Note>

This will update the generated code.
