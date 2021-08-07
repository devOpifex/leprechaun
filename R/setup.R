#' Setup Sass
#' 
#' Setup basic structure for sass.
#' 
#' @importFrom cli cli_alert_info
#' @importFrom usethis use_package
#' @importFrom fs dir_copy file_copy
#' 
#' @export 
setup_sass <- function(){
	# basic checks before proceeding
	check_scss()
	check_is_leprechaun()

	# copy files and script
	dir_copy(pkg_file("scss"), "scss")
	copy_file(pkg_file("dev", "sass.R"), c("inst", "dev", "sass.R"))
	cli_alert_info("Creating {.file scss}")
	cli_alert_info("Creating {.file inst/dev/sass.R}")
	use_package("sass", type = "Suggests")
}

#' Check that scss exists
#' 
#' If the scss directory already exists we stop.
#' 
#' @importFrom fs dir_exists
#' @noRd 
#' @keywords internal
check_scss <- function(){
	exists <- dir_exists("scss")

	if(!exists)
		return()

	stop("Directory `scss` already exists", call. = FALSE)
}

#' Setup Packer
#' 
#' @export 
setup_packer <- function(){
	# basic checks before proceeding
	check_packer()
	check_is_leprechaun()

	# copy files and script
	copy_file(pkg_file("dev", "packer.R"), c("inst", "dev", "packer.R"))
	cli_alert_info("Creating {.file inst/dev/packer.R}")
	use_package("sass", type = "Suggests")
}

check_packer <- function(){
	if(file.exists("package.json"))
		return()
	
	stop(
		"This does not appear to be a packer project. ",
		"Run a packer scaffold and try again.",
		call. = FALSE
	)
}