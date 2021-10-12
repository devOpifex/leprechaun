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

## Check

You can always `sitrep()` to receive some information on whether
an update is necessary.

```r
leprechaun::sitrep()
```

```
# all good
✔ Scaffold version and installed leprechaun version match (1.0.1): all is well!

# update may be considered
! You have leprechaun version 1.0.1.9000 installed but the project uses 1.0.0
ℹ You may want to run  `update_scaffold()`
```

## Update

From the root of your application using leprechaun,
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
