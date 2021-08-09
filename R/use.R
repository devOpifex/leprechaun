#' JavaScript Utils
#' 
#' Add utility JavaScript function, e.g.: to hide or show
#' element in the DOM.
#' 
#' @param overwrite Whether to overwrite existing files.
#' @param quiet Whether to print messages.
#' 
#' @note This requires [plugin_packer].
#' Also, it will require using [build].
#' 
#' @importFrom fs file_exists
#' @importFrom cli cli_alert_success
#' 
#' @export 
use_js_utils <- function(overwrite = FALSE, quiet = FALSE){
	# checks
	check_packer()
	check_is_leprechaun()
	
	if(!has_plugin_build("packer"))
		stop("Missing `packer` plugin, run `plugin_packer()`", call. = FALSE)

	if(!overwrite && file_exists("srcjs/leprechaun-utils.js"))
		stop(
			"Files already exists. Use `overwrite = TRUE` to update."
		)

	# copy files
	copy_file(
		pkg_file("javascript", "utils.js"), 
		c("srcjs", "leprechaun-utils.js")
	)

	copy_file(
		pkg_file("javascript", "javascript.R"),
		c("R", "utils-js.R")
	)

	lock_use("js-utils")
	
	if(!quiet){
		cli_alert_success("Creating {.file srcjs/leprechaun-utils.js}")
		cli_alert_success("Creating {.file R/utils-js.R}")
	}

	# check if it is imported in the index
	index_path <- "srcjs/index.js"
	index <- read_lines(index_path)

	# file not found
	if(!length(index))
		return(invisible())

	# if it's already imported we just skip it
	if(any(grepl("leprechaun-utils.js", index)))
		return(invisible())
	
	if(!quiet)
		cli_alert_success("Added import statement to {.file srcjs/index.js}")
	
	index <- c(
		"import { handleUtils } from './leprechaun-utils.js';", 
		index,
		"handleUtils();"
	)
	writeLines(index, con = index_path)

	require_build()
}

#' Htmltools Utils
#' 
#' Add htmltools utility functions, e.g.: shorthands to
#' create columns.
#' 
#' @param overwrite Whether to overwrite existing files.
#' @param quiet Whether to print messages.
#' 
#' @export 
use_html_utils <- function(overwrite = FALSE, quiet = FALSE){
	# check
	check_is_leprechaun()

	if(!overwrite && file_exists("R/html-utils.R"))
		stop(
			"Files already exists. Use `overwrite = TRUE` to update."
		)
	
	lock_use("html-utils")

	copy_file(
		pkg_file("htmltools", "utils.R"),
		c("R", "html-utils.R")
	)

	add_package("htmltools")

	if(!quiet)
		cli_alert_success("Creating {.file R/html-utils.R}")

	invisible()
}
