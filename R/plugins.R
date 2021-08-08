#' Sass PLugin
#' 
#' Setup basic structure for sass and helper script for
#' bundling.
#' 
#' @importFrom cli cli_alert_info
#' @importFrom fs dir_copy file_copy
#' @importFrom usethis use_build_ignore
#' 
#' @export 
plugin_sass <- function(){
	# basic checks before proceeding
	check_scss()
	check_is_leprechaun()

	# copy files and script
	dir_copy(pkg_file("scss"), "scss")
	copy_file(pkg_file("dev", "sass.R"), c("inst", "dev", "sass.R"))
	cli_alert_info("Creating {.file scss}")
	cli_alert_info("Creating {.file inst/dev/sass.R}")
	add_package("sass", type = "Suggests")
	use_build_ignore("scss")
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

#' Packer Plugin
#' 
#' Setup a packer script to easily bundle the JavaScipt.
#' 
#' @note This requires a scaffold of packer already in place.
#' 
#' @importFrom cli cli_alert_info
#' 
#' @export 
plugin_packer <- function(){
	# basic checks before proceeding
	check_packer()
	check_is_leprechaun()

	# copy files and script
	copy_file(pkg_file("dev", "packer.R"), c("inst", "dev", "packer.R"))
	cli_alert_info("Creating {.file inst/dev/packer.R}")
	add_package("packer", type = "Suggests")
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

#' Config Plugin
#' 
#' Setup a configuration file and helper functions.
#' 
#' @importFrom cli cli_alert_info
#' 
#' @export 
plugin_config <- function(){
	# basic checks before proceeding
	check_config()
	check_is_leprechaun()

	tmp_read_replace_write(
		pkg_file("config", "config.R"),
		"R/config.R"
	)
	copy_file(
		pkg_file("config", "config.yml"),
		c("inst", "config.yml")
	)
	cli_alert_info("Creating {.file inst/config.R}")
	cli_alert_info("Creating {.file inst/config.yml}")
	add_package("yaml")
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
