# Build

Some plugins may require a build step. Those are indicated by a warning when adding the plugin to your project.

This is because some plugins or additional features may require
actions such as compiling, or transpiling. For instance, when
using sass, one will want to recompile the CSS from the sass 
code after changes were made.

<Note type="warning">
Do not call this function from within the app.
It helps build things, not run them.
</Note>

Plugins will essentially add scripts to perform said actions in
the directory `inst/dev`. The function `leprechaun::build()` can then be used to run
those scripts.

Importantly, these are only meant to run when build the app/package,
before or while the app is running!
