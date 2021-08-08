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

<Note type="danger">
Always back-up or commit your code before updating!
</Note>

This will update the generated code.
