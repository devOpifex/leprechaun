#' Add module
#' 
#' Add boilerplate for a module.
#' 
#' @param name Name of the module.
#' This is used to dynamically create the names of the
#' functions and file.
#' 
#' @importFrom fs file_exists
#' @importFrom cli cli_alert_info
#' 
#' @export 
add_module <- function(name){
	check_is_leprechaun()

	if(missing(name))
		stop("Missing `name`", call. = FALSE)

	path <- sprintf("R/module_%s.R", name)

	if(file_exists(path))
		stop(
			sprintf("File `%s` already exists.", path)
		)

	cli_alert_info("Creating {.file {path}}")
	tmp_read_replace_write(
		pkg_file("module", "module.R"),
		path,
		module = name
	)
}