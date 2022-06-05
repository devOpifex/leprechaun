# leprechaun 1.0.0.9000

- Allow ignoring files in `assets`.

# leprechaun 1.0.0

- Added roclet for build command
- Added utils to enable and disable selectize js
- Added comment to `app.R` for RStudio Deploy button
- Fix input handler for list.
- Fix registering of input handles; done `.onAttach`.
- Fix `force` argument in `update_scaffold`.
- Lock file store Bootstrap version used.
- HTML utils depends on the version of Bootstrap used.
- Add tests
- Added warning comments to all template files.
- Added examples
- Assets supports added for serving `type = module`
- Add `tag2` convenience function to htmltools plugin
- Add `run_dev` function that runs the build step before
the launching the app.
- Changed `build` message when nothing is to be built
- Added `add_app_file` function
- Scaffold also add `_disable_autoload.R` file.
- Keep ui file name consistent regardless of whether the app
was created with `fluidPage` or `navbarPage`: always create
`ui.R`.
- `send_message` also appends `-` to namespace in `ns2`.
- Added input handlers in scaffold.
- Fix update of endpoint utilities.
- Added `sitrep` to report on the situation
only prints useful messages.
- Added `prefix` to `make_send_message`.

# leprechaun 0.1.0.9000

- Initial version
