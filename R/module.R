#' Add module
#' 
#' Add boilerplate for a module.
#' 
#' @param name Name of the module.
#' This is used to dynamically create the names of the
#' functions and file.
#' 
#' @examples 
#' \dontrun{add_module("module_name")}
#' 
#' @importFrom fs file_exists
#' @importFrom cli cli_alert_success
#' 
#' @export 
add_module <- function(name){
	check_is_leprechaun()

	if(missing(name))
		stop("Missing `name`", call. = FALSE)

	if(grepl(" ", name))
		stop("Module name may not include spaces", call. = FALSE)

	path <- sprintf("R/module_%s.R", name)

	if(file_exists(path))
		stop(
			sprintf("File `%s` already exists.", path),
			call. = FALSE
		)

	cli_alert_success("Creating {.file {path}}")
	tmp_read_replace_write(
		pkg_file("module", "module.R"),
		path,
		module = name
	)
}