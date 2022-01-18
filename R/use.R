#' JavaScript Utils
#' 
#' Add utility JavaScript function, e.g.: to hide or show
#' element in the DOM.
#' 
#' @param overwrite Whether to overwrite existing files.
#' @param quiet Whether to print messages.
#' 
#' @note This requires [use_packer].
#' Also, it will require using [build].
#' 
#' @examples 
#' \dontrun{use_js_utils()}
#' 
#' @importFrom fs file_exists
#' @importFrom cli cli_alert_success
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_js_utils <- function(overwrite = FALSE, quiet = FALSE){
	# checks
	check_packer()
	check_is_leprechaun()
	
	if(!has_build("packer"))
		stop("Missing `packer`, run `use_packer()`", call. = FALSE)

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
		return(invisible(FALSE))

	# if it's already imported we just skip it
	if(any(grepl("leprechaun-utils.js", index)))
		return(invisible(FALSE))
	
	if(!quiet)
		cli_alert_success("Added import statement to {.file srcjs/index.js}")
	
	index <- c(
		"import { handleUtils } from './leprechaun-utils.js';", 
		index,
		"handleUtils();"
	)
	writeLines(index, con = index_path)

	require_build()
	invisible(TRUE)
}

#' Htmltools Utils
#' 
#' Add htmltools utility functions, e.g.: shorthands to
#' create columns.
#' 
#' @param overwrite Whether to overwrite existing files.
#' @param quiet Whether to print messages.
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_html_utils <- function(overwrite = FALSE, quiet = FALSE){
	check_is_leprechaun()

	if(!overwrite && file_exists("R/html-utils.R"))
		stop(
			"Files already exists. Use `overwrite = TRUE` to update."
		)
	
	lock_use("html-utils")

	source_file <- get_html_utils_file()
	copy_file(
		pkg_file("htmltools", source_file),
		c("R", "html-utils.R")
	)

	add_package("htmltools")

	if(!quiet)
		cli_alert_success("Creating {.file R/html-utils.R}")

	invisible(TRUE)
}

#' Endpoints
#' 
#' Add utility functions to create and serve
#' session-specific endpoints.
#' 
#' @param overwrite Whether to overwrite existing files.
#' @param quiet Whether to print messages.
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_endpoints_utils <- function(overwrite = FALSE, quiet = FALSE){
	# check
	check_is_leprechaun()

	if(!overwrite && file_exists("R/endpoint-utils.R"))
		stop(
			"Files already exists. Use `overwrite = TRUE` to update."
		)
	
	lock_use("endpoint-utils")

	copy_file(
		pkg_file("endpoints", "api.R"),
		c("R", "endpoint-utils.R")
	)

	add_package("jsonlite")

	if(!quiet)
		cli_alert_success("Creating {.file R/endpoint-utils.R}")

	invisible(TRUE)
}

#' Sass
#' 
#' Setup basic structure for sass and helper script for
#' bundling.
#' 
#' @param quiet Whether to print messages.
#' 
#' @note This will require using [build].
#' 
#' @importFrom cli cli_alert_success
#' @importFrom fs dir_copy file_copy
#' @importFrom usethis use_build_ignore
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_sass <- function(quiet = FALSE){
	# basic checks before proceeding
	check_scss()
	check_is_leprechaun()
	
	if(!quiet){
		cli_alert_success("Creating {.file scss}")
		cli_alert_success("Creating {.file inst/dev/sass.R}")
	}

	# copy files and script
	dir_copy(pkg_file("scss"), "scss")
	use_sass_overwritable()
	add_package("sass", type = "Suggests")
	use_build_ignore("scss")

	require_build()
	invisible(TRUE)
}

use_sass_overwritable <- function(){
	copy_file(pkg_file("dev", "sass.R"), c("inst", "dev", "sass.R"))
	lock_use("sass", get_pkg_version())
}

#' Check that scss exists
#' 
#' If the scss directory already exists we stop.
#' 
#' @importFrom fs dir_exists
#' 
#' @noRd 
#' @keywords internal
check_scss <- function(){
	exists <- dir_exists("scss")

	if(!exists)
		return()

	stop("Directory `scss` already exists", call. = FALSE)
}

#' Packer
#' 
#' Setup a packer script to easily bundle the JavaScipt.
#' 
#' @param quiet Whether to print messages.
#' 
#' @note This requires a scaffold of packer already in place.
#' Also, this will require using [build].
#' 
#' @importFrom cli cli_alert_success
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_packer <- function(quiet = FALSE){
	# basic checks before proceeding
	check_packer()
	check_is_leprechaun()

	# copy files and script
	copy_file(pkg_file("dev", "packer.R"), c("inst", "dev", "packer.R"))

	if(!quiet)
		cli_alert_success("Creating {.file inst/dev/packer.R}")

	add_package("packer", type = "Suggests")
	lock_use("packer", get_pkg_version())

	require_build()
	invisible(TRUE)
}

#' Check Whether it is a packer project
#' 
#' Checks whether the current project was scaffolded with
#' packer, throws an error if not.
#' 
#' @importFrom fs file_exists
#' 
#' @noRd 
#' @keywords internal
check_packer <- function(){
	if(!requireNamespace("packer", quietly = TRUE))
		stop(
			"This requires the packer package:\n`install.packages('packer')`",
			call. = FALSE
		)

	if(file_exists("package.json"))
		return()
	
	stop(
		"This does not appear to be a packer project.\n",
		"Create a packer scaffold and try again.",
		call. = FALSE
	)
}

#' Config
#' 
#' Setup a configuration file and helper functions.
#' 
#' @param quiet Whether to print messages.
#' 
#' @importFrom cli cli_alert_success
#' 
#' @return Invisibly returns a boolean indicating whether
#' the operation was successful.
#' 
#' @export 
use_config <- function(quiet = FALSE){
	# basic checks before proceeding
	check_config()
	check_is_leprechaun()

	use_config_overwritable()
	copy_file(
		pkg_file("config", "config.yml"),
		c("inst", "config.yml")
	)

	if(!quiet){
		cli_alert_success("Creating {.file inst/config.R}")
		cli_alert_success("Creating {.file inst/config.yml}")
	}

	add_package("yaml")
}

use_config_overwritable <- function(){
	tmp_read_replace_write(
		pkg_file("config", "config.R"),
		"R/config.R"
	)
	lock_use("config", get_pkg_version())
	invisible(TRUE)
}

#' Check that config does not exists
#' 
#' Check that the config file does not already exist,
#' throws an error if it does.
#' 
#' @importFrom fs file_exists
#' 
#' @noRd 
#' @keywords internal
check_config <- function(){
	if(!file_exists("inst/config.yml"))
		return()	

	stop(
		"`inst/config.yml` already exists.",
		call. = FALSE
	)
}

#' Has Build
#' 
#' Checks whether a use build step is in place.
#' 
#' @importFrom fs file_exists
#' 
#' @noRd 
#' @keywords internal
has_build <- function(which){
	if(missing(which))
		stop("Missing `which`", call. = FALSE)

	file_exists(sprintf("inst/dev/%s.R", which))
}
