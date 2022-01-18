## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

> Please add more details about the package functionality and implemented
> methods in your Description text.
> 
> Please add \value to .Rd files regarding exported methods and explain
> the functions results in the documentation. Please write about the
> structure of the output (class) and also what the output means. (If a
> function does not return a value, please document that too, e.g.
> \value{No return value, called for side effects} or similar)
> Missing Rd-tags in up to 18 .Rd files, e.g.:
>       add_app_file.Rd: \value
>       add_module.Rd: \value
>       build_roclet.Rd: \value
>       build.Rd: \value
>       create_assets.Rd: \value
>       ...
> 
> 
> Please fix and resubmit.

All exported function have `\value{}` and the `DESCRIPTION`
was improved.
